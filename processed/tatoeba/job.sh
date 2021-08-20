#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

SRC=../../corpora/tatoeba/tatoeba.ende.tsv

cut -f 2 $SRC | en-tokenize | reguligilo -a | progress > train.en
cut -f 4 $SRC | de-tokenize | reguligilo -a | progress > train.de

