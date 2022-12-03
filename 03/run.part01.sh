#!/usr/bin/env bash

declare -A precalc

for i in $(seq 65 90); do precalc[$(printf "\\$(printf '%03o' ${i})")]="$(echo "${i} - 65 + 27" | bc)"; done
for i in $(seq 97 122); do precalc[$(printf "\\$(printf '%03o' ${i})")]="$(echo "${i} - 96" | bc)"; done

(
    while read -r line; do
        if [[ "${line}" == "" ]]; then continue; fi
        p1="${line:0:${#line}/2}"
        p2="${line:${#line}/2}"

        for x in $(grep -o . <<<${p1} | sort -u); do
            grep <<<${p2} "${x}" > /dev/null && echo > /dev/stderr "${x} found inside ${p1} and ${p2} (${precalc[${x}]})"
            grep <<<${p2} "${x}" > /dev/null && echo -n "${precalc[${x}]} + "
        done
    done < "${1:-input.part01}"
    echo "0"
) | bc
