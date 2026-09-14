# Named answer_size_spec.feature rather than AnswerSize.feature. The name
# buys nothing: cyber-dojo.sh generates from every .feature file it finds,
# whatever it is called, so this one is read too and its doc string, opened
# and never closed, stops the run before anything is compiled. The error
# names the file, which is how a learner finds it.
Feature: The size of the answer

  Scenario: The answer is two digits long
    Given life, the universe and everything
    When I count the digits of the answer
      """
    Then there are 2 of them
