SRC_DIR := src
BUILD_DIR := build
DIST_DIR := dist
SRC_FILES := $(wildcard $(SRC_DIR)/*.md)
PDF_FILES := $(patsubst $(SRC_DIR)/%.md,$(BUILD_DIR)/%.pdf,$(SRC_FILES))
BUNDLE_PDF := $(DIST_DIR)/bundle.pdf

all: $(PDF_FILES) $(BUNDLE_PDF)

$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.md | $(BUILD_DIR)
	pandoc $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

$(BUNDLE_PDF): $(PDF_FILES) | $(DIST_DIR)
	pdfunite $(PDF_FILES) $@

convert_one: $(BUILD_DIR)/$(file).pdf

.PHONY: all convert_one