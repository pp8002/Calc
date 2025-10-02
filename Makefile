# ==========================
# Makefile pro LaTeX projekt
# ==========================

# Základní proměnné
MAIN      ?= main
OUT       ?= out
LATEXMK   ?= latexmk

# Volby (většinu řeší .latexmkrc, ale necháváme -output-directory pro jistotu)
PDF_FLAGS = -pdf -output-directory=$(OUT)
PVC_FLAGS = -pdf -pvc -output-directory=$(OUT)

# --------------------------
# Cíle
# --------------------------

# Výchozí cíl: jednorázový build
.PHONY: all
all: $(OUT)/$(MAIN).pdf

# Live náhled (automatický rebuild při změně souborů)
.PHONY: watch
watch:
	@mkdir -p $(OUT)
	$(LATEXMK) $(PVC_FLAGS) $(MAIN).tex

# Otevři PDF ve Skim (macOS)
.PHONY: open
open: $(OUT)/$(MAIN).pdf
	@open -a Skim $(OUT)/$(MAIN).pdf

# Rychlý build bez otevření
.PHONY: build
build: $(OUT)/$(MAIN).pdf

# Vyčištění pomocných souborů (ponechá PDF)
.PHONY: clean
clean:
	$(LATEXMK) -c -output-directory=$(OUT)
	@find $(OUT) -name "*.synctex.gz" -delete || true

# Kompletní vyčištění (smaže i PDF)
.PHONY: distclean
distclean:
	$(LATEXMK) -C -output-directory=$(OUT)
	@find $(OUT) -name "*.synctex.gz" -delete || true

# Pomocník: vytvoř prázdnou složku out/, když ji chceš verzovat s .gitkeep
.PHONY: init
init:
	@mkdir -p $(OUT)
	@touch $(OUT)/.gitkeep

# Nápověda
.PHONY: help
help:
	@echo "Makefile cíle:"
	@echo "  make            → jednorázový build ($(OUT)/$(MAIN).pdf)"
	@echo "  make build      → totéž, explicitně"
	@echo "  make watch      → live náhled (latexmk -pvc)"
	@echo "  make open       → otevřít PDF ve Skim"
	@echo "  make clean      → smazat pomocné soubory v $(OUT)"
	@echo "  make distclean  → smazat i PDF v $(OUT)"
	@echo "  make init       → vytvořit složku $(OUT) s .gitkeep"

# --------------------------
# Pravidla
# --------------------------

# Jednorázový build PDF
$(OUT)/$(MAIN).pdf: $(MAIN).tex
	@mkdir -p $(OUT)
	$(LATEXMK) $(PDF_FLAGS) $(MAIN).tex
