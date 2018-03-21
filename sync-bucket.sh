#!/bin/bash
set -e -u -o pipefail

aws s3 sync ./_site/ s3://notedump.com