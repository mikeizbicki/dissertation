all: *.tex 
	pdflatex thesis

bib:
	pdflatex thesis
	bibtex thesis
	pdflatex thesis
	pdflatex thesis
