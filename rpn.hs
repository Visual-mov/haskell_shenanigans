type State = [Float]
type BinOp = (Float -> Float -> Float) 

doOp :: BinOp -> State -> State
doOp _ [] = []
doOp _ [x] = error "operator requires two arguments"
doOp f (x:y:tail) = y `f` x : tail

rpn :: [String] -> State -> State
rpn [] state = reverse state
rpn (t:rest) state = rpn rest (case t of
        "+" -> doOp (+) state
        "-" -> doOp (-) state
        "*" -> doOp (*) state
        "/" -> doOp (/) state
        _ -> read t : state
    )

main :: IO()
main = do
    src <- getLine
    if src == "q" then
        return ()
    else do
        let tokens = words src
        print $ rpn tokens []
        main