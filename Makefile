CC=cc
POSTPROCESS=echo
CFLAGS=
BUILD_DIR=out
INSTALL_DIR=/usr/bin
MANPAGE_DIR=/usr/local/share/man/man1/

bin2h: src/bin2h.o
	@mkdir -p $(BUILD_DIR)
	$(CC)    -o $(BUILD_DIR)/bin2h $(CFLAGS) src/bin2h.o
	@$(POSTPROCESS) bin2h

install:
	@sudo cp out/bin2h $(INSTALL_DIR)
	@sudo cp doc/bin2h.1 $(MANPAGE_DIR)
	@make clean

uninstall:
	@sudo rm -f $(INSTALL_DIR)/bin2h
	@sudo rm -f $(MANPAGE_DIR)/bin2h.1

clean:
	-rm -rf $(BUILD_DIR)
	-rm -f src/*.o

.PHONY: clean
