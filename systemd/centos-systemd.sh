#!/bin/bash

set -eu

IMAGE=lazyfrosch/centos:systemd

home_dir="$(dirname "$(readlink -f "$0")")"
session_name="$(basename "$home_dir")"
workspace="$(pwd)"

if tmux has-session -t "${session_name}"; then
  echo "Attaching to existing session"
  sleep 2
  tmux attach-session -t "${session_name}"
  exit $?
fi

echo "Starting tmux"
tmux new-session -d -s "${session_name}" \
  "docker run --rm -it --name '${session_name}' --hostname '${session_name}' -v '${workspace}:/root/workspace' -v /sys/fs/cgroup:/sys/fs/cgroup:ro '$IMAGE'; read -p 'Press enter to exit.'" \; \
  new-window "sleep 1; while true; do docker exec -it -w /root/workspace '${session_name}' bash; sleep 1; done" \; \
  attach

# vi: ts=2 sw=2 expandtab :
