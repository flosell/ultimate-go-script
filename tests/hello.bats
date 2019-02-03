#!/usr/bin/env bats

@test "says hello world" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Hello World" ]
}
