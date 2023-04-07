#!/bin/sh

read my_var

if test -f "$my_var"; then
	echo "File EXISTS!"
else
	echo "File doesn't exist..."
fi
