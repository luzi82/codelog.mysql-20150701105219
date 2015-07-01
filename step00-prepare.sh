#!/bin/bash

set -e

. ./_conf.sh

rm -rf tmp
mkdir tmp

echo "c0,c1" >> tmp/data.csv

for a in {0..99}
do
	for b in {0..999}
	do
		echo "$a,$b" >> tmp/data.csv
	done
done

${MYSQL_CMD} -e "DROP TABLE t0" || echo ""
${MYSQL_CMD} -e "CREATE TABLE t0(pk int(11) NOT NULL AUTO_INCREMENT,c0 int(11),c1 int(11),PRIMARY KEY(pk),KEY idx0(c0),KEY idx1(c1),KEY idx01(c0,c1),KEY idx10(c1,c0))"
${MYSQL_CMD} -e "LOAD DATA INFILE "tmp/data.csv" INTO t0"
