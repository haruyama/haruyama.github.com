mds=$(wildcard *.md)
htmls=$(mds:.md=.html)

.SUFFIXES:	.md .html
.PHONY: all

.md.html:
	pandoc -S -s -f markdown -t slidy -V slidy-url=slidy $< | sed 's/slidy\.js\.gz/slidy.js/' > $@

all: $(htmls)
