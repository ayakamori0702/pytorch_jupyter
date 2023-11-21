#!/bin/sh

TODAY=$(date "+%Y%m%d_%H%M%S")
LOG="tee docker/log/log_exec_${TODAY}.txt"

docker \
  run \
  --rm \
  -e TZ=Asia/Tokyo \
  -it \
  -v $(pwd):/mnt \
  -p 8008:8888 \
  --workdir=/mnt \
  --gpus=all \
  --name pytorch_jupyter \
  amori/pytorch_jupyter:v0.0.0 \
  jupyter-lab \
  --no-browser \
  --ip 0.0.0.0 \
  --allow-root \
  --NotebookApp.token='' \

  $@ | ${LOG}