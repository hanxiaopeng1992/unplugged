import java.util.stream.LongStream;
import java.util.function.LongPredicate;

public class PermuteSubstr {
    private static final int ASCII = 128;
    private static LongPredicate sieves = x -> true; // initialize sieve as id
    private final static long[] PRIMES = LongStream
        .iterate(2, i -> i + 1)
        .filter(i -> sieves.test(i))  // Sieve of Eratosthenes
        .peek(i -> sieves = sieves.and(v -> v % i != 0)) // update, chain the sieve
        .limit(ASCII)                 // only support ASCII
        .toArray();

    private static long product(String str) {
        return str.chars().mapToLong(c -> PRIMES[c]).reduce(1, (a, b) -> a * b);
    }

    public static boolean exist(String w, String txt) {
        if (w.isEmpty()) {
            return true;
        }
        int m = w.length(), n = txt.length();
        if (n < m) {
            return false;
        }
        long target = product(w);
        long fp = product(txt.substring(0, m));
        for (int i = m; i < n && target != fp; ++i) {
            fp = fp / PRIMES[txt.charAt(i - m)] * PRIMES[txt.charAt(i)];
        }
        return target == fp;
    }

    public static void main(String[] args) {
        for (long p : PRIMES) {
            System.out.format("%d, ", p);
        }
        System.out.println();
        System.out.println(exist("ab", "excbaode"));
        System.out.println(exist("abc", "excbaode"));
        System.out.println(exist("xy", "excbaode"));
    }
}
