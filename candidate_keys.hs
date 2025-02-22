import Data.List.Split

type Attribute  = Char
type Dependency = ([Attribute], [Attribute])
type Relation   = ([Attribute], [Dependency])

closure :: Attribute -> [Dependency] -> [Attribute]
closure _ [] = []
closure attr (d : tail) = if attr `elem` fst d then splitOn "," (snd d) ++ closure attr tail
                          else closure attr tail

-- getCandidateKeys :: Relation -> [Attributes]

main :: IO()
main = do
    let fds = [("A", "B"), ("B", "A,C")]
    let relation = ("A,B,C", fds)

    --print $ splitOn "," (snd $ last fds)
    -- print $ closure 'B' fds