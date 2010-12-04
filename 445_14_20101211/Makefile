all: pdf s5

pdf:
	rst2pdf -s ja,nyo index.rst -o index.pdf

s5:
	rst2s5.py --theme small-black index.rst index.html
