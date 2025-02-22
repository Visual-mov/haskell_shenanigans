fb :: Integer -> String
fb n
    | divis 15    = "Fizzbuzz"
    | divis 5     = "Buzz"
    | divis 3     = "Fizz"
    | otherwise = show n
    where divis m = n `mod` m == 0 && (n /= 0)

fb' :: Integer -> String
fb' 0 = "0"
fb' n
    | n `mod` 15 == 0 = "Fizzbuzz"
    | n `mod` 5 == 0  = "Buzz"
    | n `mod` 3 == 0  = "Fizz"
    | otherwise = show n

fbRange :: Integer -> Integer -> [String]
fbRange min max = map fb [min..max]
 
main :: IO()
main = do
    -- putStr $ unlines $ fbRange 1 20
    -- putStr $ unlines $ map fb [1..20]
    putStr $ unlines $ map fb' [1..20]