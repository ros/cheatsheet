#LATEX = latex
LATEX = pdflatex
BIBTEX = bibtex
DVIPS = dvips
PS2PDF = ps2pdf

CHEAT_NAME = ROScheatsheet

PDF_FILES = $(subst dia,pdf,$(shell ls images/*.dia))

all: $(PDF_FILES) $(CHEAT_NAME)_catkin.pdf $(CHEAT_NAME)_rosbuild.pdf


$(CHEAT_NAME)_catkin.pdf: /tmp/$(CHEAT_NAME)_catkin.tex $(PNG_FILES)
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<
$(CHEAT_NAME)_rosbuild.pdf: /tmp/$(CHEAT_NAME)_rosbuild.tex $(PNG_FILES)
	$(LATEX) $< && $(LATEX) $< && $(LATEX) $<

/tmp/$(CHEAT_NAME)_catkin.tex: $(CHEAT_NAME).tex
	cp $< $@
/tmp/$(CHEAT_NAME)_rosbuild.tex: $(CHEAT_NAME).tex
	sed 's@^\\catkintrue@%\\catkintrue@' $< | sed 's@^%\\catkinfalse@\\catkinfalse@'  > $@

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
	rm -f $(CHEAT_NAME)_*.ps $(CHEAT_NAME)_*.dvi $(CHEAT_NAME)_*.log \
	      $(CHEAT_NAME)_*.aux $(CHEAT_NAME)_*.blg $(CHEAT_NAME)_*.toc \
              missfont.log $(CHEAT_NAME)_*.bbl $(CHEAT_NAME)_*.pdf \
              $(CHEAT_NAME)_*.out

