all:		ls

ls:			Makefile *.c *.h import/*.c import/*.h
	cc *.c import/humanize_number.c -DCOLORLS -o ls -ltermcap

install:	ls
	sudo cp ls /usr/local/bin/ls
	hash -r

.PHONY:		clean
clean:
	rm -fr ls .DS_Store *.o