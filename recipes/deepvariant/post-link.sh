#!/bin/bash
set -eu -o pipefail

MODEL_VERSION="0.6.0"
MODEL_SUBVERSION="191676894"

GSUTIL=$PREFIX/bin/gsutil
for MODEL_TYPE in wgs wes
do
	MODEL_NAME="DeepVariant-inception_v3-${MODEL_VERSION}+cl-${MODEL_SUBVERSION}.data-${MODEL_TYPE}_standard"
	GSREF="gs://deepvariant/models/DeepVariant/$MODEL_VERSION/$MODEL_NAME"
	OUTDIR=$PREFIX/share/$PKG_NAME-$PKG_VERSION-$PKG_BUILDNUM/models/DeepVariant/$MODEL_VERSION/$MODEL_NAME

	mkdir -p $OUTDIR
	$GSUTIL cp $GSREF/* $OUTDIR/
done