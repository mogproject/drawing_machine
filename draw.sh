#!/bin/bash

USAGE='draw <label> <num_candidates>'

if [[ $# -ne 2 ]]; then
    echo "${USAGE}"
    exit 1
fi

readonly label="$1"
readonly num_candidates=$2

function get_drawn() {
    awk -v min=1 -v max=$(($num_candidates)) 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'
}

function announce() {
    say -v Kyoko "$1"
    echo -n "$1"
}

announce "${label}"'の当選者は'
sleep 2
announce $(get_drawn $num_candidates)'番です'
echo

