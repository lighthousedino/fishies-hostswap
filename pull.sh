#!/usr/bin/env bash

cd "$(dirname "$0")"
source config.env

restic restore latest --target ../ --overwrite if-changed \
    --delete --include "/server/**" --exclude-file="restic-ignore" -vv
