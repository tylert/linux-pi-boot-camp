SHELL := /bin/bash

SOURCE_DIR = source
BUILD_DIR = .

GENERATED_FILES = $(BUILD_DIR)/index.html $(BUILD_DIR)/location.html \
  $(BUILD_DIR)/volunteers.html

.PHONY : all
all : $(GENERATED_FILES)

$(BUILD_DIR)/%.html : $(SOURCE_DIR)/%.rst $(SOURCE_DIR)/menu
	@rst2html --date --time $< > $@

.PHONY : clean
clean :
	@rm -f $(GENERATED_FILES)
