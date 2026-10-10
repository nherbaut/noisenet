HUGO ?= hugo
PYTHON ?= python3
BASE_URL ?= http://localhost:1313/
PORT ?= 1313

.PHONY: help site-prepare site-build site-serve site-check

help:
	@echo "make site-build                         Build the website in public/"
	@echo "make site-serve                         Preview at http://localhost:1313/"
	@echo "make site-check                         Build and check internal links"
	@echo "make site-build BASE_URL=https://USER.github.io/REPO/"

site-prepare:
	$(PYTHON) scripts/prepare-site.py

site-build: site-prepare
	$(HUGO) --source site --destination ../public --baseURL "$(BASE_URL)" --minify --cleanDestinationDir

site-serve: site-prepare
	$(HUGO) server --source site --port $(PORT) --baseURL "http://localhost:$(PORT)/" --disableFastRender

site-check: site-build
	$(PYTHON) scripts/check-site.py --base-url "$(BASE_URL)"
