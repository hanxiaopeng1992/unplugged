module NatN where

foldn z _ 0 = z
foldn z f n = f (foldn z f (n - 1))

fib = fst . foldn (0, 1) h where
  h (m, n) = (n, m + n)

--take 10 $ map fst $ iterate (\(m, n) -> (n, m + n)) (0, 1)
