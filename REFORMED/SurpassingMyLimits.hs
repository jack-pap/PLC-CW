module Helper where


import Data.List
import Control.Exception
import System.IO
import GHC.Event.Windows (processRemoteCompletion)
import Text.Parsec.Token (GenTokenParser(symbol, parens))


type Hashmap = [(Char, String)]

getAllFiles :: [String] -> IO()

getAllFiles [] = putStr ""
getAllFiles (file:files) = do fileMZip file
                              putChar '\n'
                              getAllFiles files

--listToIO :: [IO()] -> IO()
--listToIO file

fileMZip :: String -> IO ()
fileMZip file = catch (fileMZip' file) filehandler 

filehandler :: IOException -> IO ()  
filehandler e = 
  do let err = show (e :: IOException)
     hPutStr stderr ("Warning: Couldn't open input/output file : " ++ err)
     return ()

fileMZip' fileName = 
  do s <- readFile fileName
     let ls = lines(s)
     let bases = clean base ls
     let prefixes = hashIt (getBase bases) (clean prefix ls)
     let unformatTriples = splitting (clean triple ls)
     let triple = formatTriples unformatTriples bases prefixes
     --let x = flat bases 
     --let y = flat prefixes
     let z = flattenWithDot triple
     --putStr (getBase bases)
     --putStr y
     putStr z



getBase :: [String] -> String 
getBase b = removeSides (splitted !! 1)
         where splitted = splitOn '<' (b !! 0)

getPrefix :: Char -> Hashmap -> String 
getPrefix name [] = error "There is a prefix used that doesn't exists"
getPrefix name (p:ps) | name == (fst p) = snd p
                      | otherwise = getPrefix name ps

formatTriples :: [String] -> [String] -> Hashmap -> [String] 
formatTriples [] base hashmap = []
formatTriples (t:ts) base hashmap = (formatATriple splitted base hashmap) : (formatTriples ts base hashmap)
                   where dotRemoved = removeWhiteSpace (init (removeWhiteSpace t))
                         splitted = removeWhiteSpaceList (splitOn ' ' (spaceSeperateTriple dotRemoved))

formatATriple :: [String] -> [String] -> Hashmap -> String
formatATriple [] base hashmap = ""
formatATriple (t:ts) base hashmap = fixFormat base hashmap t ++ formatATriple ts base hashmap
-- -- formatATriple [] base hashmap = ""
-- formatATriple t base hashmap = fixFormat base hashmap Sub -- ++ fixFormat base hashmap Pred ++ fixFormat base hashmap Obj
--                    --where t

-- improve by adding parsing to check the format of uri (more accurately) + same for addBase and try to combine those two functions
-- Also improve it so it can regonise sub, pred, obj and puts spaces for obj if they r literal 
-- + consider future problems of many pred and obj + obj lists (use split ','/';' and a helper function as an optional function)
fixFormat :: [String] -> Hashmap -> String -> String  
fixFormat base hashmap uri@('<':'h':'t':'t':'p':':':ls) = uri -- normal
fixFormat base hashmap ('<':ls) = "<" ++ getBase base ++ ls -- base
fixFormat base hashmap (x:':':ls) = "<" ++ (getPrefix x hashmap) ++ ls ++ ">" -- prefix
fixFormat base hashmap ls = ls


splitting :: [String] -> [String]
splitting [] = []
splitting (triple : triples) | length (splittedPred) > 1 = (multiPreds (splittedPred !! 0) splittedPred) ++ splitting triples
                             | length (splittedObj) > 1 = (multiObjs (splittedObj !! 0) splittedObj) ++ splitting triples
                             | otherwise = [triple] ++ splitting triples
       where splittedPred = splitOn ';' triple
             splittedObj = splitOn ',' triple


multiPreds :: String -> [String] -> [String]
multiPreds first [] = []
multiPreds first (triple:[]) = [stickSub first triple]
multiPreds first (triple:triples) | length (splittedObj) > 1 = multiObjs (splittedObj !! 0) splittedObj ++ multiPreds first triples
                                  | otherwise = [stickSub first triple ++ " ."] ++ multiPreds first triples
      where formattedPred = stickSub first triple
            splittedObj = splitOn ',' formattedPred

multiObjs :: String -> [String] -> [String]
multiObjs first [] = []
multiObjs first (triple:[]) = [stickSubPred first triple]
multiObjs first (triple:triples) = [stickSubPred first triple ++ " ."] ++ multiObjs first triples

      --normalTriple splitted
      --where splitted = splitOn ',' s

stickSub :: String -> String -> String
stickSub first s | first /= s = sub ++ s
                 | otherwise = s
      where splittedFirst = filterWhiteSpaces (splitOn ' ' first)
            sub = splittedFirst !! 0

stickSubPred :: String -> String -> String
stickSubPred first s | first /= s = subPred ++ s
                 | otherwise = s
      where splittedFirst = filterWhiteSpaces (splitOn ' '  first)
            subPred = splittedFirst !! 0 ++ " " ++ splittedFirst !! 1

-- Add to each splitOn ' ' 
filterWhiteSpaces :: [String] -> [String]
filterWhiteSpaces [] = []
filterWhiteSpaces (t:ts) | t == "" = filterWhiteSpaces ts
                         | otherwise = t : filterWhiteSpaces ts 



addBase :: String -> String -> String 
addBase base uri@('h':'t':'t':'p':':':ls) = uri
addBase base ls = base ++ ls

hashIt :: String -> [String] -> Hashmap
hashIt base [] = []
hashIt base (s:ss) = (last (init (removeWhiteSpace first)), addBase base (removeSides second)) : hashIt base ss
             where split = (splitOn '<' s)
                   first = split !! 0
                   second = split !! 1

clean :: (String -> Bool) -> [String] -> [String]
clean uriType [] = []
clean uriType (s:ss) | uriType s = s : clean uriType ss
                     | otherwise = clean uriType ss

base :: String -> Bool -- to exclude white space at the begining 
base ('@':'b':'a':'s':'e':ls) = True 
base ls = False 

prefix :: String -> Bool
prefix ('@':'p':'r':'e':'f':'i':'x':ls) = True
prefix ls = False

emptyLine :: String -> Bool
emptyLine [] = True 
emptyLine ls = False

triple :: String -> Bool 
triple ls | (base ls || prefix ls || emptyLine ls) = False 
          | otherwise = True

flattenWithDot :: [String] -> String 
flattenWithDot [] = ""
flattenWithDot (l:ls) = l ++ " ." ++ ('\n' : []) ++ flattenWithDot ls
-- process :: String -> String 
-- process [] = ""
-- process ('h':ls) = process ls
-- process (l:ls) = l : process ls




splitOn :: Char -> String -> [String]
splitOn c [] = []
splitOn c ls = (takeWhile (/=c) ls) : splitOn' c (dropWhile (/=c) ls)
 where splitOn' c [] = []
       splitOn' c (x:[]) | x==c = [[]]
       splitOn' c (x:xs) | x==c = splitOn c xs
                         | otherwise = []

removeWhiteSpace :: String -> String
removeWhiteSpace (' ':name) | (last name) == ' ' = init (removeWhiteSpace name)
                            | otherwise = removeWhiteSpace name
removeWhiteSpace name | (last name) == ' ' = removeWhiteSpace (init name)
                      | otherwise = name
                
removeWhiteSpaceList :: [String] -> [String]
removeWhiteSpaceList = map removeWhiteSpace

removeSides :: String -> String 
removeSides string = first
    where ls = removeWhiteSpace string
          splitted = splitOn '>' ls
          first = splitted !! 0

putBackBracket :: [String] -> [String]
putBackBracket [] = []
putBackBracket (t:ts) = ("<" ++ t) : putBackBracket ts

spaceSeperateTriple :: String -> String
spaceSeperateTriple t = flattenedList
              where flattenedList = removeWhiteSpace (flatten (addSpaces (removeWhiteSpaceList (filterWhiteSpaces (splitOn '>' t)))))
                    --dotRemoved = removeWhiteSpace (init (removeWhiteSpace flattenedList))

addSpaces :: [String] -> [String]
addSpaces [] = []
addSpaces (('<':t):ts) = (" <" ++ t ++ ">") : addSpaces ts
addSpaces (t:ts) = (' ':t) : addSpaces ts

flatten :: [String] -> String 
flatten [] = ""
flatten (l:ls) = l ++ flatten ls