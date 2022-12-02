#!/usr/bin/env bash

declare -A precalc

precalc["A X"]=3
precalc["A Y"]=4
precalc["A Z"]=8
precalc["B X"]=1
precalc["B Y"]=5
precalc["B Z"]=9
precalc["C X"]=2
precalc["C Y"]=6
precalc["C Z"]=7

(
    while read -r line; do
        if [[ "${line}" == "" ]]; then continue; fi
        echo -n "${precalc[${line}]} + "
    done < input.part01
    echo "0"
) | bc
