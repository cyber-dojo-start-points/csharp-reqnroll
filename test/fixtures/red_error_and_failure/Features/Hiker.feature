# One scenario asserts and does not hold, the other throws. nunit counts
# them separately, "Failures: 1, Errors: 1", and the lambda in
# start_point/red_amber_green.rb treats the pair the same way it treats
# either alone: red.
Feature: The hiker

  Scenario: The meaning of life, the universe and everything
    Given life, the universe and everything
    When I ask for the meaning
    Then the answer is 42

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are 2 of them
