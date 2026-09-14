using Reqnroll;
using NUnit.Framework;

// The Gherkin is fine and generates without complaint. What will not compile
// is the step definition below, which is missing a closing bracket. The
// generated code and the step definitions go to the compiler together, so
// one broken binding stops the whole build and no scenario runs.
namespace StepDefinitions;
[Binding]
public class HikerSteps
{
    private int answer;

    [Given(@"life, the universe and everything")]
    public void GivenLifeTheUniverseAndEverything()
    {
    }

    [When(@"I ask for the meaning")]
    public void WhenIAskForTheMeaning()
    {
        answer = Hiker.Answer();
    }

    [Then(@"the answer is (.*)")]
    public void ThenTheAnswerIs(int expected)
    {
        Assert.That(answer, Is.EqualTo(expected);
    }
}
