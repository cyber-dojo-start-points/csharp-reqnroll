# A feature file one directory further down. cyber-dojo.sh looks for
# .feature files at any depth, so depth changes nothing but the namespace
# the generated class lands in, and this scenario runs like any other.
Feature: The size of the answer

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are 2 of them
