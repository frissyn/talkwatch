export RUN_FILE = ./application
export SOURCE_FILES = $(shell find **/*)

.PHONY: run
run: $(RUN_FILE)
	$(RUN_FILE)

./application: $(SOURCE_FILES)
	crystal build --no-debug --progress ./app/application.cr