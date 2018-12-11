sol = [(x, y, z, n) |
         x <- [2, 3],
         y <- [(x + 1) .. 6],
         z <- [(y + 1) .. 12], x * y * z - y * z - x * z - x * y /= 0,
         n <- [(y * z + x * z + x * y) `div` (x * y * z - y * z - x * z - x * y)],
         (n + 1) `div` x + (n + 1) `div` y + (n + 1) `div` z == n, n > 0]
