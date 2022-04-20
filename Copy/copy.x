{
module RDFToken where 
}

%wrapper "posn" 
$digit = 0-9      --digits 
$alpha = [a-zA-z] --leters 

tokens :-      --
$white+         ;
  "--".*        ;   
  --[[+-]?[0-9]+]   { \p s -> TokenIntLiteral p (read s) } 
  $alpha          { \p s -> TokenStrLiteral p (read s) } 
  \@base          { \p s -> TokenBase p (read s) }
  \@prefix        { \p s -> TokenPrefix p (read s) }
  \.              { \p s -> TokenFullStop p (read s) }
  \<              { \p s -> TokenLessThan p (read s) }
  \>              { \p s -> TokenGreaterThan p (read s) }
  {- \:             { \p s -> TokenColon }
     \#             { \p s -> TokenHashtag }
     \/             { \p s -> TokenForwardslash }
  -} 

-- Each action has type :: AlexPosn -> String -> RDFToken 

-- The token type:

{
data RDFToken = 
 -- TokenIntLiteral AlexPosn Int      | 
  TokenStrLiteral AlexPosn String   | 
  TokenBase AlexPosn                |
  TokenPrefix AlexPosn              |
  TokenFullStop AlexPosn            |
  TokenLessThan AlexPosn            |
  TokenGreaterThan AlexPosn           
  deriving Show 

  {- TokenColon AlexPosn            | 
  TokenHashtag AlexPosn             |
  TokenForwardSlash AlexPosn        |
  -}  

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".


tokenPosn :: RDFToken -> String
--tokenPosn (TokenIntLiteral (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStrLiteral  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}
