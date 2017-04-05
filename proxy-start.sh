#!/usr/bin/env bash

declare -r NAME=${1}
declare -r HTTP_PORT=${2}
declare -r TRANSPORT_PORT=${3}
declare -r LOCAL_CLUSTER=${4}
declare -r REMOTE_CLUSTER=${5}
declare -r ROOT=$(pwd)/cluster/${NAME}

elasticsearch -Enode.data=false -Enode.master=true -Enode.ingest=false -Ediscovery.zen.minimum_master_nodes=0 -Ehttp.port=${HTTP_PORT} -Etransport.profiles.default.port=${TRANSPORT_PORT} -Epath.data=${ROOT}/data -Epath.logs=${ROOT}/logs -Ecluster.name=${NAME} -Enode.name="${NAME}-node" -Esearch.remote.local.seeds="127.0.0.1:${LOCAL_CLUSTER}" -Esearch.remote.remote.seeds="127.0.0.1:${REMOTE_CLUSTER}"
