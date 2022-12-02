#!/usr/bin/env bash

declare -A precalc

precalc["A X"]=4
precalc["A Y"]=8
precalc["A Z"]=3
precalc["B X"]=1
precalc["B Y"]=5
precalc["B Z"]=9
precalc["C X"]=7
precalc["C Y"]=2
precalc["C Z"]=6

(
    while read -r line; do
        if [[ "${line}" == "" ]]; then continue; fi
        echo -n "${precalc[${line}]} + "
    done < input.part01
    echo "0"
) | bc