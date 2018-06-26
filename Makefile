#!/usr/bin/make -f

adocs = $(wildcard doc/*.adoc)
htmls = $(adocs:.adoc=.html)
pdfs  = $(adocs:.adoc=.pdf)

all: doc
doc: html pdf

html: ${htmls}
pdf: ${pdfs}

clean:
	rm -rf doc/*.html doc/*.pdf doc/*.png doc/*.cache doc/.asciidoctor

%.html: %.adoc Makefile
	asciidoctor -b html5 -r asciidoctor-diagram -o $@ $< -a imagesdir="." -a imagesoutdir="."

%.pdf: %.adoc Makefile
	asciidoctor-pdf -r asciidoctor-diagram -o $@ $< -a imagesdir="." -a imagesoutdir="."

# EOF
