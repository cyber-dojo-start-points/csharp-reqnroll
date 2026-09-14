# The step throws rather than asserting, so nunit calls the scenario an
# Error and the summary reads "Failures: 0, Errors: 1". The lambda in
# start_point/red_amber_green.rb reaches "Failed Tests" before it has looked
# at that split, so this is red rather than the amber the other C# start
# points give a thrown exception.
Feature: The hiker

  Scenario: The meaning of life, the universe and everything
    Given life, the universe and everything
    When I ask for the meaning
    Then the answer is 42
