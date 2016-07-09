#!/usr/bin/env bash

# Warn of uninitialized variables
set -u

export GLUON_TARGET=ar71xx-generic

# find all visible directories in relative path ../sites and only there (no recursion)
for d in $(find ../sites/ -mindepth 1 -maxdepth 1 -not -path '*/\.*' -type d)
do
  echo "Building firmware image for site $(basename "$d")"
  # convert relative into absolute path and export it
  export GLUON_SITEDIR=$(readlink -f "$d")
  # get the name of the site and append it to the output path
  export GLUON_OUTPUTDIR=$(pwd)/output/$(basename "$d")
  make update
  make clean
  make
done

# Copy me to your gluon folder, which should be next to your site folder:
#     /some/path/sites/
#     /some/path/gluon/
#
# Export the branch you want to build:
#     export GLUON_BRANCH=stable
#
# and call ./build_all.sh in /some/path/gluon/
#
# Output will be in /some/path/gluon/output/<site>/
