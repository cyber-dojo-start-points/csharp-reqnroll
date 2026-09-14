using Reqnroll;
using NUnit.Framework;

namespace StepDefinitions;
[Binding]
public class FizzBuzzSteps
{
    private int number;
    private string said;

    [Given(@"the number (.*)")]
    public void GivenTheNumber(int n)
    {
        number = n;
    }

    [When(@"I say it")]
    public void WhenISayIt()
    {
        said = FizzBuzz.Say(number);
    }

    [Then(@"I hear ""(.*)""")]
    public void ThenIHear(string expected)
    {
        Assert.That(said, Is.EqualTo(expected));
    }
}
