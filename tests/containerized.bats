#!/usr/bin/env bats

@test "executes a goal inside a container" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh basic-containerized-successful

  [ "${lines[0]}" == "3.7.1" ]
  [ "$status" -eq 0 ]
}
