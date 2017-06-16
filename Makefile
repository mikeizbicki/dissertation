all: *.tex bibfile.bib
	pdflatex thesis

bibfile.bib: 
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis
