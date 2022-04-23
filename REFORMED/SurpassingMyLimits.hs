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

fileMZip' fileName = 
  do s <- readFile fileName
     let ls = lines(s)
     let bases = clean base ls
     let prefixes = hashIt (getBase bases) (clean prefix ls)
     let unformatTriples = clean triple ls
     let triple = formatTriples unformatTriples bases prefixes
     --let x = flat bases 
     --let y = flat prefixes
     let z = flat triple
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
formatTriples (t:ts) base hashmap = (formatATriple (splitOn ' ' dotRemoved) base hashmap) : (formatTriples ts base hashmap)
                   where dotRemoved = removeWhiteSpace (init (removeWhiteSpace t))

formatATriple :: [String] -> [String] -> Hashmap -> String
formatATriple [] base hashmap = ""
formatATriple (t:ts) base hashmap = fixFormat base hashmap t ++ formatATriple ts base hashmap

-- improve by adding parsing to check the format of uri (more accurately) + same for addBase and try to combine those two functions
-- Also improve it so it can regonise sub, pred, obj and puts spaces for obj if they r literal 
-- + consider future problems of many pred and obj + obj lists (use split ','/';' and a helper function as an optional function)
fixFormat :: [String] -> Hashmap -> String -> String  
fixFormat base hashmap uri@('<':'h':'t':'t':'p':':':ls) = uri -- normal
fixFormat base hashmap ('<':ls) = "<" ++ getBase base ++ ls -- base
fixFormat base hashmap (x:':':ls) = "<" ++ (getPrefix x hashmap) ++ ls ++ ">" -- prefix
fixFormat base hashmap ls = ls

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

flat :: [String] -> String 
flat [] = ""
flat (l:ls) = l ++ " ." ++ ('\n' : []) ++ flat ls
-- process :: String -> String 
-- process [] = ""
-- process ('h':ls) = process ls
-- process (l:ls) = l : process ls
 
filehandler :: IOException -> IO ()  
filehandler e = 
  do let err = show (e :: IOException)
     hPutStr stderr ("Warning: Couldn't open input/output file : " ++ err)
     return ()




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