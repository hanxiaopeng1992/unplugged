-- Euclid.hs
-- Copyright (C) 2018 Liu Xinyu (liuxinyu95@gmail.com)
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

module Euclid where

import Data.List
import Data.Function (on)
import Test.QuickCheck

-- Extended Euclidean Algorithm
gcmex a 0 = (a, 1, 0)
gcmex a b = (g, y', x' - y' * (a `div` b)) where
  (g, x', y') = gcmex b (a `mod` b)

-- 2 water jars puzzle
steps a b d | d `mod` g /= 0 = [] -- no solution
            | otherwise = pour x y [(0, 0)]
    where
      (g, x0, y0) = gcmex a b
      (x1, y1) = (x0 * d `div` g, y0 * d `div` g)
      (u, v) = (b `div` g, a `div` g)
      x = x1 - k * u
      y = y1 + k * v
      k = minimumBy (compare `on` (\i -> abs (x1 - i * u) + abs (y1 + i * v))) [-m..m]
      m = max (abs x1 `div` u) (abs y1 `div` v)
      pour 0 0 ps = reverse ((if a < b then (0, d) else (d, 0)) :ps)
      pour x y ps@((a', b'):_)
        | x > 0 && a'== 0  = pour (x - 1) y ((a, b'):ps) -- fill a
        | x > 0 && b == b' = pour x (y + 1) ((a', 0):ps) -- empty b
        | x > 0 = pour x y ((max (a' + b' - b) 0,
                             min (a' + b') b):ps) -- a to b
        | y > 0 && b'== 0  = pour x (y - 1) ((a', b):ps) -- fill b
        | y > 0 && a'== a  = pour (x + 1) y ((0, b'):ps) -- empty a
        | y > 0 = pour x y ((min (a' + b') a,
                             max (a' + b' - a) 0):ps) -- b to a

-- Some test data:
-- a = 3, b = 5, g = 4
-- a = 4, b = 9, g = 6

prop_gcm :: Int -> Int -> Bool
prop_gcm a b = (g == gcd a' b') && (a' * x + b' * y == g) where
  (g, x, y) = gcmex a' b'
  (a', b') = (abs a, abs b)
