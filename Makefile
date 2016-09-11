all: elephaas.html elephaas.pdf

elephaas.pdf: elephaas.pdf.rst
	rst2pdf -s letter,serif,pdf.css --smart-quotes=2 elephaas.pdf.rst -o elephaas.pdf

elephaas.html: elephaas.rst
	rst2s5 -q --syntax-highlight=short elephaas.rst elephaas.html

elephaas.pdf.rst: elephaas.rst
	sed -e '/\.\. class:: inc/ d' elephaas.rst > elephaas.pdf.rst
	sed -i 's%  \(.. image:: .*/cell\)%\1%' elephaas.pdf.rst

clean:
	rm *.pdf *.html *.pdf.*
