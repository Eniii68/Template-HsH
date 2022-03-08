# Makefile for Latex project
NAME = example
PDFLATEX = pdflatex
BIBTEX = bibtex

# OUTDIR needs to be at least this, can not be empty:
OUTDIR = .
AUXDIR = .aux
IGNORE = src/% chap/%
GARBAGE_PATTERNS = *.aux *.bbl *.bcf *.blg *.idx *.ind *.lof *.lot *.log *.xml *.toc *.synctex(busy) *.synctex.gz(busy)

# comment this out to get all outputs:
QUIET = -quiet
TEX_FLAGS = -file-line-error -interaction=nonstopmode -aux-directory=$(dir $@)$(OUTDIR)/$(AUXDIR) -output-directory=$(dir $@)$(OUTDIR)

# this grabs all subfiles it can find
SUB_TEX_FILES = $(filter-out $(IGNORE),$(wildcard **/*.tex))
SUB_SVG_FILES = $(filter-out $(IGNORE),$(wildcard **/*.svg))
# and makes a big list of prerequisits
SUB_FILES = $(SUB_TEX_FILES:tex=pdf) $(SUB_SVG_FILES:svg=pdf_tex)


# get src folder on include path
export TEXINPUTS:=$(CURDIR)\src


all: pdf bib
	$(PDFLATEX) $(TEX_FLAGS) $(QUIET) $(NAME).tex
	$(PDFLATEX) -synctex=1 $(TEX_FLAGS) $(QUIET) $(NAME).tex

pdf: $(SUB_FILES) $(OUTDIR)/$(NAME).pdf

bib: $(OUTDIR)/$(AUXDIR)/$(NAME)-blx.bib
	$(BIBTEX) $(QUIET) -include-directory=$(AUXDIR) $(OUTDIR)/$(AUXDIR)/$(NAME)

# generel latex call
%.pdf: %.tex
	$(PDFLATEX) $(TEX_FLAGS) $(QUIET) $*.tex

# generell inkscape call
%.pdf_tex: %.svg
	inkscape -C --export-latex $*.svg -o $*.pdf

# little hack if temp files are not present
%-blx.bib: $(NAME).tex
	if exist $(NAME).pdf del $(NAME).pdf
	$(MAKE) pdf


# These are NOT portable!!
clean: tidy
	for %%a in ($(subst /,\,$(SUB_FILES) $(SUB_SVG_FILES:svg=pdf))) do if exist %%~a del /s/q %%~a
	if exist $(OUTDIR)\$(NAME).synctex.gz del $(OUTDIR)\$(NAME).synctex.gz
	if exist $(OUTDIR)\$(NAME).pdf del $(OUTDIR)\$(NAME).pdf

tidy:
	for %%a in ($(OUTDIR)\$(AUXDIR) $(subst /,\,$(wildcard **/$(AUXDIR)))) do if exist %%~a rmdir /s/q %%~a
	for %%a in ("$(wildcard $(GARBAGE_PATTERNS))") do if exist %%~a del /s/q %%~a
