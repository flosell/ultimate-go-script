#!/usr/bin/env bats

@test "executes a basic failing goal, prints its output, stops execution and passes on error code " {
  run ${BATS_TEST_DIRNAME}/../go.example.sh basic-failing
  # FIXME: double-brackets dont seem to work locally
  [[ "${lines[0]}" == *"Running..."* ]]
  [[ "${lines[1]}" == *" No such file or directory" ]]
  [[ "${lines[2]}" == "" ]]

  [ "$status" -eq 1 ]
}
