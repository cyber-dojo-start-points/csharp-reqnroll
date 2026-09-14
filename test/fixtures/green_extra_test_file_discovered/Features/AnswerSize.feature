# A second feature file, alongside the first. cyber-dojo.sh turns every
# .feature file into C# before anything is compiled, so this one becomes a
# test class of its own and the count below is 2 rather than 1.
Feature: The size of the answer

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are 2 of them
