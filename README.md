# Rule Refresher

Rule Refresher is a set of AI-generated one-pagers containing a refresher for board game rules.

## Requirements

- [Pandoc](https://pandoc.org/)
- [pdfunite](https://manpages.ubuntu.com/manpages/bionic/man1/pdfunite.1.html)
- [XeLaTeX](https://www.tug.org/xetex/)

## Installation

To install the required dependencies, you can use the following commands:

### Pandoc

For most systems, you can install Pandoc using the package manager:

```sh
# On Debian-based systems
sudo apt-get install pandoc

# On macOS using Homebrew
brew install pandoc
```

### pdfunite

For most systems, you can install pdfunite using the package manager:

```sh
# On Debian-based systems
sudo apt-get install poppler-utils

# On macOS using Homebrew
brew install poppler
```

### XeLaTeX

XeLaTeX can also be installed via package managers. It is part of the TeX Live distribution:

```sh
# On Debian-based systems
sudo apt-get install texlive-xetex

# On macOS using Homebrew
brew install --cask mactex
```

## Usage

Use the provided `Makefile` to compile the Markdown files to PDFs.

```sh
make
```
