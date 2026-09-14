# The second feature file asks for three digits and the answer has two, so
# this scenario fails while the one in Hiker.feature passes.
Feature: The size of the answer

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are 3 of them
