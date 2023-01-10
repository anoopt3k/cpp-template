MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_NAME := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
BUILD_DIR := _build
EXE := $(BUILD_DIR)/bin/$(PROJECT_NAME)

.PHONY: build test clean run

all: build

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

build: $(BUILD_DIR)
	conan install -if $(BUILD_DIR) .
	cmake . -B $(BUILD_DIR)
	cmake --build $(BUILD_DIR) 

test:
	pushd $(BUILD_DIR)
	ctest --output-on-failure
	popd

clean:
	rm -rf $(BUILD_DIR)

run: 
	$(EXE)