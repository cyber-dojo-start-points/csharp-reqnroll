using Reqnroll;
using NUnit.Framework;

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
        Assert.That(answer, Is.EqualTo(expected));
    }

    [Then(@"the answer divides by (.*)")]
    public void ThenTheAnswerDividesBy(int divisor)
    {
        Assert.That(answer % divisor, Is.EqualTo(0));
    }

    [Then(@"the answer reads as ""(.*)""")]
    public void ThenTheAnswerReadsAs(string expected)
    {
        Assert.That(answer.ToString(), Is.EqualTo(expected));
    }
}
