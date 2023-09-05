# Makefile
# Generates VOWL file for visualization in WebVOWL

SHELL := /bin/bash
.PHONY: vowl clean

# paths
ONTO = ./display-ontology.ttl
VOWL = ./webvowl/data/display.json

vowl:
	@echo "Generate VOWL"
	java -jar ./owl2vowl/owl2vowl.jar \
		-file $(ONTO) \
		-output $(VOWL)
	@echo "DONE"

clean:
	@echo "foobar"

build: vowl