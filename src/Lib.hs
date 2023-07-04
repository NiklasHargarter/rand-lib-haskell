module Lib
  ( someFunc,
  )
where

import Lcg
import MiddleSquare

someFunc :: IO ()
someFunc = do
  print "1000 random numbers created with a linear congruential generator between 0 and 100, seed = 1122334455"
  print (lcg 1000 1122334455)
  print "1000 random numbers created with a linear congruential generator, seed = 1122334455"
  print (nRand 1000 1122334455 Lcg.next)
  print "1000 random numbers created with a middlesquare generator between 0 and 100, seed = 5337"
  print (middleSquare 1000 5337)

lcg :: Int -> Int -> [Int]
lcg n seed = gatedNRand n seed 0 100 0 (Lcg.m - 1) Lcg.next

middleSquare :: Int -> Int -> [Int]
middleSquare n seed = gatedNRand n seed 0 100 0 (MiddleSquare.m - 1) MiddleSquare.next

nRand :: Int -> Int -> (Int -> Int) -> [Int]
nRand 0 _ _ = []
nRand n seed f = f seed : nRand (n - 1) (f seed) f

gatedNRand :: Int -> Int -> Int -> Int -> Int -> Int -> (Int -> Int) -> [Int]
gatedNRand n seed lower upper oldMin oldMax f = map (convertRatio oldMin oldMax lower upper) (nRand n seed f)

convertRatio :: Int -> Int -> Int -> Int -> Int -> Int
convertRatio oldMin oldMax newMin newMax value = round (fromIntegral ((value - oldMin) * (newMax - newMin)) / fromIntegral (oldMax - oldMin)) + newMin
