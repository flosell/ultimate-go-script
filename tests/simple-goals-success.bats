#!/usr/bin/env bats

@test "executes a basic, successful goal, prints its output and exits with status 0" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh basic-successful

  [ "$output" = "Hello World" ]
  [ "$status" -eq 0 ]
}
