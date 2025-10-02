# ==========================
# latexmk rc – projektové nastavení
# ==========================

# Výstupní adresář
$out_dir = 'out';

# Engine: pdfLaTeX (hodí se k tvé preambuli s inputenc)
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';

# Automatické běhy, dokud se neustálí reference/TOC
$max_repeat = 5;

# Prohlížeč PDF: Skim na macOS
$pdf_previewer = 'open -a Skim';

# Při -pvc (preview continuous) sleduj změny a rebuilduj
$preview_continuous_mode = 1;

# Pokud používáš biblatex/biber, latexmk to detekuje přes .bcf
# (následující řádek ponech u defaultu; je tu pro případné ladění)
# $bibtex_use = 2;       # 2 = auto (biber preferován, když je .bcf)

# Čistící pravidla (co smazat při latexmk -C)
@clean_ext = (
  'aux','bbl','blg','fls','fdb_latexmk','log','out','synctex.gz','run.xml','bcf',
  'toc','lof','lot','nav','snm','vrb','xdv','dvi','pdfsync','ps','eps','ilg',
  'idx','ind','ist','glg','glo','gls','acn','acr','alg','mw','loa','lox','thm'
);

# (Volitelné) Po úspěšném buildu spustit nějaký příkaz.
# Např. otevřít konkrétní PDF (Skim se stejně zavolá přes $pdf_previewer).
# add_cus_dep('tex','pdf',0,'tex2pdf');

# Pokud chceš mít jistotu, že se vždy otevře konkrétní soubor:
# $postscript_mode = 0; $dvi_mode = 0;  # čistě PDF workflow

# Tip: spuštění "watch" režimu
#   latexmk -pdf -pvc main.tex
# nebo s Makefile:
#   make watch
