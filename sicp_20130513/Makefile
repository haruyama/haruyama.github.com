.SUFFIXES:	.md .html

all: index.html

.md.html:
	pandoc -S -s -f markdown -t slidy -V slidy-url=slidy $< | sed 's/slidy\.js\.gz/slidy.js/' > $@
