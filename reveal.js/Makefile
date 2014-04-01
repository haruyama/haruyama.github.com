all:
mds=$(wildcard *.md)
htmls=$(mds:.md=.html)

.SUFFIXES:	.md .html
.PHONY: all clean

.md.html:
	pandoc -t html5 --template=template-revealjs.html --standalone --section-divs --variable theme="night" --variable transition="none" $< -o $@

all: $(htmls)

clean:
	rm -rf *~
