module Homework.Homework02
    ( newtonRaphson,
      insertionSort
    ) where

insertionSort :: (Ord a) => [a] -> [a]
insertionSort [] = []
insertionSort [x] = [x]
insertionSort (x:xs) = insert $ insertionSort xs
    where insert [] = [x]
          insert (y:ys)
            | x < y = x : y : ys
            | otherwise = y : insert ys


newtonRaphson :: (Floating a, Ord a) => (a -> a) -> (a -> a) -> a -> a
newtonRaphson f df x0 = newtonRaphson' f df x0 0
  where
    newtonRaphson' f df x0 i
      | i == maxIt = error "A solution couldn't be found"
      | abs (x1 - x0) < epsilon = x0
      | otherwise = newtonRaphson' f df x1 (i + 1)
      where
      maxIt = 50
      epsilon = 1/100
      x1 = x0 - ( f x0 / df x0)
