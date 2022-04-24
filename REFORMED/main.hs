import RDFToken
import RDFGrammar
import RDFType
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do putStrLn ("Ayack Interactive Mode - enter an expression : ")
           sourceText <- getLine
           let parsedProg = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed as " ++ (show parsedProg) ++ "\n")
           putStrLn ("Type Checking : " ++ (show parsedProg) ++ "\n")
           let typedProg = typeOfE parsedProg
           putStrLn ("Type Checking Passed with type " ++ (unparseType typedProg) ++ "\n")
           main'

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               putStrLn("----------------")
               hPutStrLn stderr err
               putStrLn("----------------")
               main