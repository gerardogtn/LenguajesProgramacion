module Homework.Homework01
    ( maxMins
    ) where

maxMins :: (Ord a) => [[a]] -> [(a, a)]
maxMins list = maxMins' list []

maxMins' :: (Ord a) => [[a]] -> [(a, a)] -> [(a, a)]
maxMins' missing out
        | null missing = out
        | not (null (last missing)) = maxMins' (init missing) (maxMin (last missing):out)
        | otherwise = maxMins' (init missing) out

maxMin  :: (Ord a) => [a] -> (a, a)
maxMin [] = error "An empty list has no max or min"
maxMin list = maxMin' (head list) (head list) (tail list)
              where maxMin' cmax cmin rest
                     | null rest = (cmax, cmin)
                     | otherwise = maxMin' (max cmax (head rest)) (min cmin (head rest)) (tail rest)
