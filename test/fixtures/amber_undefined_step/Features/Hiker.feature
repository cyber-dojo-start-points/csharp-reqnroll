# The step about the towel has no binding. Reqnroll reports it undefined and
# skips the rest of the scenario, and nunit records the scenario as
# Inconclusive rather than as a failure, leaving the overall result at
# Inconclusive. Every other step here is bound and the code is right, so the
# only thing keeping this out of green is that the scenario never finished.
# That is what the first clause of start_point/red_amber_green.rb is for: it
# reads the Inconclusive count before anything else.
Feature: The hiker

  Scenario: The meaning of life, the universe and everything
    Given life, the universe and everything
    When I ask for the meaning
    And I write the answer down on my towel
    Then the answer is 42
