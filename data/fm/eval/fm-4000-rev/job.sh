#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

MODELPATH=../../../../bpe/fm-4000/fm.4000.model
VALID_SRC=../../../../processed/falko-merlin/eval/fm-dev.reg.src
VALID_TRG=../../../../processed/falko-merlin/eval/fm-dev.reg.trg
TEST_SRC=../../../../processed/falko-merlin/eval/fm-test.reg.src
TEST_TRG=../../../../processed/falko-merlin/eval/fm-test.reg.trg

run () {
    pyspm-encode --model-file $MODELPATH | renversi
}

run < $VALID_SRC > valid.src
run < $VALID_TRG > valid.trg
run < $TEST_SRC > test.src
run < $TEST_TRG > test.trg
echo '.' | run > false.src
echo '.' | run > false.trg

