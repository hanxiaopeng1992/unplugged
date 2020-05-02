import java.util.stream.IntStream;
import java.util.stream.LongStream;
import java.util.function.LongPredicate;

public class PermuteSubstr {
    private static LongPredicate sieves = x -> true; // initialize sieve as id
    private final static long[] PRIMES = LongStream
        .iterate(2, i -> i + 1)
        .filter(i -> sieves.test(i))  // Sieve of Eratosthenes
        .peek(i -> sieves = sieves.and(v -> v % i != 0)) // update, chain the sieve
        .limit(52)                    // a..zA..Z
        .toArray();

    private static long primeOf(int c) {
        return PRIMES[c - 'a'];
    }

    private static long product(IntStream cs) {
        return cs.mapToLong(c -> primeOf(c)).reduce(1, (a, b) -> a * b);
    }

    public static boolean exist(String w, String txt) {
        if (w.isEmpty()) {
            return true;
        }
        int m = w.length(), n = txt.length();
        if (n < m) {
            return false;
        }
        long target = product(w.chars());
        long fp = product(txt.substring(0, m).chars());
        for (int i = m; i < n && target != fp; ++i) {
            fp = fp / primeOf(txt.charAt(i - m)) * primeOf(txt.charAt(i));
        }
        return target == fp;
    }

    public static void main(String[] args) {
        for (long p : PRIMES) {
            System.out.format("%d, ", p);
        }
        System.out.println("");
        System.out.println(exist("ab", "excbaode"));
        System.out.println(exist("ba", "excbaode"));
        System.out.println(exist("xy", "excbaode"));
    }
}
