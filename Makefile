# ###########################################################################
# #### The NorNet Core Handbook                                          ####
# #### Copyright (C) 2012-2015 Thomas Dreibholz                          ####
# ###########################################################################


NORNET_CONTROL_DIR := ~/src/rn/nornet/nornet-control


all:   pdf   # NorNet-Core-Handbook-optimized.pdf


clean:
	rm -f *.toc *.log *.idx *.ind *.aux *.loa *.out *~ *.dvi */*.bak *.bbl *.blg *.glo *.nlo *.ilg *.lof *.lot *.gls *.nls *.brf

distclean: clean

really-clean: clean
	rm -f *.dvi *.ps *.pdf NorNet-Configuration-Images config.tmp config.tex.tmp

update-config:
	$(NORNET_CONTROL_DIR)/src/Get-NorNet-Configuration -latex -directory=NorNet-Configuration-Images >config.tex.tmp
	./extract-section config.tex.tmp config.tmp BEGIN-OF-SITES-BLOCK END-OF-SITES-BLOCK
	./insert-section Part-Configuration.tex.in config.tmp Part-Configuration.tex BEGIN-OF-SITES-BLOCK END-OF-SITES-BLOCK
	rm -f config.tmp config.tex.tmp

empty-config:
	cp Part-Configuration.tex.in Part-Configuration.tex

ps:	pdf
	pdf2ps NorNet-Core-Handbook.pdf NorNet-Core-Handbook.ps


pdf:
	cd Measurements && $(MAKE) && cd ..
	cd Simulations && $(MAKE) && cd ..
	cd Figures && $(MAKE) && cd ..
	cd Images && $(MAKE) && cd ..
	env TEXINPUTS=./tex: pdflatex -interaction batchmode NorNet-Core-Handbook.tex
	env TEXINPUTS=./tex: bibtex -terse NorNet-Core-Handbook
	env TEXINPUTS=./tex: makeindex NorNet-Core-Handbook.nlo -s nomencl.ist -o NorNet-Core-Handbook.nls
	env TEXINPUTS=./tex: makeindex NorNet-Core-Handbook.idx
	env TEXINPUTS=./tex: pdflatex -interaction batchmode NorNet-Core-Handbook.tex
	env TEXINPUTS=./tex: makeindex NorNet-Core-Handbook.idx
	env TEXINPUTS=./tex: pdflatex -interaction batchmode NorNet-Core-Handbook.tex
	env TEXINPUTS=./tex: makeindex NorNet-Core-Handbook.idx
	env TEXINPUTS=./tex: pdflatex -interaction batchmode NorNet-Core-Handbook.tex
	pdffonts NorNet-Core-Handbook.pdf
	grep Warning NorNet-Core-Handbook.log || true
	grep "too wide" NorNet-Core-Handbook.log || true
	grep " ~.[a-z]" *.tex || true

NorNet-Core-Handbook-optimized.pdf:	pdf
	qpdf --linearize NorNet-Core-Handbook.pdf NorNet-Core-Handbook-optimized.pdf
