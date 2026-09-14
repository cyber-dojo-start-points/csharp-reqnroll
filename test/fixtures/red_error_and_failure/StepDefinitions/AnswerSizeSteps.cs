using Reqnroll;
using NUnit.Framework;

namespace StepDefinitions;
[Binding]
public class AnswerSizeSteps
{
    private int size;

    [When(@"I count the digits of the answer")]
    public void WhenICountTheDigitsOfTheAnswer()
    {
        size = Hiker.AnswerSize();
    }

    [Then(@"there are (.*) of them")]
    public void ThenThereAreOfThem(int expected)
    {
        Assert.That(size, Is.EqualTo(expected));
    }
}
