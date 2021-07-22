#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

TRAIN_SRC=../../processed/falko-merlin/train/train.over.src
TRAIN_TRG=../../processed/falko-merlin/train/train.over.trg

cat $TRAIN_SRC $TRAIN_TRG \
    | reguligilo --name base \
    | progress \
    > normalized.txt

pyspm-train \
    --input normalized.txt \
    --corpus-name fm \
    --vocab-size 4000 \
    --model-type bpe \
    --num-threads 20 \
    --character-coverage 1.0 \
    --required-chars ''

