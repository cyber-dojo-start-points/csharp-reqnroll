Feature: The hiker

  Scenario: The meaning of life, the universe and everything
    Given life, the universe and everything
    When I ask for the meaning
    Then the answer is 42

  Scenario: The answer is a multiple of seven
    Given life, the universe and everything
    When I ask for the meaning
    Then the answer divides by 7

  Scenario: The answer reads as forty three
    Given life, the universe and everything
    When I ask for the meaning
    Then the answer reads as "43"
