#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

M2=../../corpora/conll13/release2.3.1/original/data/official-preprocessed.m2

m22src < $M2 | reguligilo -a > valid.src
m22trg < $M2 | reguligilo -a > valid.trg

