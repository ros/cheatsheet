#LATEX = latex
LATEX = pdflatex
BIBTEX = bibtex
DVIPS = dvips
PS2PDF = ps2pdf

CHEAT_NAME = ROScheatsheet

PDF_FILES = $(subst dia,pdf,$(shell ls images/*.dia))

all: $(PDF_FILES) $(CHEAT_NAME).pdf


$(CHEAT_NAME).pdf: $(CHEAT_NAME).tex $(PNG_FILES)
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<

$(CHEAT_NAME).dvi: $(CHEAT_NAME).tex 
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<

$(CHEAT_NAME).ps: $(CHEAT_NAME).dvi
	$(DVIPS) -P pdf -f -t a4 $(CHEAT_NAME).dvi > $@

display: $(BASE_NAME).pdf
	evince $(BASE_NAME).pdf &

%.eps: %.dia
	cd `dirname $<` && dia `basename $<` -t eps

%.pdf: %.eps
	epstopdf $<

clean:
	rm -f $(CHEAT_NAME).ps $(CHEAT_NAME).dvi $(CHEAT_NAME).log \
	      $(CHEAT_NAME).aux $(CHEAT_NAME).blg $(CHEAT_NAME).toc \
              missfont.log $(CHEAT_NAME).bbl $(CHEAT_NAME).pdf \
              $(CHEAT_NAME).out

