{
module RDFToken where 
}

%wrapper "posn" 
$digit = 0-9      
$alpha = [a-zA-Z] 
$sign = [\+ \-]
$ascii = [^\"\*\,\;\.\>\<\=]
  
tokens :-      
$white+         ;
  "--".*        ;  
  
  -------------------------------
  --            TYPES          --
  ------------------------------- 
  
  Bool        { \p s - > TokenTypeBool p }
  Int         { \p s - > TokenTypeInt p }
  String      { \p s - > TokenTypeString p }
  Base        { \p s - > TokenTypeBase p }
  Prefix      { \p s - > TokenTypePrefix p }
  Triple      { \p s - > TokenTypeTriple p }
  Sub         { \p s - > TokenTypeSub p }
  Pred        { \p s - > TokenTypePred p }
  Obj         { \p s - > TokenTypeObj p }
  URI         { \p s - > TokenTypeURI p }    

  -------------------------------
  --          LITERALS         --
  -------------------------------
  
  true                { \p s -> TokenTrue p s } 
  false               { \p s -> TokenFalse p s } 
  $sign? $digit+      { \p s -> TokenIntLiteral p (read s) } 
  $digit+             { \p s -> TokenPositiveIntLiteral p (read s) } 
  $ascii+             { \p s -> TokenStringLiteral p s}
  "@base"             { \p s -> TokenBase p }
  "@prefix"           { \p s -> TokenPrefix p }

  -------------------------------
  --           SYMBOLS         --
  -------------------------------
  
  \"                  { \p s -> TokenQuote p }
  \*                  { \p s -> TokenAsterisks p }
  \,                  { \p s -> TokenComma p }
  \;                  { \p s -> TokenSemiColon p }
  \.                  { \p s -> TokenFullStop p }
  

  ----------------------------------
  --            OPERATORS         --
  ----------------------------------
  
  
  -----------------------------------------
  --           COMPARE OPERATORS         --
  -----------------------------------------
  
  \>                  { \p s -> TokenGreaterThan p }
  \<                  { \p s -> TokenLessThan p }
  \=                  { \p s -> TokenEqual p }
  "!="                { \p s -> TokenNotEqual p }
  ">="                { \p s -> TokenGreaterOrEqual p }
  "<="                { \p s -> TokenLessOrEqual p }
  
  

{
  
-- WHITESPACE MAY NOT BE NEEDED ASK TO MAKE SURE
-- Each action has type :: AlexPosn -> String -> RDFToken

-- The token type:
data RDFToken = 
  TokenTypeBool AlexPosn               |
  TokenTypeInt AlexPosn                |
  TokenTypeString AlexPosn             |
  TokenTypeBase AlexPosn               |
  TokenTypePrefix AlexPosn             |
  TokenTypeTriple AlexPosn             |
  TokenTypeSub AlexPosn                |
  TokenTypePred AlexPosn               |
  TokenTypeObj AlexPosn                |
  TokenTypeURI AlexPosn                |
  TokenTrue AlexPosn String            |
  TokenFalse AlexPosn String           |
  TokenIntLiteral AlexPosn Int         |
  TokenPositiveIntLiteral AlexPosn Int |
  TokenStringLiteral AlexPosn String   |
  TokenBase AlexPosn                   |
  TokenPrefix AlexPosn                 |
  TokenQuote AlexPosn                  |
  TokenAsterisks AlexPosn              |
  TokenComma AlexPosn                  |
  TokenSemiColon AlexPosn              |
  TokenFullStop AlexPosn               |
  TokenGreaterThan AlexPosn            |
  TokenLessThan AlexPosn               |
  TokenEqual AlexPosn                  |
  TokenNotEqual AlexPosn               |
  TokenGreaterOrEqual AlexPosn         |
  TokenGreaterOrEqual AlexPosn                                       
  deriving Show 

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".

tokenPosn :: RDFToken -> String

-------------------------------
--            TYPES          --
-------------------------------

tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeString  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeBase  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypePrefix (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeTriple  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeSub  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypePred  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeObj  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeURI  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


-------------------------------
--          LITERALS         --
-------------------------------
tokenPosn (TokenTrue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPositiveIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStringLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBase (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrefix (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

-------------------------------
--           SYMBOLS         --
-------------------------------
tokenPosn (TokenQuote (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAsterisks (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSemiColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


--Operators


-----------------------------------------
--           COMPARE OPERATORS         --
-----------------------------------------

tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNotEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)




--tokenPosn (TokenHTTP  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenName (AlexPn a l c) s) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenColon (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenBackSlash (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
--tokenPosn (TokenTag (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
}
