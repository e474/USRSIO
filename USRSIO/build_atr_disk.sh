#!/bin/bash

#
# Assumes assembled with ATASM, and assembled XEX is placed in /tmp
# the usrsio.xex found here is pre-assembled, make sure you are using
# the correct one if you modify and re-assemble
#

if [ ! -d /tmp/atr ];
then
	mkdir /tmp/atr
else
	rm -rf /tmp/atr/*
fi

cp ./DOS.SYS /tmp/atr/
cp ./DUP.SYS /tmp/atr/
cp /tmp/usrsio.xex /tmp/atr/
cp ./USRSIO.BAS /tmp/atr/

# handy command to convert ATASCII to ASCII
#tr '\12\11' '\233\177' < USRSIO.LST > USRSIO.txt

dir2atr -b Dos25 720  /tmp/USRSIO.atr /tmp/atr/

#
# load disk with, for example, atari800 -basic /tmp/USRSIO.atr
# enable MEM.SAV in DOS if you want to switch between BASIC and DOS
#
