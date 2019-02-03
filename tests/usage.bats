#!/usr/bin/env bats

@test "exits with error status when called without argument" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh
  [ "$status" -ne 0 ]
}

@test "prints usage when called without argument" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh
  # FIXME: double-brackets dont seem to work locally

  [[ "${lines[0]}" == "usage:"* ]]
  [[ "${lines[0]}" == *"./go.example.sh <goal>" ]]
}

@test "exits with error status when called with invalid argument" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh invalid-argument
  [ "$status" -ne 0 ]
}

@test "prints usage when called with invalid argument" {
  run ${BATS_TEST_DIRNAME}/../go.example.sh invalid-argument

  # FIXME: double-brackets dont seem to work locally
  [[ "${lines[0]}" == "usage:"* ]]
  [[ "${lines[0]}" == *"./go.example.sh <goal>" ]]
}
