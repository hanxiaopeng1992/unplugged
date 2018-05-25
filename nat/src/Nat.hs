module Nat where

import Prelude hiding ((+))

data Nat = Zero | Succ Nat deriving Show

(+) :: Nat -> Nat -> Nat
m + Zero = m
m + (Succ n) = Succ (m + n)
