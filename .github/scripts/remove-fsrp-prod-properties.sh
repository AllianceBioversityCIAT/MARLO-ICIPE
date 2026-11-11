#!/usr/bin/env bash
# Removes the MARLO-FSRP PROD properties written by write-fsrp-prod-properties.sh. Runs as an `if: always()` step, so
# it also runs when a previous step failed. Never fails the job. The build runs inside `docker build` (Maven in the
# build stage), so no workspace cache holds a copy of the file. Byte-for-byte the code of remove-marlo-prod-properties.sh
# (CCAFS/MARLO, MARLO PROD); only this header differs.
set -uo pipefail
rm -f "marlo-web/src/main/resources/config/marlo-pro.properties"
echo "MARLO properties removed"
