# Makefile
# Generates Display ontology specification documents
SHELL := /bin/bash

# paths
ontFile 	= ./display-ontology.ttl
outFolder = ./docs/

.PHONY: docs
docs:
	@echo "Build specification"
	java -jar ./bin/widoco.jar \
  -getOntologyMetadata \
  -displayDirectImportsOnly \
  -excludeProvenance \
  -ignoreIndividuals \
  -htaccess \
  -lang en \
  -licensius \
  -ontFile $(ontFile) \
  -outFolder $(outFolder) \
  -rewriteAll \
  -webVowl
	@echo "DONE"

.PHONY: copysrc
copysrc:
	cp -f ./src/* ./docs/sections/
	cp -f ./docs/index-en.html ./docs/index.html

authorsOrder:
	@bash order.sh

###############################################
# make build
# commande exécutée sur la machine virtuelle
.PHONY: build
build: docs copysrc authorsOrder

