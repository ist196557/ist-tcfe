# ------------------------------------------------------------
# type "make" command in the Linux terminal create report.pdf
#
# type "make clean" to delete all generated files
# ------------------------------------------------------------


ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))


all:
	python2 -u t2_datagen.py | tee temp.txt
	tail -n 14 temp.txt > data.txt
	rm temp.txt
	mv data.txt ./mat/
	make -C mat
	make -C sim
	make -C doc
#	cp doc/report.pdf .

clean:
	make -C mat clean
	make -C sim clean
	make -C doc clean

.PHONY: all clean


