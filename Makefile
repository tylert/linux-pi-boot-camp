SHELL := /bin/bash

SOURCE_DIR = source
BUILD_DIR = .

SOURCE_FILES = $(wildcard $(SOURCE_DIR)/*.rst)
GENERATED_FILES = $(BUILD_DIR)/index.html $(BUILD_DIR)/location.html \
  $(BUILD_DIR)/volunteers.html $(BUILD_DIR)/thanks.html

.PHONY : all
all : $(GENERATED_FILES)

$(BUILD_DIR)/%.html : $(SOURCE_DIR)/%.rst $(SOURCE_DIR)/menu $(SOURCE_DIR)/top.css
	@rst2html --stylesheet=$(SOURCE_DIR)/top.css --date --time $< > $@

.PHONY : clean
clean :
	@rm -f $(GENERATED_FILES)
