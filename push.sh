#!/usr/bin/env bash

cd "$(dirname "$0")"
source config.env

restic backup ../server/ --exclude-file="restic-ignore" -vv
