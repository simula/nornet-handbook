pdffiles := $(patsubst Original/%.pdf,PDF/%.pdf,$(wildcard Original/*.pdf))
pngfiles := $(patsubst Original/%.pdf,PNG/%.png,$(wildcard Original/*.pdf))
giffiles := $(patsubst Original/%.pdf,GIF/%.gif,$(wildcard Original/*.pdf))


all:	$(pdffiles) # $(pngfiles) $(giffiles)


$(pdffiles):	PDF/%.pdf: Original/%.pdf
	./pdf-to-pdfxplore  $< $@

$(pngfiles):    PNG/%.png: PDF/%.pdf
	convert -density 300x300 $< -transparent white $@

$(giffiles):    GIF/%.gif: PDF/%.pdf
	convert -density 300x300 $< -transparent white $@
