# Makefile for Latex project

NAME = project
LATEX = pdflatex
BIB = biber

OUTDIR = .\build

export TEXINPUTS:=.\src


pdf: $(NAME).tex
	$(LATEX) -synctex=1 -interaction=nonstopmode -file-line-error -include-directory=.\src -output-directory=$(OUTDIR) $(NAME).tex


clean: tidy
	if exist $(OUTDIR)\$(NAME).pdf del $(OUTDIR)\$(NAME).pdf
	if exist $(OUTDIR) rmdir $(OUTDIR)

tidy:
	if exist $(OUTDIR)\$(NAME).aux del $(OUTDIR)\$(NAME).aux
	if exist $(OUTDIR)\$(NAME).bbl del $(OUTDIR)\$(NAME).bbl
	if exist $(OUTDIR)\$(NAME).bcf del $(OUTDIR)\$(NAME).bcf
	if exist $(OUTDIR)\$(NAME).blg del $(OUTDIR)\$(NAME).blg
	if exist $(OUTDIR)\$(NAME).idx del $(OUTDIR)\$(NAME).idx
	if exist $(OUTDIR)\$(NAME).ind del $(OUTDIR)\$(NAME).ind
	if exist $(OUTDIR)\$(NAME).lof del $(OUTDIR)\$(NAME).lof
	if exist $(OUTDIR)\$(NAME).lot del $(OUTDIR)\$(NAME).lot
	if exist $(OUTDIR)\$(NAME).out del $(OUTDIR)\$(NAME).out
	if exist $(OUTDIR)\$(NAME).toc del $(OUTDIR)\$(NAME).toc
	if exist $(OUTDIR)\$(NAME).acn del $(OUTDIR)\$(NAME).acn
	if exist $(OUTDIR)\$(NAME).acr del $(OUTDIR)\$(NAME).acr
	if exist $(OUTDIR)\$(NAME).alg del $(OUTDIR)\$(NAME).alg
	if exist $(OUTDIR)\$(NAME).glg del $(OUTDIR)\$(NAME).glg
	if exist $(OUTDIR)\$(NAME).glo del $(OUTDIR)\$(NAME).glo
	if exist $(OUTDIR)\$(NAME).gls del $(OUTDIR)\$(NAME).gls
	if exist $(OUTDIR)\$(NAME).ist del $(OUTDIR)\$(NAME).ist
	if exist $(OUTDIR)\$(NAME).fls del $(OUTDIR)\$(NAME).fls
	if exist $(OUTDIR)\$(NAME).log del $(OUTDIR)\$(NAME).log
	if exist $(OUTDIR)\$(NAME).nav del $(OUTDIR)\$(NAME).nav
	if exist $(OUTDIR)\$(NAME).snm del $(OUTDIR)\$(NAME).snm
	if exist $(OUTDIR)\$(NAME).fdb_latexmk del $(OUTDIR)\$(NAME).fdb_latexmk
	if exist $(OUTDIR)\$(NAME).synctex.gz del $(OUTDIR)\$(NAME).synctex.gz
	if exist $(OUTDIR)\$(NAME).run.xml del $(OUTDIR)\$(NAME).run.xml
	if exist $(OUTDIR)\$(NAME).bc del $(OUTDIR)\$(NAME).bc