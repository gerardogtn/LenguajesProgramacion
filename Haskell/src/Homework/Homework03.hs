module Homework.Homework03
    ( smallestDivisor,
      isDivisible,
      nthPrime,
      isPrime
    ) where

smallestDivisor:: (Integral a) => a -> a -> a
smallestDivisor lowerBound upperBound
  = head $ filter (isDivisible [lowerBound..upperBound]) [2..]

isDivisible:: (Integral a) => [a] -> a -> Bool
isDivisible elements num = all (\x -> num `mod` x == 0) elements


nthPrime :: (Integral a) => Int -> a
nthPrime n = getPrimes !! (n - 1)


-- circularPrimes :: (Integral a) => a -> [a]
-- circularPrimes upperBound =

-- highestPrimeSum

getPrimes :: (Integral a) => [a]
getPrimes = filter isPrime [1..]

isPrime :: (Integral a) => a -> Bool
isPrime 1 = False
isPrime n = null [ x | x <- [2..n - 1], n `mod`x  == 0]
