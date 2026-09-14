using NUnit.Framework;

public class Hiker
{
    public static int Answer()
    {
        // The learner put a print inside a loop to see what was happening,
        // and it prints far more than the 50K the runner keeps of a stream.
        // Every writer available in a step lands on stdout, which is the
        // stream the run summary comes on too, so the summary is what falls
        // off the end. Without it there is nothing for the lambda to read
        // and the run cannot be called green, however well it went.
        for (var i = 0; i < 10000; i++)
        {
            TestContext.Progress.WriteLine("debug: i is " + i);
        }
        return 6 * 7;
    }
}
