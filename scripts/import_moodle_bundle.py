#!/usr/bin/env python3
"""A feltöltött Moodle forráscsomag importálása közvetlenül a GitHub main ágba.

Használat:
    python scripts/import_moodle_bundle.py /utvonal/Mereselmelet_GKLM_FKTM013_teljes_GitHub_import.zip

A script a ZIP-et ellenőrzi, csomagolja, megőrzi az eredeti mappákat, hozzáadja
a MATLAB-adatokat és commitol. Csak tiszta main ágról engedi a push-t.
"""
import argparse
import hashlib
import json
import shutil
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path


def git(repo: Path, *args: str) -> str:
    process = subprocess.run(
        ["git", *args], cwd=repo, capture_output=True, text=True, check=False
    )
    if process.returncode:
        raise RuntimeError(f"git {' '.join(args)}: {process.stderr.strip()}")
    return process.stdout.strip()


def safe_unpack(zip_path: Path, directory: Path) -> None:
    with zipfile.ZipFile(zip_path) as archive:
        for info in archive.infolist():
            destination = (directory / info.filename).resolve()
            if not destination.is_relative_to(directory.resolve()):
                raise ValueError(f"Nem biztonságos ZIP elérési út: {info.filename}")
        archive.extractall(directory)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("zipfile", type=Path, help="A ChatGPT-től letöltött forrásimport ZIP")
    parser.add_argument("--data-only", action="store_true", help="Csak a mérési adatok")
    parser.add_argument("--no-push", action="store_true", help="Commit, GitHub push nélkül")
    args = parser.parse_args()

    repo = Path(__file__).resolve().parents[1]
    if git(repo, "rev-parse", "--abbrev-ref", "HEAD") != "main":
        raise RuntimeError("Importálni csak a main ágon lehet.")
    if git(repo, "status", "--porcelain"):
        raise RuntimeError("A munkakönyvtár nem tiszta. Mentsd a változásokat előbb.")

    bundle = args.zipfile.expanduser().resolve()
    if not bundle.is_file():
        raise FileNotFoundError(bundle)
    git(repo, "pull", "--ff-only", "origin", "main")

    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp)
        safe_unpack(bundle, root)
        manifest = json.loads((root / "FORRAS_MANIFEST.json").read_text(encoding="utf-8"))
        staged = []

        if not args.data_only:
            for entry in manifest["entries"]:
                if entry.get("excluded_public"):
                    continue
                relative = entry["git"]
                source = root / relative
                if (
                    not source.is_file()
                    or source.stat().st_size != entry["size"]
                    or hashlib.sha256(source.read_bytes()).hexdigest() != entry["sha256"]
                ):
                    raise ValueError(f"Hiányzó vagy sérült fájl: {relative}")
                destination = repo / relative
                destination.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(source, destination)
                staged.append(relative)

        for source in (root / "matlab" / "adatok").iterdir():
            if not source.is_file():
                continue
            relative = Path("matlab") / "adatok" / source.name
            destination = repo / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source, destination)
            staged.append(relative.as_posix())

        shutil.copy2(root / "FORRAS_MANIFEST.json", repo / "FORRAS_MANIFEST.json")
        staged.append("FORRAS_MANIFEST.json")

        # Az eredeti bináris adatfájlokat a repó .gitignore alapból kizárja.
        # A -f itt célzottan szükséges, nem terjed át a többi fájlra.
        for path in staged:
            git(repo, "add", "-f", "--", path)

    if not git(repo, "diff", "--cached", "--name-only"):
        print("Minden fájl fent volt, nincs új változás.")
        return 0

    git(repo, "commit", "-m", "data(main): Moodle mérési adatok és eredeti feladatfájlok")
    if not args.no_push:
        git(repo, "push", "origin", "main")
        print("Feltöltés kész: main")
    else:
        print("Commit elkészült; --no-push miatt GitHub feltöltés nélkül.")
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except (OSError, RuntimeError, ValueError, zipfile.BadZipFile) as exc:
        print(f"HIBA: {exc}", file=sys.stderr)
        sys.exit(1)
