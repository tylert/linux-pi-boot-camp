SHELL := /bin/bash

SOURCE_DIR = source
BUILD_DIR = .

SOURCE_FILES = $(wildcard $(SOURCE_DIR)/*.rst) signs/letter_advert.svg
GENERATED_FILES = $(BUILD_DIR)/index.html $(BUILD_DIR)/how_to_get_there.html \
  $(BUILD_DIR)/volunteer_info.html $(BUILD_DIR)/download_links.html \
  signs/letter_advert.pdf signs/letter_advert.png

.PHONY : all
all : $(GENERATED_FILES)

$(BUILD_DIR)/%.html : $(SOURCE_DIR)/%.rst $(SOURCE_DIR)/menu $(SOURCE_DIR)/top.css
	@rst2html --stylesheet=$(SOURCE_DIR)/top.css --date --time $< > $@

signs/%.pdf : signs/%.svg Makefile
	@inkscape --export-pdf=$@ $<

signs/%.png : signs/%.svg Makefile
	@inkscape --export-png=$@ --export-background=white --export-width=400 $<

.PHONY : clean
clean :
	@rm -f $(GENERATED_FILES)
