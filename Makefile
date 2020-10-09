#use gmake!
name=gene-best-friends-abstract-itis20
bibname=gene-best-friends-itis20
#bibname=$(name)

.PHONY: all clean

all: $(name).pdf

$(name).pdf: $(name).tex $(name).bbl	
	pdflatex $(name).tex
	pdflatex $(name).tex

$(name).bbl: $(bibname).bib
	pdflatex $(name).tex
	bibtex $(name)	

clean: 
	rm -f $(name).bbl $(name).blg $(name).log $(name).aux $(name).dvi *.gz *~


