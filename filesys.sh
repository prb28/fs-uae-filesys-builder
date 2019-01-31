#! /bin/sh
# Script to convert an Amiga executable named filesys into a series of
# dw(...) statements.
# This assumes that the first four lines only contain hunk information.
# That is what you get if you assemble/link with a68k/blink
od -v -t xC build/filesys |tail -n +3 | sed -e "s,^.......,,"  \
  -e "s,[0123456789abcdefABCDEF][0123456789abcdefABCDEF],db(0x&);,g" > build/filesys_bootrom.cpp