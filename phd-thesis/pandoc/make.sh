#!/bin/bash

File="thesis"

pandoc -s -S "$File.md" -f markdown+yaml_metadata_block+grid_tables+table_captions --template="../tdissertation.tex" -o "$File.tex" -t latex --natbib --chapters --bibliography="$File.bib"

# latex erzeugen
pdflatex $File
bibtex $File
pdflatex $File
pdflatex $File
pdflatex $File
