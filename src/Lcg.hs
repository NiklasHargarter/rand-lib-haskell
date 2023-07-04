module Lcg (next, m) where

a :: Int
a = 1103515245

c :: Int
c = 12345

m :: Int
m = 2 ^ 31

next' :: Int -> Int -> Int -> Int -> Int
next' x a' c' m' = (a' * x + c') `mod` m'

next :: Int -> Int
next x = next' x a c m
