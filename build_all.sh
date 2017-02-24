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
  # tabula rasa
  rm $GLUON_OUTPUTDIR/*
  make update
  make clean
  make -j `cat /proc/cpuinfo | grep processor | wc -l`
  make manifest
done

# 1. Copy me to your gluon folder, which should be next to your site folder:
#     /some/path/sites/
#     /some/path/gluon/
#
# 2. Export the branch you want to build:
#      export GLUON_BRANCH=stable
#    adapt the firmware version
#      export GLUON_RELEASE=16.06.1
#
# 3. and call ./build_all.sh in /some/path/gluon/
#
# 4. Output will be in /some/path/gluon/output/<site>/
#
# 5. Sign the manifest
#      contrib/sign.sh /path/to/private_key output/images/<site>/<sysupgrade/factory>/<branch>.manifest
#    and check whether the test returns 0
#      contrib/sigtest.sh [Publickey] output/images/<site>/<sysupgrade/factory>/<branch>.manifest
#      echo $?
