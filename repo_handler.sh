#!/bin/bash

set -e

OPTIND=0
branch=main

function usage() {
    echo help
}

function update_repo() {
    git fetch
    git pull
    git status
}

function reset_repo() {
    git fetch
    git reset --hard
    git status
}

function push_commit() {

}

function rebase_commit() {

}

while getopts "rupbh" OPT; do
    case $OPT in
        r)
            reset_repo
            ;;
        u)
            update_repo
            ;;
        p)
            push_commit
            ;;
        b)
            rebase_commit
            ;;
        h|*)
            usage
            exit
            ;;
    esac
done
