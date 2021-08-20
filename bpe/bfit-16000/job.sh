#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

FM_SRC=../../processed/falko-merlin/train/train.over.src
FM_TRG=../../processed/falko-merlin/train/train.over.trg
MT_DE=../../processed/iwslt/train.de
MT_EN=../../processed/iwslt/train.en
TA_DE=../../processed/tatoeba/train.de
TA_EN=../../processed/tatoeba/train.en
WF_SRC=../../processed/wilfce/train.over.src
WF_TRG=../../processed/wilfce/train.over.trg

cat $FM_SRC $FM_TRG $MT_DE $MT_EN $TA_DE $TA_EN $WF_SRC $WF_TRG \
    | reguligilo --name base \
    | progress \
    > normalized.txt

pyspm-train \
    --input normalized.txt \
    --corpus-name bfit \
    --vocab-size 16000 \
    --model-type bpe \
    --num-threads 10 \
    --character-coverage 1.0 \
    --required-chars ''

