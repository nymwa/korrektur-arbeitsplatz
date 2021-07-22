#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

VALID_SRC=../../../corpora/falko-merlin/data/fm-dev.src
VALID_TRG=../../../corpora/falko-merlin/data/fm-dev.trg
TEST_SRC=../../../corpora/falko-merlin/data/fm-test.src
TEST_TRG=../../../corpora/falko-merlin/data/fm-test.src

run () {
    beta-to-eszett | reguligilo -a
}

run < $VALID_SRC > fm-dev.reg.src
run < $VALID_TRG > fm-dev.reg.trg
run < $TEST_SRC > fm-test.reg.src
run < $TEST_TRG > fm-test.reg.trg

