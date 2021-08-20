#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

WIL_M2=../../corpora/wi+locness/wi+locness/m2/ABC.train.gold.bea19.m2
FCE_M2=../../corpora/fce/fce/m2/fce.train.gold.bea19.m2

run_src () {
    m22src | reguligilo -a
}

run_trg () {
    m22trg | reguligilo -a
}

run_src < $WIL_M2 > train.src
run_src < $FCE_M2 >> train.src

run_trg < $WIL_M2 > train.trg
run_trg < $FCE_M2 >> train.trg

superspecimeni train.src train.trg train.over.src train.over.trg -i 1 -o 3

