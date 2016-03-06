#!/usr/bin/env bash
# parameter : size of etcd cluster

TOKEN_FIC=./install/etcd_token
SIZE=$1

function go_to_dirname
{
    echo "Go to working directory..."
    cd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    if [ $? -ne 0 ]
    then
        echo "go_to_dirname failed";
        exit 1
    fi
    echo "-> Current directory is" $(pwd)
}

function get_token
{
    curl https://discovery.etcd.io/new?size=${SIZE} > ${TOKEN_FIC}
}

go_to_dirname
get_token
