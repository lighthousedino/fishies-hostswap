#!/usr/bin/env bash

cd "$(dirname "$0")"
set -o allexport
source config.env 2>/dev/null
set +o allexport

restic restore latest --target ../ --overwrite if-changed \
    --delete --include "/server/**" --exclude-file="restic-ignore" -vv
