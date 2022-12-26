all:		betterls

betterls:	Makefile *.c *.h import/*.c import/*.h
	cc *.c import/humanize_number.c -DCOLORLS -o betterls -ltermcap

install:	betterls
	@echo
	@echo          "This will install betterls as /usr/local/bin/ls"
	@echo
	@echo          "You can then set up an alias in your shell file, or just ensure that"
	@echo          "/usr/local/bin comes before /bin in your PATH."
	@echo
	@sudo -k cp betterls /usr/local/bin/ls
	@cmp ./betterls /usr/local/bin/ls && printf "\nInstallation successful\n\n" || echo "\nInstallation failed!\n\n"
	@hash -r

.PHONY:		clean
clean:
	rm -fr betterls .DS_Store *.o

.PHONY:		uninstall
uninstall:
	@echo
	@echo          "This will remove /usr/local/bin/ls !"
	@echo
	@sudo -k rm -f /usr/local/bin/ls
	@hash -r