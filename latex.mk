# The M/MP/MF options here create phony Makefile rules in $*.deps, which are
# picked up the the -include *.deps below. The end result is that latexmk
# dynamically generates the list of *all* dependencies for each document it
# builds, so that 'make' will attempt to rebuild the document whenever any of
# those dependencies change.
#
# Idea from
# https://tex.stackexchange.com/questions/318569/makefile-for-a-latex-report
%.pdf: %.tex
	latexmk -pdf -M -MP -MF $*.deps $<

clean-latex:
	latexmk -C

-include *.deps
