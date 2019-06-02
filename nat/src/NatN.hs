module NatN where

foldn z _ 0 = z
foldn z f n = f (foldn z f (n - 1))

fib = fst . foldn (0, 1) h where
  h (m, n) = (n, m + n)

--take 10 $ map fst $ iterate (\(m, n) -> (n, m + n)) (0, 1)

-- m + ()
plus m = foldn m (+1)

-- m * ()
times m = foldn 0 (+m)

-- m^()
power m = foldn 1 (*m)

-- ()^2
-- (n + 1)^2 = n^2 + 2n + 1
sqr = snd . foldn (0, 0) h where
  h (i, s) = (i + 1, s + 2 * i + 1)

-- ()^m
expo m = snd . foldn (0, 0) h where
  h (i, b) = (i + 1, power (i + 1) m)

-- sum [1, 3, 5, ...]
sumOdd = snd . foldn (1, 0) h where
  h (i, s) = (i + 2, s + i)

-- There is a line of holes in the forest. A fox hides in one hole.
-- It moves to the next hole every day. If we can
-- check only one hole a day, is there a way to catch the fox?
fox m = foldn (1, m) h n where
  h (c, f) = (c + 2, f + 1)
  n = m - 1 -- solve equation: 2n + 1 = m + n
