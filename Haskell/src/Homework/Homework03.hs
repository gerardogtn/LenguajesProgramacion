module Homework.Homework03
    ( smallestDivisor,
      nthPrime,
      circularPrimes,
      primes,
      isPrime
    ) where
import Data.List

smallestDivisor:: (Integral a) => a -> a -> a
smallestDivisor lowerBound upperBound = smallestDivisor' [lowerBound..upperBound] 1
  where smallestDivisor' elements acc
          | null elements = acc
          | otherwise = smallestDivisor' (tail elements) (lcm (head elements) acc)

nthPrime :: (Integral a) => Int -> a
nthPrime n = getPrimes !! (n - 1)

circularPrimes :: Integer -> [Integer]
circularPrimes upperBound = filter isCircularPrime (primes upperBound)

isCircularPrime :: Integer -> Bool
isCircularPrime x = all isPrime (map (\y -> read y :: Integer) (permutations (show x)))

-- highestPrimeSum

primes :: Integer -> [Integer]
primes n =
  let primeApproximation = [2..n]
  in primes' primeApproximation []
  where
    primes' [] acc = acc
    primes' elements acc =
          let nextPrimes = filter (\x -> x `mod` head elements /= 0) elements
          in
          primes' nextPrimes (acc++[head elements])

getPrimes :: (Integral a) => [a]
getPrimes = filter isPrime [1..]

isPrime :: (Integral a) => a -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime n
  | n `mod` 2 == 0 = False
  | n `mod` 3 == 0 = False
  | otherwise = null [ x | x <- [2..n - 1], n `mod`x  == 0]
