#!/bin/bash

mkdir -p out
gcsplit --quiet --digits=3 input --prefix="out/" '/^$/+1' '{*}'
(
    for f in out/*; do
        awk '{s+=$1} END {print s}' $f
    done
) | sort -n | tail -n3 | awk '{s+=$1} END {print s}'
rm -r out
