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
    test     -- Run all tests
    lint     -- Run linter
    pre-push -- Run all checks that should run before pushing code to master"
  exit 1
fi
