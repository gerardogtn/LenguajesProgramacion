module Examen.LargestPalindromeProduct(palindrome) where

palindrome :: (Integral a) => a -> Integer
palindrome 1 = 9
palindrome n =
  let upperBound = (10^n) - 1
      lowerBound = 10^(n - 1)
      nums = [upperBound,upperBound-1..lowerBound]
  in palindrome nums nums nums 9
  where palindrome firstNums secondNums nums acc
          | null firstNums = acc
          | null secondNums = palindrome (tail firstNums) nums nums acc
          | largerPalindrome (head firstNums * head secondNums) acc = palindrome firstNums (tail secondNums) nums (head firstNums * head secondNums)
          | otherwise = palindrome firstNums (tail secondNums) nums acc

largerPalindrome :: Integer -> Integer -> Bool
largerPalindrome num acc = isPalindrome num && num > acc

isPalindrome :: Integer -> Bool
isPalindrome num = (read (reverse (show num)) :: Integer) == num
