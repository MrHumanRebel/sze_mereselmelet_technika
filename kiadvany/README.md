# Kiadványok

A teljes elméleti és MATLAB-felkészítő **nyomtatható PDF-ben** és **offline HTML-ben** is elkészül. Egységes, letisztult tipográfia, visszafogott színezés, A4 oldalméret és tartalomjegyzék.

| Kiadvány | PDF | HTML |
|---|---|---|
| Elméleti jegyzet (16 tétel) | [Megnyitás](Mereselmelet_es_technika_GKLM_FKTM013_Elmelet.pdf) | [Offline HTML](Mereselmelet_es_technika_GKLM_FKTM013_Elmelet.html) |
| MATLAB-feladattár és megoldások | [Megnyitás](Mereselmelet_es_technika_GKLM_FKTM013_MATLAB.pdf) | [Offline HTML](Mereselmelet_es_technika_GKLM_FKTM013_MATLAB.html) |
| Képletlap | [Megnyitás](Mereselmelet_es_technika_GKLM_FKTM013_Kepletlap.pdf) | [Offline HTML](Mereselmelet_es_technika_GKLM_FKTM013_Kepletlap.html) |

## Újragenerálás

Python 3.11+, WeasyPrint és markdown-it-py szükséges.

\`\`\`bash
pip install weasyprint markdown-it-py
python kiadvany/build.py
\`\`\`

A GitHub Actions újragenerálja az állományokat, amikor a tananyag vagy a stílus módosul. A \`kiadvany/print.css\` tartalmazza a kiadvány vizuális szabályait. A PDF-ek tartalma a repó aktuális Markdown-jegyzeteiből származik, ezért a két formátum együtt tartható karban.

**Megjegyzés:** a dokumentumok saját kidolgozású tanulási segédletek, nem az egyetemi kiadványok szó szerinti másolatai.
