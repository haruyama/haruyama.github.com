all: s5

s5: index.md
	pandoc -S -s -f markdown -t s5 -V s5-url=ui/default index.md -o index.html
	pandoc -S -s -f markdown -t s5 -V s5-url=ui/default index.en.md -o index.en.html
#     pandoc -S -s -f markdown -t s5 -V s5-url=ui/small-black index.md -o index.html

