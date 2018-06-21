#!/bin/bash

set -e

# Signal / error handler
function err_handler() {
    local _retval="$?"
    local _command="${BASH_COMMAND}"
    [ "$_retval" -eq 0 ] && return 0
    trap '' SIGINT SIGTERM SIGHUP SIGKILL EXIT ERR
    local _lineno="$1"
    local _callstack="$(get_calling_stack ${FUNCNAME[@]})"
    local _signal="$2"
    echo -e "[EE] ${_signal} (${_retval})\n cmd:\t'${_command}'\n stack:\t${_callstack}\n line:\t${_lineno}"
    exit ${_retval}
}

# Create a trap for every signal & pass signal to err_handler
function trap_sig() {
    local _fc="$1"; shift
    local _lineno="$1"; shift
    for _sig in "$@"; do
        trap "${_fc} \"$_lineno\" ${_sig}" ${_sig}
    done
}

# prints caller shell & function name
function get_calling_stack() {
    local _stack=("$@")
    local _calling_stack
    for i in $(seq 1 $((${#_stack[@]}-1))); do
        _calling_stack+=("${_stack[-${i}]}")
    done
    echo -e "$0:$(echo ${_calling_stack[@]} | sed 's/ /\//g')"
}

trap_sig err_handler \$LINENO SIGINT SIGTERM SIGHUP SIGKILL EXIT ERR
