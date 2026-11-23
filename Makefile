# clean_keyboard: lock the Mac keyboard while you wipe it.
# The script declares its own dependencies (PEP 723), and uv installs them.

PREFIX ?= $(HOME)/.local
BINDIR := $(PREFIX)/bin
SCRIPT := clean_keyboard

.PHONY: help deps sync install uninstall check run

help:
	@echo "make deps       install uv if it is missing (via Homebrew)"
	@echo "make sync       fetch the script's Python dependencies"
	@echo "make install    deps + sync, then link $(SCRIPT) into $(BINDIR)"
	@echo "make uninstall  remove the link from $(BINDIR)"
	@echo "make check      check that the script parses"
	@echo "make run        lock the keyboard for 60 seconds"

deps:
	@if command -v uv >/dev/null 2>&1; then \
		echo "uv found: $$(uv --version)"; \
	elif command -v brew >/dev/null 2>&1; then \
		brew install uv; \
	else \
		echo "uv is missing and so is Homebrew."; \
		echo "Install uv: https://docs.astral.sh/uv/getting-started/installation/"; \
		exit 1; \
	fi

sync: deps
	uv sync --script $(SCRIPT)

install: sync
	mkdir -p $(BINDIR)
	ln -sf $(CURDIR)/$(SCRIPT) $(BINDIR)/$(SCRIPT)
	@echo "Linked $(BINDIR)/$(SCRIPT)"

uninstall:
	rm -f $(BINDIR)/$(SCRIPT)

check:
	python3 -c "import ast; ast.parse(open('$(SCRIPT)').read())"

run: sync
	./$(SCRIPT)
