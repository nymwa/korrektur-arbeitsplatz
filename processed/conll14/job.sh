#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

M2=../../corpora/conll14/conll14st-test-data/noalt/official-2014.combined.m2

m22src < $M2 | reguligilo -a > test.src
m22trg < $M2 | reguligilo -a > test.trg

