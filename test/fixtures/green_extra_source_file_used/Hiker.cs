public class Hiker
{
    public static int Answer()
    {
        return 6 * 7;
    }

    public static int AnswerChecksum()
    {
        return Checksum.Of(Answer());
    }
}
