MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_NAME := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
BUILD_DIR := .build
EXE := $(BUILD_DIR)/bin/$(PROJECT_NAME)
TESTEXE := $(BUILD_DIR)/bin/$(PROJECT_NAME)_test

.PHONY: build test clean run

all: build

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

build: $(BUILD_DIR)
	conan install -if $(BUILD_DIR) .
	cmake . -B $(BUILD_DIR)
	cmake --build $(BUILD_DIR) 

test:
	$(TESTEXE)

clean:
	rm -rf $(BUILD_DIR)

run: 
	$(EXE)