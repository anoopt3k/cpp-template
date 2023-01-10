MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_NAME := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
BUILD_DIR := _build
EXE := $(BUILD_DIR)/$(PROJECT_NAME)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

.PHONY: build test clean run

build: $(BUILD_DIR)
	cmake . -B $(BUILD_DIR)
	cmake --build $(BUILD_DIR) 

test:
	pushd $(BUILD_DIR)
	ctest --output-on-failure
	popd

clean:
	rm -rf $(BUILD_DIR)

run: build
	$(EXE)