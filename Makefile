# Makefile for Latex project
NAME = project
LATEX = pdflatex
BIBTEX = biber

SUBDIRS= img plt
OUTDIR = build
TEX_FLAGS = -file-line-error -interaction=nonstopmode
COM_FLAGS = -output-directory=$(OUTDIR) -quiet
GARBAGE_PATTERNS = *.aux *.bbl *.bcf *.blg *.idx *.ind *.lof *.lot *.log *.xml *.toc

SUB_TEX_FILES = $(foreach D,$(SUBDIRS),$(wildcard $(D)/*.tex))
SUB_PDF_FILES = $(join $(dir $(SUB_TEX_FILES)),$(addprefix $(OUTDIR)/,$(notdir $(SUB_TEX_FILES:tex=pdf))))
GARBAGE = $(foreach D,. $(SUBDIRS), $(wildcard $(addprefix $(D)/$(OUTDIR)/,$(GARBAGE_PATTERNS))))

export TEXINPUTS:=$(CURDIR)\src

std: all tidy

all: bib
	$(LATEX) $(TEX_FLAGS) $(COM_FLAGS) $(NAME).tex
	$(LATEX) -synctex=1 $(TEX_FLAGS) $(COM_FLAGS) $(NAME).tex
	copy /Y $(OUTDIR)\$(NAME).pdf .\

pdf: $(SUB_PDF_FILES)
	$(LATEX) -synctex=1 $(TEX_FLAGS) $(COM_FLAGS) $(NAME).tex

bib: pdf $(OUTDIR)\$(NAME).bcf
	$(BIBTEX) $(COM_FLAGS) $(NAME)

$(SUB_PDF_FILES): $(SUB_TEX_FILES)
	cd $(subst $(OUTDIR)/,,$(dir $@)) && $(LATEX) $(TEX_FLAGS) $(COM_FLAGS) $(notdir $(@:pdf=tex))


clean: tidy
	for %%a in ($(foreach D,$(subst /,\,$(SUB_PDF_FILES)) $(subst .pdf,.synctex.gz,$(subst /,\,$(SUB_PDF_FILES))) $(OUTDIR)\$(NAME).pdf $(OUTDIR)\$(NAME).synctex.gz, "$(D)")) do if exist %%~a del /q %%~a
	for %%a in ($(foreach D,. $(SUBDIRS),"$(D)\$(if $(subst .,,$(OUTDIR)),$(OUTDIR),build)")) do if exist %%~a rmdir /q %%~a
#	if exist $(NAME).pdf del $(NAME).pdf

tidy:
	if exist $(or $(word 1, $(subst /,\,$(GARBAGE))), false) del /q $(subst /,\,$(GARBAGE))