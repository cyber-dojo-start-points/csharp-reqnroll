# Three scenarios in the other feature file all pass. The one failure is
# here, and it is enough to take the whole run red.
Feature: The size of the answer

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are 3 of them
