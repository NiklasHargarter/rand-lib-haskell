module MiddleSquare (next, m) where

next :: Int -> Int
next seed = read (takeMiddle4 (padTo8 (show (seed ^ 2))))

m :: Int
m = 10000

padTo8 :: String -> String
padTo8 s
  | length s == 8 = s
  | length s > 8 = padTo8 (drop 1 s)
  | otherwise = padTo8 ('0' : s)

takeMiddle4 :: String -> String
takeMiddle4 = take 4 . drop 2
