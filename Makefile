# Makefile for paper
#
# Dongkee LEE, <etourist@gmail.com>

# macros
title  = cv
papers = $(title).tex
bibs   = mypapers.bib
latex  = pdflatex 


all: pdf

pdf: dvi 
	#ps2pdf $(title).ps
#	dvipdf $(title) 
#	dvipdfmx -p letter $(title).dvi
#	ps2pdf $(title).ps

dvi : $(papers)
	$(latex) $(papers)
	bibtex $(title)
	#bibtex $(title) 
	$(latex)  $(papers)
	$(latex)  $(papers)
	#$(latex)  $(papers)

ps: dvi
	dvips -t letter -o $(title).ps $(title)

show:
	xdvi $(title).dvi &

fig:
	xfig &

clean:
	rm -rf $(title).log $(title).bbl $(title).blg $(title).dvi
	rm -rf $(title).pdf $(title).ps $(title).aux
