#!/bin/bash


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

#tr '\12\11' '\233\177' < USRSIO.LST > USRSIO.txt

dir2atr -b Dos25 720  /tmp/USRSIO.atr /tmp/atr/

