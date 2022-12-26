#
#   SPDX-License-Identifier: BSD-3-Clause
#
#   Copyright (c) 1989, 1993, 1994
#  	The Regents of the University of California.  All rights reserved.
#   Copyright (c) 2022
#  	Joshua Lee Ockert.  All rights reserved.
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions
#   are met:
#   1. Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice, this list of conditions and the following disclaimer in the
#      documentation and/or other materials provided with the distribution.
#   3. Neither the name of the University nor the names of its contributors
#      may be used to endorse or promote products derived from this software
#      without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
#   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#   ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
#   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
#   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
#   OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
#   HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
#   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
#   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#   SUCH DAMAGE.
#  

all:		betterls

betterls:	Makefile *.c *.h import/*.c import/*.h
	cc *.c import/humanize_number.c -DCOLORLS -o betterls -ltermcap

install:	betterls
	@echo
	@echo          "This will install betterls as /usr/local/bin/ls"
	@echo
	@echo          "You can then set up an alias in your shell file, or just ensure that /bin"
	@echo          "comes after /usr/local/bin in your PATH."
	@echo
	@echo          "Use \`man betterls\` to access the man page."
	@echo
	@sudo -K
	@sudo cp betterls /usr/local/bin/ls
	@sudo cp ls.1 /usr/local/share/man/man1/betterls.1
	@cmp ./betterls /usr/local/bin/ls && printf "\nInstallation successful\n\n" || echo "\nInstallation failed!\n\n"
	@hash -r

.PHONY:		clean
clean:
	rm -fr betterls .DS_Store *.o

.PHONY:		uninstall
uninstall:
	@echo
	@echo          "This will remove /usr/local/bin/ls and /usr/local/share/man/man1/betterls.1"
	@echo
	@sudo -K
	@sudo rm -f /usr/local/bin/ls
	@sudo rm -f /usr/local/share/man/man1/betterls.1
	@hash -r