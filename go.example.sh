#!/usr/bin/env bash

set -e

goal_basic-successful() {
  echo "Hello World"
}
goal_basic-failing() {
  echo "Running"
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
