# Makefile for Latex project

NAME = test
LATEX = pdflatex
BIBTEX = biber

OUTDIR = build
TEX_FLAGS = -file-line-error -interaction=nonstopmode -include-directory=.\src -quiet
SUB_TEX_FILES = $(wildcard img/*.tex) $(wildcard plt/*.tex)
SUB_PDF_FILES = $(join $(dir $(SUB_TEX_FILES)),$(addprefix $(OUTDIR)/,$(notdir $(SUB_TEX_FILES:tex=pdf))))

GARBAGE_PATTERNS = *.aux *.bbl *.bcf *.blg *.idx *.ind *.lof *.lot *.log *.xml *.toc
GARBAGE = $(foreach D,. $(SUBDIRS), $(wildcard $(addprefix $(D)/$(OUTDIR)/,$(GARBAGE_PATTERNS))))


export TEXINPUTS:=$(CURDIR)\src

all: bib
	$(LATEX) -output-directory=$(OUTDIR) $(TEX_FLAGS) $(NAME).tex
	$(LATEX) -synctex=1 -output-directory=$(OUTDIR) $(TEX_FLAGS) $(NAME).tex

pdf: $(SUB_PDF_FILES)
	$(LATEX) -synctex=1 -output-directory=$(OUTDIR) $(TEX_FLAGS) $(NAME).tex
	copy /Y $(OUTDIR)\$(NAME).pdf .\

bib: pdf $(OUTDIR)\$(NAME).bcf
	$(BIBTEX) -output-directory $(OUTDIR) $(NAME)

$(SUB_PDF_FILES): $(SUB_TEX_FILES)
	$(LATEX) -output-directory=$(dir $@) $(TEX_FLAGS) $(subst build/,$(notdir $(@:pdf=tex)),$(dir $@))


clean: tidy
	for %%a in ($(foreach D,. $(SUBDIRS), "$(D)\$(OUTDIR)")) do rd /s /q %%~a
	if exist $(NAME).pdf del $(NAME).pdf

tidy:
	if exist $(or $(word 1, $(subst /,\,$(GARBAGE))), false) del /q $(subst /,\,$(GARBAGE))