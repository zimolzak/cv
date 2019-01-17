zimolzak-cv.pdf : zimolzak-cv.tex
	xelatex zimolzak-cv.tex
	xelatex zimolzak-cv.tex
	cp zimolzak-cv.pdf ~/Dropbox

# This PDF target will run ONLY if the LaTeX file is changed after the
# PDF. If it depended on target 'dropbox' it would always LaTeX the
# doc, which is unnecessary.

.PHONY: dropbox
dropbox :
	cp zimolzak-cv.pdf ~/Dropbox

# This target exists so you can force the copy.
