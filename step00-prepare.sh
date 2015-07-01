#!/bin/bash

. ./_conf.sh

rm -rf tmp
mkdir tmp

echo "a,b" >> tmp/data.csv

for a in {0..99}
do
	for b in {0..999}
	do
		echo "$a,$b" >> tmp/data.csv
	done
done

${MYSQL_CMD} -e "DROP TABLE t0"
