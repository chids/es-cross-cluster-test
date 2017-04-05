#!/usr/bin/env bash

declare -r NAME=${1}
declare -r HTTP_PORT=${2}
declare -r TRANSPORT_PORT=${3}
declare -r ROOT=$(pwd)/cluster/${NAME}

elasticsearch -Enode.master=true -Enode.data=true -Enode.ingest=false -Ediscovery.zen.minimum_master_nodes=0 -Etransport.profiles.default.port=${TRANSPORT_PORT} -Ehttp.port=${HTTP_PORT} -Epath.data=${ROOT}/data -Epath.logs=${ROOT}/logs -Ecluster.name=${NAME} -Enode.name="${NAME}-node"
