import System.Random
import System.IO

-- higher or lower number guessing game

prompt :: String -> IO String
prompt str = do putStr str; hFlush stdout; getLine

doGame :: Int -> Int -> IO Bool
doGame n rounds = do
    line <- prompt "guess: "
    let guess = read line

    -- I barely understand what's going on here!
    if guess == n then
        return True
    else if rounds > 1 then do
        putStrLn (if guess > n then "lower!!" else "higher!!")
        doGame n (rounds-1)
    else
        return False

main :: IO ()
main = do
    rounds <- prompt "number of rounds: "
    n <- randomRIO (1, 25) :: IO Int
    result <- doGame n (read rounds)
    putStrLn $ if result then "you won" else "you lost"
    
