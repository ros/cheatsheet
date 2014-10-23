#LATEX = latex
LATEX = pdflatex
BIBTEX = bibtex
DVIPS = dvips
PS2PDF = ps2pdf

ROS_CHEAT_NAME = ROScheatsheet
GIT_CHEAT_NAME = GITcheatsheet

PDF_FILES = $(subst dia,pdf,$(shell ls images/*.dia))

all: $(PDF_FILES) $(ROS_CHEAT_NAME).pdf $(GIT_CHEAT_NAME).pdf


%.pdf: %.tex $(PNG_FILES)
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<

%.dvi: %.tex 
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<

%.ps: dvi
	$(DVIPS) -P pdf -f -t a4 $(CHEAT_NAME).dvi > $@

display: $(BASE_NAME).pdf
	evince $(BASE_NAME).pdf &

%.eps: %.dia
	cd `dirname $<` && dia `basename $<` -t eps

%.pdf: %.eps
	epstopdf $<

clean:
	rm -f *.ps *.dvi *.log \
	      *.aux *.blg *.toc \
              missfont.log *.bbl *.pdf \
              *.out

