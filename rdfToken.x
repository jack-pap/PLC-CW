{ 
module RDFTokens where 
}

%wrapper "posn" 
$digit = 0-9      --digits 
$alpha = [a-zA-z] --leters 

tokens :-       :
$white+         ;
  "--".*        ;   
  [[+-]?[0-9]+]  { \p s -> TokenIntLiteral p (read s) } 
  $alpha         { \p s -> TokenStrLiteral p (read s) }
  [1-9]          { (\p s -> TokenDigit p (read s)) } 
  @base          { \p s -> TokenBase p (read s) }
  @prefix        { \p s -> TokenPrefix p (read s) }
  \.             { \p s -> TokenFullStop p (read s)}
  \<             { \p s -> TokenLessThan} 
  \>             { \p s -> TokenGreaterThan} 
  -- \:             { \p s -> TokenColon}
  -- \#             { \p s -> TokenHashtag}
  -- \/             { \p s -> TokenForwardSlash}

{ 

-- Each action has type :: AlexPosn -> String -> RDFToken 

-- The token type:

data RDFToken = 
  TokenIntLiteral AlexPosn Int      | 
  TokenStrLiteral AlexPosn String   | 
  TokenDigit AlexPosn Int           | 
  TokenBase AlexPosn ??             |
  TokenPrefix AlexPosn ??           |
  TokenFullStop AlexPosn            |
  TokenLessThan AlexPosn            |
  TokenGreaterThan AlexPosn           
  deriving Show 

  {- TokenColon AlexPosn            |
  TokenHashtag AlexPosn             |
  TokenForwardSlash AlexPosn        |
  -}  

tokenPosn :: MDLToken -> String
tokenPosn (TokenIntLiteral (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStrLiteral  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDigit  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHashtag (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenForwardSlash (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}
