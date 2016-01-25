#!/bin/bash

File="thesis"

ruby panruby.rb latex $File ../tdissertation.tex

# latex erzeugen
pdflatex $File
bibtex $File
pdflatex $File
pdflatex $File
pdflatex $File
