#!/usr/bin/env bats

@test "executes a goal inside a container" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh basic-containerized-successful

  [[ "${lines[0]}" =~ ^3\.7\.[0-9]+$ ]] || false # || false is necessary: https://github.com/sstephenson/bats/issues/49#issuecomment-177970861
  [ "$status" -eq 0 ]
}
