import System.IO
import Data.List

collatz :: Integer -> ([String], Int)
collatz n = do
    let list = collatzList n
    (list, length list) where
        collatzList 1 = ["1"]
        collatzList n = show n : collatzList (if even n then n `div` 2 else 3*n+1)

main :: IO ()
main = do
    putStr "n: "
    hFlush stdout
    n <- getLine
    let (list, len) = collatz (read n)
    putStrLn $ intercalate "," list
    putStrLn $ "took " ++ show len ++ " steps"