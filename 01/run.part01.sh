#!/bin/bash

mkdir -p out
gcsplit --digits=3 --quiet input --prefix="out/" '/^$/+1' '{*}'
(
    for f in out/*; do
        awk '{s+=$1} END {print s}' $f
    done
) | sort -n
rm -r out
