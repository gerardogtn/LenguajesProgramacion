module Intro.Math
    ( factorialTail,
      factorialStack
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
