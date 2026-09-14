using System;

public class Hiker
{
    public static int Answer()
    {
        // Both of these arrive on stdout. System.Console is among the
        // assemblies cyber-dojo.sh names on the compiler command line, so a
        // learner can write to either stream, but the nunit console runner
        // takes hold of Console.Error and replays what it caught into its own
        // report, which it writes to stdout. Nothing a step prints reaches
        // stderr, and the run summary is on stdout too.
        Console.WriteLine("answer was called");
        Console.Error.WriteLine("and this print aimed at stderr");
        return 6 * 7;
    }
}
