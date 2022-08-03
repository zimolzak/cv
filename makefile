FILES = zimolzak-cv.pdf zimolzak-cv.docx zimolzak-cv.tex README.md pandocme.tex

.PHONY: dropbox clean all

all: $(FILES)

zimolzak-cv.tex: zimolzak-cv-pre.tex preprocess.py
	python preprocess.py > $@  # Will contain real addresses, phones.

zimolzak-cv.docx: zimolzak-cv.tex
	pandoc -o $@ $<

zimolzak-cv.pdf : zimolzak-cv.tex
	xelatex $<
	xelatex $<
	cp $@ ~/Dropbox

# The PDF target above will run ONLY if the LaTeX file is changed
# after the PDF. If it depended on target 'dropbox' it would always
# LaTeX the doc, which is unnecessary.

dropbox :
	cp zimolzak-cv.pdf ~/Dropbox

# The phony target above exists so you can force the copy without
# re-LaTeXing and affecting date.




####### New stuff for pandoc -> perl -> README.md

pandocme.tex: zimolzak-cv-pre.tex
	perl -pe 's/\\linebreak\[0\]//g' $< > $@
# Have to remove \linebreak commands BEFORE pandoc receives the .tex

README.md: pandocme.tex postprocess.pl
	pandoc -o $@ $<  # This 1st README will have sections I don't want.
	perl -i postprocess.pl $@  # Cut out sections (edit in place).




clean:
	rm -f $(FILES) *.aux *.log
