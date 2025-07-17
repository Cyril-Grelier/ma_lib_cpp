PROJECT_NAME = my_lib
CMAKE_BUILD_DIR = build
CLANG_TIDY = clang-tidy-19
CPPCHECK = cppcheck
CLANG_FORMAT = clang-format-15
COMPILER = gcc-13  # default compiler
LIB_SRC_DIR = lib/src
LIB_HEADER_DIR = lib/include
EXAMPLES_DIR = examples
TESTS_DIR = tests
CATCH2_INCLUDE_DIR1 = build/_deps/catch2-src/src
CATCH2_INCLUDE_DIR2 = build/_deps/catch2-build/generated-includes
BUILD_TESTS = OFF # ON

SRC_FILES := $(wildcard $(LIB_SRC_DIR)/*.cpp) $(wildcard $(EXAMPLES_DIR)/*.cpp) $(wildcard $(TESTS_DIR)/*.cpp)
HEADER_FILES := $(wildcard $(LIB_HEADER_DIR)/*.h)
INCLUDE_DIRS = -I$(LIB_HEADER_DIR) -I$(CATCH2_INCLUDE_DIR1) -I$(CATCH2_INCLUDE_DIR2)

.PHONY: all
all: build

.PHONY: build
build:
	@echo "==> Building in Debug mode with $(COMPILER)..."
	rm -rf $(CMAKE_BUILD_DIR)
	mkdir $(CMAKE_BUILD_DIR)
	cmake -B $(CMAKE_BUILD_DIR) -DCMAKE_CXX_COMPILER=$(COMPILER) -DCMAKE_BUILD_TYPE=Debug -DBUILD_TESTS=$(BUILD_TESTS)
	cmake --build $(CMAKE_BUILD_DIR)

.PHONY: build-release
build-release:
	@echo "==> Building in Release mode with $(COMPILER)..."
	rm -rf $(CMAKE_BUILD_DIR)
	mkdir $(CMAKE_BUILD_DIR)
	cmake -B $(CMAKE_BUILD_DIR) -DCMAKE_CXX_COMPILER=$(COMPILER) -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=$(BUILD_TESTS)
	cmake --build $(CMAKE_BUILD_DIR)

.PHONY: clean
clean:
	@echo "==> Cleaning build directory..."
	rm -rf $(CMAKE_BUILD_DIR)

.PHONY: lint
lint:
	@echo "==> Running clang-tidy..."
	@for file in $(SRC_FILES); do \
		$(CLANG_TIDY) $$file -- $(INCLUDE_DIRS) || true; \
	done
	@echo "==> Running cppcheck..."
	$(CPPCHECK) $(LIB_SRC_DIR) --enable=all --inconclusive --std=c++23 --language=c++ --template=gcc --suppress=unusedFunction $(INCLUDE_DIRS)

.PHONY: format
format:
	@echo "==> Running clang-format on source and headers..."
	$(CLANG_FORMAT) -i $(SRC_FILES) $(HEADER_FILES)

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build          - Clean and build in Debug mode with default compiler ($(COMPILER))"
	@echo "  build-release  - Clean and build in Release mode with default compiler ($(COMPILER))"
	@echo "  clean          - Remove build directory"
	@echo "  lint           - Run clang-tidy and cppcheck"
	@echo "  format         - Format source code using clang-format"
	@echo "  help           - Show this help message"
	@echo ""
	@echo "You can override the compiler by calling make with COMPILER=<compiler_name>"
	@echo "For example:"
	@echo "  make build COMPILER=gcc-14"
	@echo "  make build-release COMPILER=clang-19"
	@echo "You can also build with the tests with BUILD_TESTS=ON or change in the CMakeLists.txt file"
