#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

TRAIN_SRC=../../../corpora/falko-merlin/data/fm-train.src
TRAIN_TRG=../../../corpora/falko-merlin/data/fm-train.trg
VALID_TRG=../../../corpora/falko-merlin/data/fm-dev.trg
TEST_TRG=../../../corpora/falko-merlin/data/fm-test.trg


run () {
    beta-to-eszett | reguligilo -a
}


paste $TRAIN_SRC $TRAIN_TRG \
    | fm-grundkiewicz-filter $VALID_TRG $TEST_TRG \
    > train.tsv


cut -f 1 train.tsv \
    | beta-to-eszett \
    > train.src

cut -f 2 train.tsv \
    | beta-to-eszett \
    > train.trg


superspecimeni train.src train.trg train.over.src train.over.trg -i 1 -o 3

reguligilo -a < train.over.src > train.over.reg.src
reguligilo -a < train.over.trg > train.over.reg.trg

