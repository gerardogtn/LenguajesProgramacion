module Intro.Math
    ( factorialTail,
      factorialStack,
      newtonRaphson
    ) where

factorialTail :: (Integral a) => a -> a
factorialTail 0 = 1
factorialTail x = ft (x - 1) x
                  where ft n res
                         | n == 0 = res
                         | otherwise = ft (n - 1) (res * n)

factorialStack :: (Integral a) => a -> a
factorialStack 0 = 1
factorialStack n = n * factorialStack (n - 1)

newtonRaphson :: (Floating a, Ord a) => (a -> a) -> (a -> a) -> a -> a
newtonRaphson f df x0
              | abs (x1 - x0) < epsilon = x0
              | otherwise = newtonRaphson f df x1
              where
                epsilon = 1/100
                x1 = x0 - ( f x0 / df x0)
