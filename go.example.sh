#!/usr/bin/env bash

# FIXME: shellcheck warnings

set -e

docker_run() {
  # shellcheck disable=SC2154,SC2086
  docker run --rm \
             ${image_id} "$@"
}

goal_basic-containerized-successful() {
  image_id="alpine:3.7" docker_run cat /etc/alpine-release
}

goal_basic-successful() {
  echo "Hello World"
}

goal_basic-failing() {
  echo "Running..."
  cd /tmp/this-does-not-exist-we-should-fail
  echo "Shouldn't run anymore"
}

if type -t "goal_$1" &>/dev/null; then
  # shellcheck disable=SC2086,SC2068
  goal_$1 ${@:2}
else
  echo "usage: $0 <goal>
goal:
    basic-successful     -- a basic, successful goal
    basic-failing        -- a basic, failing goal"
  exit 1
fi
