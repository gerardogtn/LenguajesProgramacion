module Currying.HighOrder
    (combine,
    find,
    highestDivisor
    ) where

combine :: (Num a) => (a -> a -> a) -> [a] -> [a] -> [a]
combine _ [] [] = []
combine f (x:xs) (y:ys) = [f x y]++(combine f xs ys)
combine _ _ _ = error "The parameters don't have the same size"

find :: (Ord a, Eq a) => (a -> Bool) -> [a] -> [a]
find _ [] = []
-- find f (x:xs) = if f x then x:find f xs else find f xs
find f x = find' x []
  where find' x' out
         | null x' = out
         | f (last x') = find' (init x') (last x':out)
         | otherwise = find' (init x') out 

highestDivisor :: (Integral a, Eq a) => a -> a -> a
highestDivisor _ 1 = 1
highestDivisor num upperBound = highestDivisor' num [upperBound, upperBound - 1.. 1]
  where highestDivisor' num list
          | null list = error "No divisor found :("
          | mod (head list) num == 0 = head list
          | otherwise = highestDivisor' num (tail list)
