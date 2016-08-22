module Intro.Sort
    ( insertion,
      selection,
      quick,
      merge
    ) where

insertion :: (Ord a) => [a] -> [a]
insertion [] = []
insertion [x] = [x]
insertion (x:xs) = insert $ insertion xs
    where insert [] = [x]
          insert (y:ys)
            | x < y = x : y : ys
            | otherwise = y : insert ys



quick :: (Ord a) => [a] -> [a]
quick [] = []
quick (x:xs) =
  let smallerSorted = quick [a | a <- xs, a <= x]
      biggerSorted = quick [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted

selection :: (Ord a) => [a] -> [a]
selection [] = []
selection x = selection' x []
  where
    selection' x out
          | null x = out
          | otherwise = selection' (dropElement x (minimum x)) (out ++ [minimum x])

dropElement :: (Eq a) => [a] -> a -> [a]
dropElement [] _ = []
dropElement x a = dropElement' x a []
    where dropElement' x a out
            | null x = out
            | head x == a = reverse out ++ tail x
            | otherwise = dropElement' (tail x) a (head x:out)

merge :: (Ord a) => [a] -> [a]
merge [] = []
merge list = list -- STUB
