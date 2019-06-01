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

-- ()^m
expo m = snd . foldn (0, 0) h where
  h (i, b) = (i + 1, power (i + 1) m)
