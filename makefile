ARCH := $(shell uname -m)
MODULE_NAME := $(shell cat environment.yml | grep name | cut -d ' ' -f 2)

ifeq ($(ARCH), arm64)
	CONDA_PLATFORM := --platform osx-arm64
else ifeq ($(ARCH), x86_64) && [ "$(shell uname)" = "Darwin" ]
	CONDA_PLATFORM := --platform osx-64
else ifeq ($(ARCH), x86_64) && [ "$(shell uname)" = "Darwin" ]
	CONDA_PLATFORM := --platform linux-64
else ifeq ($(ARCH), aarch64)
	CONDA_PLATFORM := --platform linux-aarch64
else 
	CONDA_PLATFORM := ""
endif


dev-setup:
	if ! conda env list | grep -q "^$(MODULE_NAME)"; then conda env create $(CONDA_PLATFORM) -f environment.yml; fi;