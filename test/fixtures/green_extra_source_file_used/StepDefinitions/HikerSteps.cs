using Reqnroll;
using NUnit.Framework;

namespace StepDefinitions;
[Binding]
public class HikerSteps
{
    private int checksum;

    [Given(@"life, the universe and everything")]
    public void GivenLifeTheUniverseAndEverything()
    {
    }

    [When(@"I ask for the meaning")]
    public void WhenIAskForTheMeaning()
    {
        checksum = Hiker.AnswerChecksum();
    }

    [Then(@"the digits add up to (.*)")]
    public void ThenTheDigitsAddUpTo(int expected)
    {
        Assert.That(checksum, Is.EqualTo(expected));
    }
}
