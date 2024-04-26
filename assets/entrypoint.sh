#!/bin/bash
set -e

execute_before_start() {
    echo "Execute befor start" > /running.txt
}

execute_after_start() {
    sleep 1
    echo "Execute after start" >> /running.txt
}

execute_before_start
echo "CALLING ENTRYPOINT WITH CMD: $@"

#exec /old_entrypoint.sh "$@" &

#    jupyter lab build --dev-build=False --minimize=False &&\
    jupyter notebook \
    --notebook-dir=/opt/notebooks --ip='*' --port=8888 \
    --no-browser --allow-root

daemon_pid=$!
execute_after_start
wait $daemon_pid
echo "Entrypoint exited" >> running.txt