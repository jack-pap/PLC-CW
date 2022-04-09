{
module RDFToken where 
}

%wrapper "posn" 
$digit = 0-9      
$alpha = [a-zA-Z] 
$sign = [\+ \-]
$name = [a-zA-Z0-9]
$ascii = [\x00-\x7F]

tokens :-      
$white+         ;
  "--".*        ;     
  true                { \p s -> TokenTrue p s } 
  false               { \p s -> TokenFalse p s } 
  "@base"             { \p s -> TokenBase p }
  "@prefix"           { \p s -> TokenPrefix p }
  "http://"           { \p s -> TokenHTTP p } 
  $name+              { \p s -> TokenName p s }       
  \:                  { \p s -> TokenColon p } 
  \/                  { \p s -> TokenBackSlash p }
  \#                  { \p s -> TokenTag p }
  \"                  { \p s -> TokenQuote p }
  \;                  { \p s -> TokenSemiColon p }
  \,                  { \p s -> TokenComma p }
  \.                  { \p s -> TokenFullStop p }
  \<                  { \p s -> TokenLessThan p }
  \>                  { \p s -> TokenGreaterThan p }
  $sign? $digit+      { \p s -> TokenIntLiteral p (read s) }  
  \" $ascii+ \"       { \p s -> TokenStrLiteral p s }
  
  

{
  
-- WHITESPACE MAY NOT BE NEEDED ASK TO MAKE SURE
-- Each action has type :: AlexPosn -> String -> RDFToken

-- The token type:
data RDFToken = 
  TokenTrue AlexPosn String            |
  TokenFalse AlexPosn String           |
  TokenBase AlexPosn                   |
  TokenPrefix AlexPosn                 |
  TokenHTTP AlexPosn                   |
  TokenName AlexPosn String            |
  TokenColon AlexPosn                  |
  TokenBackSlash AlexPosn              |
  TokenTag AlexPosn                    |
  TokenQuote AlexPosn                  |
  TokenSemiColon AlexPosn              |
  TokenComma AlexPosn                  |
  TokenFullStop AlexPosn               |
  TokenLessThan AlexPosn               |
  TokenGreaterThan AlexPosn            |
  TokenIntLiteral AlexPosn Int         |
  TokenStrLiteral AlexPosn String                                            
  deriving Show 

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".

tokenPosn :: RDFToken -> String
tokenPosn (TokenTrue (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrefix (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenHTTP  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenName (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBackSlash (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTag (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenQuote (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStrLiteral  (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)

}
