export MAIN_FILE = ./main
export SOURCE_FILES = $(shell find)

.PHONY: run
run: $(MAIN_FILE)
	$(MAIN_FILE)

./main: $(SOURCE_FILES)
	crystal build --no-debug -p ./main.cr