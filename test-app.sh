#!/usr/bin/env bash
set -euo pipefail
for attempt in {1..30}; do
 if body=$(curl -fsS --max-time 2 \
 http://127.0.0.1:5000/); then
 if grep -Fq 'This marker is absent' <<< "$body"; then
 echo "PASS: HTTP response contains the app marker"
 exit 0
 fi
 fi
 sleep 1
done
echo "FAIL: app did not return the expected page" >&2
docker logs cmp6237-lab56 >&2
exit 1
