# Thomas Dreibholz's LaTeX Toolchain
# Copyright (C) 2007-2011 by Thomas Dreibholz, dreibh@iem.uni-due.de
#
# $Id: Makefile 857 2010-03-02 13:57:37Z dreibh $
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# Contact: dreibh@iem.uni-due.de

pdffiles := $(patsubst Sources/%.dia,PDF/%.pdf,$(wildcard Sources/*.dia))
epsfiles := $(patsubst Sources/%.dia,EPS/%.eps,$(wildcard Sources/*.dia))
svgfiles := $(patsubst Sources/%.dia,SVG/%.svg,$(wildcard Sources/*.dia))
pngfiles := $(patsubst Sources/%.dia,PNG/%.png,$(wildcard Sources/*.dia))
giffiles := $(patsubst Sources/%.dia,GIF/%.gif,$(wildcard Sources/*.dia))
svmfiles := $(patsubst Sources/%.dia,SVM/%.svm,$(wildcard Sources/*.dia))


all:   $(pdffiles)   # $(svgfiles) $(epsfiles) $(pngfiles) $(giffiles) wmffiles $(svmfiles)


$(pdffiles):	PDF/%.pdf: Sources/%.dia dia2pdf
	@find Sources/ -name "*.png" | xargs --no-run-if-empty -n1 -i§ ln -sf § .   # Included bitmap graphics
	./dia2pdf $< $@

$(svgfiles):	SVG/%.svg: Sources/%.dia dia2svg
	@find Sources/ -name "*.png" | xargs --no-run-if-empty -n1 -i§ ln -sf § .   # Included bitmap graphics
	./dia2svg $< $@

$(epsfiles):	EPS/%.eps: Sources/%.dia dia2eps
	@find Sources/ -name "*.png" | xargs --no-run-if-empty -n1 -i§ ln -sf § .   # Included bitmap graphics
	./dia2eps $< $@


$(pngfiles):	PNG/%.png: PDF/%.pdf
	convert -density 300x300 $< -transparent white $@

$(giffiles):	GIF/%.gif: PDF/%.pdf
	convert -density 300x300 $< -transparent white $@


$(svmfiles):   SVM/%.svm: PDF/%.pdf
	pstoedit -f svm $< $@


wmffiles:	$(svgfiles)
	./make-wmf-from-svg >make-wmfs.cmd
	@echo "===== Run make-wmfs.cmd script under Windows to generate WMF files using Inkscape ====="
