{
module RDFToken where 
}

%wrapper "posn" 
$digit = 0-9      
$alpha = [a-zA-Z] 
$sign = [\+ \-]
$name = [a-zA-Z0-9]
$as = [\x00-\x7F]

tokens :-      
$white+         ;
  "--".*          ;    
  $sign? $digit+   { \p s -> TokenIntLiteral p (read s) } 
  $as              { \p s -> TokenStrLiteral p s } 
  true             { \p s -> TokenTrue p s } 
  false            { \p s -> TokenFalse p s } 
  "@base"          { \p s -> TokenBase p }
  "@prefix"        { \p s -> TokenPrefix p }
  $alpha \:        { \p s -> TokenPrefixName p s }
  "http://"        { \p s -> TokenHTTP p }
  $name+ \.        { \p s -> TokenDomain p s }
  \/ $name+        { \p s -> TokenSubDomain p s }
  \# $name+        { \p s -> TokenTag p s }
  \"               { \p s -> TokenQuote p }
  \;               { \p s -> TokenSemiColon p }
  \.               { \p s -> TokenFullStop p }
  \<               { \p s -> TokenLessThan p }
  \>               { \p s -> TokenGreaterThan p }

{
-- Each action has type :: AlexPosn -> String -> RDFToken

-- The token type:
data RDFToken = 
  TokenIntLiteral AlexPosn Int         |
  TokenStrLiteral AlexPosn String      | 
  TokenTrue AlexPosn String            |
  TokenFalse AlexPosn String           |
  TokenBase AlexPosn                   |
  TokenPrefix AlexPosn                 |
  TokenPrefixName AlexPosn String      |
  TokenHTTP AlexPosn                   |
  TokenDomain AlexPosn String          |
  TokenSubDomain AlexPosn String       |
  TokenTag AlexPosn String             |
  TokenQuote AlexPosn                  |
  TokenSemiColon AlexPosn              |
  TokenFullStop AlexPosn               |
  TokenLessThan AlexPosn               |
  TokenGreaterThan AlexPosn           
  deriving Show 

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".

tokenPosn :: RDFToken -> String
tokenPosn (TokenIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStrLiteral  (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrefix (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrefixName (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHTTP  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDomain (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSubDomain) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTag (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenQuote (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}
