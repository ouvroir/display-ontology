# Makefile
# Generates VOWL file for visualization in WebVOWL

SHELL := /bin/bash
.PHONY: clean

# Variables
ONTO = ./display-ontology.ttl
VOWL = ./webvowl/data/display.json

all: $(VOWL) $(GRAPH) $(CONVERT)

$(VOWL): $(ONTO)
	@echo "Generate VOWL"
	java -jar owl2vowl.jar -file $(ONTO) -output $@
	@echo "DONE"

clean:
	@echo "foobar"