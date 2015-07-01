#!/bin/bash

set -e

. ./_conf.sh

function sql {
	echo "${1}"
	${MYSQL_CMD} -e "${1}"
	echo ""
}

sql "SHOW CREATE TABLE t0"
sql "EXPLAIN SELECT * FROM t0 ORDER BY c0 LIMIT 1"
sql "EXPLAIN SELECT * FROM t0 ORDER BY c1 LIMIT 1"
sql "EXPLAIN SELECT * FROM t0 WHERE c0 = 73 ORDER BY c1 LIMIT 1"
sql "EXPLAIN SELECT MIN(c1) FROM t0 WHERE c0 = 73"
sql "EXPLAIN SELECT * FROM t0 WHERE c0 = 73 AND c1 = (SELECT MIN(c1) FROM t0 WHERE c0 = 73) LIMIT 1"
