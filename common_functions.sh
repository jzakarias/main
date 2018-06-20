#!/bin/bash

function timer() {
	local _t1=$(date +%s%N)
	eval "$1"
	local _t2=$(date +%s%N)
	echo "scale=2;($_t2-$_t1)/1000000000" | bc
}

function get_arr_elmt_ind() {
    local _elmt="$1"
    shift
    local _arr=("${@}")
    local i
    for i in ${!_arr[@]}; do
        if [[ x"${_arr[$i]}" == x"${_elmt}" ]]; then
            echo "${i}"
            return 0
        fi
    done
    return 1
}

function del_arr_elmt() {
    local _elmt=(${@:1:$(($#-1))})
    local _arrname=${!#}
    local _arrvals=${!#}[@]
    local _local_arr=("${!_arrvals}")
    local i
    for i in ${_elmt[@]}; do
        local _elmt_id=$(get_arr_elmt_ind ${i} ${_local_arr[@]})
        if ! [ -z ${_elmt_id} ]; then
            unset _local_arr[${_elmt_id}]
            _local_arr=(${_local_arr[@]})
        fi
    done
    eval "${_arrname}=(${_local_arr[@]})"
}
