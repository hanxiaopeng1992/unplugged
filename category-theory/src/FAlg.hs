{-# Language InstanceSigs #-}

-- F-Algebra examples (without using Fixed point)

module FAlgebra where

-- F A -> A, F is functor
type Algebra f a = f a -> a


-- Natural number example

data NatF a = ZeroF | SuccF a deriving Show

data Nat = Zero | Succ Nat deriving Show

fromInt :: Int -> Nat
fromInt 0 = Zero
fromInt n = Succ $ fromInt (n-1)

-- Catamorphism
-- For NatF/Nat, not a generic one like:
--   cata :: Functor f => (f a -> a) -> (Fix f -> a)
--   cata f = f . fmap (cata f) .unFix
cata :: (NatF a -> a) -> (Nat -> a)
cata f Zero = f ZeroF
cata f (Succ x) = f (SuccF (cata f x))

-- example 1
toInt :: Nat -> Int
toInt = cata eval where
  eval :: NatF Int -> Int
  eval ZeroF = 0
  eval (SuccF x) = x + 1

-- example 2
toFib :: Nat -> (Integer, Integer)
toFib = cata fibAlg where
  fibAlg :: NatF (Integer, Integer) -> (Integer, Integer)
  fibAlg ZeroF = (1, 1)
  fibAlg (SuccF (m, n)) = (n, m + n)

fibAt = fst . toFib . fromInt
