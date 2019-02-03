#!/bin/bash

set -e
set -o pipefail

SCRIPT_DIR=$(cd $(dirname $0) ; pwd -P)

goal_test() {
  bats ${SCRIPT_DIR}/tests/*.bats
}

goal_lint() {
  shellcheck ${SCRIPT_DIR}/go.example.sh
}

goal_pre-push() {
  goal_lint
  goal_test
}

if type -t "goal_$1" &>/dev/null; then
  goal_$1 ${@:2}
else
  echo "usage: $0 <goal>
goal:
    test     -- Run all tests
    lint     -- Run linter
    pre-push -- Run all checks that should run before pushing code to master"
  exit 1
fi
