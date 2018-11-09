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

exprs :: [Int] -> [Expr]
exprs = foldr extend []

extend :: Int -> [Expr] -> [Expr]
extend d [] = [expr d]
extend d es = concatMap (add d) es where
  add :: Int -> Expr -> [Expr]
  add d ((ds:fs):ts) = [(((d:ds):fs):ts),
                        (([d]:ds:fs):ts),
                        ([[d]]:(ds:fs):ts)]

solution = filter ((==100) . eval) (exprs [1..9])

-- Is it possible to simplify the below expr?
fromExpr :: Expr -> String
fromExpr = (join "+") . (map ((join "*") . (map (show . dec))))

join c as = concat (intersperse c as) where
  intersperse _ [] = []
  intersperse c (a:as) = a : prepend c as
  prepend _ [] = []
  prepend c (a:as) = c : a : prepend c as
