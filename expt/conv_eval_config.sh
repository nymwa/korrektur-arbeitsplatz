#!/bin/bash

set -ex

if [[ -z $WORKDIR ]] ; then
    WORKDIR=$(dirname $0)
fi
cd $WORKDIR

set -u

auxt conv eval-config < l2r_eval_config.fm_4000.yaml > l2r_eval_config.fm_4000.absolute.yaml
auxt conv eval-config < r2l_eval_config.fm_4000.yaml > r2l_eval_config.fm_4000.absolute.yaml
auxt conv eval-config < l2r_eval_config.fmmt_16000.yaml > l2r_eval_config.fmmt_16000.absolute.yaml

