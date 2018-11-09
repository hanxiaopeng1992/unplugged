module Puzzle100 where

type Expr = [Term]     -- T1 + T2 + ... Tn
type Term = [Factor]   -- F1 * F2 * ... Fm
type Factor = [Int]    -- d1d2...dk

dec :: Factor -> Int
dec = foldl (\n d -> n * 10 + d) 0

expr d = [[[d]]]  -- single digit expr

-- can we use foldr/build fusion to simplify this?
eval :: Expr -> Int
eval = sum . map (product . (map dec))

-- | 1, brute-force, exhausted search
exprs :: [Int] -> [Expr]
exprs = foldr extend []

extend :: Int -> [Expr] -> [Expr]
extend d [] = [expr d]
extend d es = concatMap (add d) es where
  add :: Int -> Expr -> [Expr]
  add d ((ds:fs):ts) = [((d:ds):fs):ts,
                        ([d]:ds:fs):ts,
                        [[d]]:(ds:fs):ts]

sol1 = filter ((==100) . eval) (exprs [1..9])

-- | 2, improved exhausted search, filter out the invalid
--      candidate as early as possible

type Val = (Int, Int, Int, Int)   -- | (exponent,
                                  --    value of first factor,
                                  --    value of rest factors,
                                  --    value of rest terms)

value :: Val -> Int
value (_, f, fs, ts) = f * fs + ts

expand :: Int -> [(Expr, Val)] -> [(Expr, Val)]
expand d [] = [(expr d, (10, d, 0, 0))]
expand d evs = concatMap ((filter ((<= 100) . value . snd)) . (add d)) evs where
  add :: Int -> (Expr, Val) -> [(Expr, Val)]
  add d (((ds:fs):ts), (e, f, vfs, vts)) =
    [(((d:ds):fs):ts, (10 * e, d * e + f, vfs, vts)),
     (([d]:ds:fs):ts, (10, d, f * vfs, vts)),
     ([[d]]:(ds:fs):ts, (10, d, 0, f * vfs + vts))]

-- | usage: sol2 [1..9]
sol2 = map fst . filter ((==100) . eval . fst) . foldr expand []

sol3 = map (\(e, v) -> (fromExpr e, v, value v)) . filter ((==100) . eval . fst) . foldr expand []

-- Is it possible to simplify the below expr?
fromExpr :: Expr -> String
fromExpr = (join "+") . (map ((join "*") . (map (show . dec))))

join c as = concat (intersperse c as) where
  intersperse _ [] = []
  intersperse c (a:as) = a : prepend c as
  prepend _ [] = []
  prepend c (a:as) = c : a : prepend c as
