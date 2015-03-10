SHELL := /bin/bash

.PHONY : all
all : index

.PHONY : index
index : index.html
index.html : index.rst
	@rst2html $^ > $@

.PHONY : clean
clean :
	@rm -f index.html
