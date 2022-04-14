FILES = zimolzak-cv.pdf zimolzak-cv.docx zimolzak-cv.tex

all: $(FILES)

zimolzak-cv.tex: zimolzak-cv-pre.tex preprocess.py
	python preprocess.py > $@

zimolzak-cv.docx: zimolzak-cv.tex
	pandoc -o $@ $<

zimolzak-cv.pdf : zimolzak-cv.tex
	xelatex $<
	xelatex $<
	cp $@ ~/Dropbox

# The PDF target above will run ONLY if the LaTeX file is changed
# after the PDF. If it depended on target 'dropbox' it would always
# LaTeX the doc, which is unnecessary.

.PHONY: dropbox clean
dropbox :
	cp zimolzak-cv.pdf ~/Dropbox

# The phony target above exists so you can force the copy without
# re-LaTeXing and affecting date.

clean:
	rm -f $(FILES) *.aux *.log
