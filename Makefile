SRC_DIR := src
BUILD_DIR := build
DIST_DIR := dist
SRC_FILES := $(wildcard $(SRC_DIR)/*.md)

BUNDLE_CONFIG_FILE := .bundleconfig
ifneq ("$(wildcard $(BUNDLE_CONFIG_FILE))","")
    BUNDLE_FILES := $(shell cat $(BUNDLE_CONFIG_FILE) | xargs -I{} find {} -type f -name '*.md')
else
    BUNDLE_FILES := $(SRC_FILES)
endif

PDF_FILES := $(patsubst $(SRC_DIR)/%.md,$(BUILD_DIR)/%.pdf,$(SRC_FILES))
CONFIG_FILES := $(wildcard config/*)
METADATA_FILE := config/metadata.yaml
HEADER_FILE := config/header.tex
SEPARATOR_FILE := config/separator.md
BUNDLE_PDF := $(DIST_DIR)/bundle.pdf

all: $(PDF_FILES) $(BUNDLE_PDF)

$(DIST_DIR)/bundle.pdf: $(BUILD_DIR)/bundle.md $(CONFIG_FILES) | $(DIST_DIR)
	pandoc $< \
		--metadata-file=$(METADATA_FILE) \
		-H $(HEADER_FILE) \
		--pdf-engine=xelatex \
		-o $@

$(BUILD_DIR)/bundle.md: $(BUNDLE_FILES) $(SEPARATOR_FILE) $(BUNDLE_CONFIG_FILE) | $(BUILD_DIR)
	{ for f in $(BUNDLE_FILES); do cat $(SEPARATOR_FILE); echo; cat "$$f"; echo; done; } | sed '$$d' > $@

$(BUILD_DIR)/%.pdf: $(SRC_DIR)/%.md $(CONFIG_FILES) | $(BUILD_DIR)
	pandoc $< \
		--metadata-file=$(METADATA_FILE) \
		-H $(HEADER_FILE) \
		--pdf-engine=xelatex \
		-o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(DIST_DIR):
	mkdir -p $(DIST_DIR)

bundle: $(BUNDLE_PDF)

convert_one: $(BUILD_DIR)/$(file).pdf

clean:
	rm -rf $(BUILD_DIR) $(DIST_DIR)

.PHONY: all convert_one clean