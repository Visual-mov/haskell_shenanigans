import System.IO
import Data.List

collatz :: Integer -> [String]
collatz 1 = ["1"]
collatz n = show n : collatz (if even n then n `div` 2 else 3*n+1)

main :: IO ()
main = do
    putStr "n: "
    hFlush stdout
    n <- getLine
    putStrLn $ intercalate ", " (collatz (read n))