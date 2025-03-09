# Rule Refresher

**Rule Refresher** is a collection of AI-generated one-pagers providing quick refreshers for board game rules.
It compiles Markdown files into formatted PDFs using Pandoc and XeLaTeX.

## Requirements

Ensure you have the following dependencies installed:

- [Pandoc](https://pandoc.org/) – for converting Markdown files to PDF.
- [XeLaTeX](https://www.tug.org/xetex/) – for advanced PDF typesetting.

## Installation

### Installing Pandoc

You can install Pandoc using your system's package manager:

```sh
# On Debian-based systems
sudo apt-get install pandoc

# On macOS using Homebrew
brew install pandoc
```

### Installing XeLaTeX

XeLaTeX is part of the TeX Live distribution and can be installed with:

```sh
# On Debian-based systems
sudo apt-get install texlive-xetex

# On macOS using Homebrew
brew install --cask mactex
```

## Usage

To compile the Markdown files into a PDF, simply run:

```sh
make
```

This will:
- Convert individual Markdown files (`src/*.md`) into PDFs.
- Generate a bundled PDF (`dist/bundle.pdf`) that combines all Markdown files.

### Customizing the Bundle

By default, **all** Markdown files in the `src/` directory are included in the bundled PDF. However, you can specify which files or folders to include by creating a `.bundleconfig` file in the project root.

#### Using `.bundleconfig`

- Create a `.bundleconfig` file.
- List the Markdown files or directories you want to include, one per line.
- A sample configuration is provided in `.bundleconfig.example` to help you get started.

If `.bundleconfig` exists, only the listed files and directories will be included in the bundle.

## Cleaning Up

To remove all generated files (PDFs and build artifacts), run:

```sh
make clean
```
