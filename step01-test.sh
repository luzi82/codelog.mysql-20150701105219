#!/bin/bash

set -e

. ./_conf.sh

${MYSQL_CMD} -e "EXPLAIN SELECT * FROM t0 ORDER BY c0 LIMIT 1"
