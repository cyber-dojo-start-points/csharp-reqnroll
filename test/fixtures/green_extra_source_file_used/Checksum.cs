// A second source file, in no way named after the one that calls it.
// cyber-dojo.sh hands the compiler every .cs file it finds, so this is
// compiled alongside Hiker.cs and Hiker can call it.
public class Checksum
{
    public static int Of(int n)
    {
        var sum = 0;
        while (n > 0)
        {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }
}
