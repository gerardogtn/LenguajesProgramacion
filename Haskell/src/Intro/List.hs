module Intro.List
    ( max',
      min',
      maxMin,
      reverse'
    ) where

max' :: (Ord a) => [a] -> a
max' [] = error "An empty list has no max"
max' list = max' (head list) (tail list)
            where max' cmax rest
                   | null rest = cmax
                   | head rest > cmax = max' (head rest) (tail rest)
                   | otherwise = max' cmax (tail rest)

min' :: (Ord a) => [a] -> a
min' [] = error "An empty list has no min"
min' list = min' (head list) (tail list)
            where min' cmin rest
                   | null rest = cmin
                   | head rest < cmin = min' (head rest) (tail rest)
                   | otherwise = min' cmin (tail rest)

maxMin :: (Ord a) => [a] -> (a, a)
maxMin [] = error "An empty list has no max or min"
maxMin list = maxMin' (head list) (head list) (tail list)
              where maxMin' cmax cmin rest
                     | null rest = (cmax, cmin)
                     | otherwise = maxMin' (max cmax (head rest)) (min cmin (head rest)) (tail rest)

reverse' :: [a] -> [a]
reverse' [] = []
reverse' list = rev [head list] (tail list)
               where rev reversed missing
                      | null missing = reversed
                      | otherwise = rev (head missing:reversed) (tail missing)
