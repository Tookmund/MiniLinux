#!/bin/sh
case $1 in
	clean)
		for i in *.make
		do
			make -f $i clean
		done
		;;
	*)
		for i in *.make
		do
			make -f $i
		done
		;;
esac
