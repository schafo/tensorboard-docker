#!/bin/bash
sh build.sh

docker rm --force "tensorboard"

docker run \
    -d \
    -v <absolute_path_to_runs_directory>:/app/runs/:ro \
    -p 6006:6006 \
    --restart always \
    -w "/app/" \
    --name "tensorboard" \
    schafo/tensorboard
