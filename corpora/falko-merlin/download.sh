#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

wget http://www.sfs.uni-tuebingen.de/~adriane/download/wnut2018/data.tar.gz
tar zxvf data.tar.gz

