# A second feature file whose Examples table has a header row and no data
# row, so there is no example to build a scenario from. This is where a
# .feature file fails differently from a .cs file: the generator runs before
# the compiler, and it stops the whole run at step 1 of cyber-dojo.sh. The
# other feature file is never even reached, and nothing is compiled.
Feature: The size of the answer

  Scenario Outline: The answer is <digits> digits long
    Given life, the universe and everything
    When I count the digits of the answer
    Then there are <digits> of them
    Examples:
      | digits |
