**betterls** — list directory contents
--------------------------------------

USAGE
--------

**betterls** \[**−@ABCFGHILOPRSTUWabcdefghiklmnopqrstuvwxy1%,**\] \[**−-color**\=_when_\] \[**−-group-directories-first**\] \[**−-group-dots-extra-first**\] \[**−D** _format_\] \[_file ..._\]

DESCRIPTION
-----------

This is a modified version of the Darwin/macOS `ls` command with the following two additional options:

**−-group-directories-first**

> Sort directories before other file types.

**−-group-dots-extra-first**

> Always sort hidden directories and files before visible directories and files, even when directories are otherwise grouped first.

HISTORY
-------

This project is forked from the BSD-licensed macOS Monterey source code for the `ls` utility.  Some interface definitions are only available in non-free header files, so they were reverse-engineered.  All of the code in this repository is available under the permissive BSD license.

Last updated by Joshua Lee Ockert <torstenvl(at)gmail.com> on January 24, 2023
