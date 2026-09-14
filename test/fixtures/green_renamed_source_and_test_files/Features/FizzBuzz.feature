# Not one of the names the start point shipped: the source, the feature file
# and the step definitions are all called something else, and the kata is a
# different one. Nothing in cyber-dojo.sh names a file, so all three are
# found the same way the shipped ones were.
Feature: FizzBuzz

  Scenario: Fifteen says FizzBuzz
    Given the number 15
    When I say it
    Then I hear "FizzBuzz"
