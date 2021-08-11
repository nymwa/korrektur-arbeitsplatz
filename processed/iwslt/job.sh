#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

SRC=../../corpora/iwslt/de-en/train.tags.de-en.de
TRG=../../corpora/iwslt/de-en/train.tags.de-en.en

run () {
    beta-to-eszett | reguligilo -a
}

preprocess() {
    grep -v '<url>' | \
    grep -v '<talkid>' | \
    grep -v '<keywords>' | \
    sed -e 's/<title>//g' | \
    sed -e 's/<\/title>//g' | \
    sed -e 's/<description>//g' | \
    sed -e 's/<\/description>//g'
}

cat $SRC | preprocess | de-tokenize | run | progress > train.de
cat $TRG | preprocess | en-tokenize | run | progress > train.en

