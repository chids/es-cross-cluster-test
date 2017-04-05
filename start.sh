#!/usr/bin/env bash

declare -r FOO_PORT=9311
declare -r BAR_PORT=9321

./data-start.sh foo 9310 ${FOO_PORT} &
./data-start.sh bar 9320 ${BAR_PORT} &

# Some arcane value that allows your computer enough time to fire up the two data instances
sleep 12

./proxy-start.sh local 9340 9341 ${FOO_PORT} ${BAR_PORT} &
./proxy-start.sh remote 9350 9351 ${BAR_PORT} ${FOO_PORT} &
