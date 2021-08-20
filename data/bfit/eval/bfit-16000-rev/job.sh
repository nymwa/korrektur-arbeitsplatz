#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

MODELPATH=../../../../bpe/bfit-16000/bfit.16000.model
FM_VALID_SRC=../../../../processed/falko-merlin/eval/fm-dev.reg.src
FM_VALID_TRG=../../../../processed/falko-merlin/eval/fm-dev.reg.trg
FM_TEST_SRC=../../../../processed/falko-merlin/eval/fm-test.reg.src
FM_TEST_TRG=../../../../processed/falko-merlin/eval/fm-test.reg.trg
WF_VALID_SRC=../../../../processed/conll13/valid.src
WF_VALID_TRG=../../../../processed/conll13/valid.trg
WF_TEST_SRC=../../../../processed/conll14/test.src
WF_TEST_TRG=../../../../processed/conll14/test.trg

run () {
    pyspm-encode --model-file $MODELPATH | renversi
}

run < $FM_VALID_SRC | de-gec-tag > valid.fm.src
run < $FM_VALID_TRG > valid.fm.trg
run < $FM_TEST_SRC | de-gec-tag > test.fm.src
run < $FM_TEST_TRG > test.fm.trg

run < $WF_VALID_SRC | en-gec-tag > valid.wf.src
run < $WF_VALID_TRG > valid.wf.trg
run < $WF_TEST_SRC | en-gec-tag > test.wf.src
run < $WF_TEST_TRG > test.wf.trg

echo '.' | run | de-gec-tag > false.fm.src
echo '.' | run > false.fm.trg

echo '.' | run | en-gec-tag > false.wf.src
echo '.' | run > false.wf.trg

