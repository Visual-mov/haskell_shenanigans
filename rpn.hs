import System.IO
import Data.Char

-- reverse polish notation calculator

type Stack = [Float]
type BinOp = (Float -> Float -> Float) 

prompt :: String -> IO String
prompt str = do
    putStr str
    hFlush stdout
    getLine

isFloat :: String -> Bool
isFloat "" = False
isFloat str = isDigit (head str)

doOp :: BinOp -> Stack -> Stack
doOp _ [] = []
doOp _ [x] = error "operator requires two arguments"
doOp f (x:y:tail) = y `f` x : tail

rpn :: [String] -> Stack -> Stack
rpn [] state = reverse state
rpn (t:tail) state = rpn tail (case t of
        "+" -> doOp (+) state
        "-" -> doOp (-) state
        "*" -> doOp (*) state
        "/" -> doOp (/) state
        _   -> if isFloat t then read t : state
               else error "unrecognized token"
    )

main :: IO ()
main = do
    line <- prompt ">> "
    if line == "q" then
        return ()
    else do
        let tokens = words line
        print $ rpn tokens []
        main