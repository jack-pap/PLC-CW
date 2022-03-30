{
module RDFToken where 
}

%wrapper "posn" 
$digit = 0-9      
$alpha = [a-zA-Z] 
$sign = [\+ \-]

tokens :-      
$white+         ;
  "--".*        ;    
  $sign? $digit+   { \p s -> TokenIntLiteral p (read s) } 
  $alpha           { \p s -> TokenStrLiteral p s } 
  "@base"          { \p s -> TokenBase p }
  "@prefix"        { \p s -> TokenPrefix p }
  \.               { \p s -> TokenFullStop p }
  \<               { \p s -> TokenLessThan p }
  \>               { \p s -> TokenGreaterThan p }

-- Each action has type :: AlexPosn -> String -> RDFToken

-- The token type:

{
data RDFToken = 
  TokenIntLiteral AlexPosn Int         |
  TokenStrLiteral AlexPosn String      | 
  TokenBase AlexPosn                   |
  TokenPrefix AlexPosn                 |
  TokenFullStop AlexPosn               |
  TokenLessThan AlexPosn               |
  TokenGreaterThan AlexPosn           
  deriving Show 

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".

tokenPosn :: RDFToken -> String

tokenPosn (TokenIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStrLiteral  (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}
