#!/usr/bin/env python3
"""Offline PDF + HTML kiadványépítő, a repó eredeti jegyzeteiből."""
from pathlib import Path
import re
from html import escape
from markdown_it import MarkdownIt
from weasyprint import HTML

ROOT = Path(__file__).resolve().parents[1]
DEST = ROOT / "kiadvany"
CSS = (DEST / "print.css").read_text(encoding="utf8")
MD = MarkdownIt("commonmark", {"html": False}).enable("table")

DOCS = [
    ("Elmélet", "A 16 vizsgatétel, a tételsor sorrendjében", [
        "elmelet/01_06_meres_es_eloszlasok.md",
        "elmelet/07_12_statisztika_regresszio.md",
        "elmelet/13_16_idojel_fft.md",
    ], "Mereselmelet_es_technika_GKLM_FKTM013_Elmelet"),
    ("MATLAB-feladattár", "Konkrét példák és lépésenkénti megoldások", [
        "matlab/peldatar/MEGOLDASOK_01_GEOMETRIA.md",
        "matlab/peldatar/MEGOLDASOK_02_REGRESSZIO.md",
        "matlab/peldatar/MEGOLDASOK_03_IDOJELEK.md",
        "matlab/peldatar/MEGOLDASOK_04_FREKVENCIATER.md",
        "matlab/peldatar/MEGOLDASOK_05_KIEGESZITOK.md",
    ], "Mereselmelet_es_technika_GKLM_FKTM013_MATLAB"),
    ("Képletlap", "A vizsgához legfontosabb összefüggések", [
        "elmelet/KEPLETLAP.md",
    ], "Mereselmelet_es_technika_GKLM_FKTM013_Kepletlap"),
]

def sections(source):
    raw = source.read_text(encoding="utf8")
    # A tételsorban: ## 1. ...; a példatárban: ## A. ...
    start = re.compile(r"(?m)^##\s+(?:(?:\d{1,2})|[A-H])\.\s+")
    match = list(start.finditer(raw))
    if not match:
        return [(source.stem.replace("_", " "), raw)]
    output = []
    for i, m in enumerate(match):
        end = match[i + 1].start() if i + 1 < len(match) else len(raw)
        frag = raw[m.start():end].strip()
        title = frag.splitlines()[0].replace("## ", "").strip()
        output.append((title, frag))
    return output

def make_document(title, subtitle, files, basename):
    pairs=[]
    for relative in files:
        src=ROOT / relative
        if not src.exists():
            raise FileNotFoundError(src)
        pairs.extend(sections(src))
    index = "\n".join(
        f'<div class="idx"><b>{i:02d}</b>{escape(text)}</div>'
        for i, (text, _) in enumerate(pairs, start=1)
    )
    html = [f'''<!doctype html><html lang="hu"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>{escape(title)} · GKLM_FKTM013</title><style>{CSS}</style></head><body>
<section class="cover"><div class="kicker">SZÉCHENYI ISTVÁN EGYETEM · GKLM_FKTM013</div><div class="rule"></div>
<h1>Méréselmélet<br><span>és -technika.</span></h1><p class="lead">{escape(title)}<br>{escape(subtitle)}</p>
<div class="foot">2026/27 · 1. félév</div></section>
<section class="index"><div class="kicker">TARTALOM</div><h2>{escape(title)}</h2>
<p>{escape(subtitle)}. A füzet eredeti, szerkeszthető feladatkidolgozásokból épül.</p>
<div class="index-list">{index}</div>
<div class="page-footer-note">A kiadvány nem az egyetem hivatalos vizsgadokumentuma. A naprakész vizsgarendet külön kell ellenőrizni.</div></section>''']
    for number, (name, frag) in enumerate(pairs, start=1):
        parts=frag.splitlines()
        body="\n".join(parts[1:]).strip()
        html.append(
            f'<section class="topic"><div class="topic-number">{number:02d} / {len(pairs):02d}</div>'
            f'<h2>{escape(name)}</h2><div class="markdown">{MD.render(body)}</div></section>'
        )
    html.append("</body></html>")
    body = "\n".join(html)
    out_html = DEST / f"{basename}.html"
    out_pdf = DEST / f"{basename}.pdf"
    out_html.write_text(body, encoding="utf8")
    HTML(string=body, base_url=str(DEST)).write_pdf(out_pdf)
    print(f"OK: {out_pdf.relative_to(ROOT)} ({out_pdf.stat().st_size} bytes)")
    return out_pdf

if __name__ == "__main__":
    for args in DOCS:
        make_document(*args)
