using Reqnroll;
using NUnit.Framework;

namespace StepDefinitions;
[Binding]
public class AnswerSizeSteps
{
    // These bindings are compiled, because this is a .cs file. Nothing calls
    // them, because the only scenario that uses them sits in a file the
    // generator passed over.
    private int size;

    [When(@"I count the digits of the answer")]
    public void WhenICountTheDigitsOfTheAnswer()
    {
        size = Hiker.Answer().ToString().Length;
    }

    [Then(@"there are (.*) of them")]
    public void ThenThereAreOfThem(int expected)
    {
        Assert.That(size, Is.EqualTo(expected));
    }
}
