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

  Bool                { \p s -> TokenTypeBool p }
  Int                 { \p s -> TokenTypeInt p }
  String              { \p s -> TokenTypeString p }
  Sub                 { \p s -> TokenTypeSub p }
  Pred                { \p s -> TokenTypePred p }
  Obj                 { \p s -> TokenTypeObj p }
  Filename            { \p s -> TokenTypeFile p }

  -------------------------------
  --          OPERATORS        --
  -------------------------------

  SELECT              { \p s -> TokenSelect p }
  FROM                { \p s -> TokenFrom p }
  WHERE               { \p s -> TokenWhere p }
  AND                 { \p s -> TokenAnd p }
  OR                  { \p s -> TokenOr p }
  TYPE                { \p s -> TokenType p }
  IF                  { \p s -> TokenIf p }
  REPLACE             { \p s -> TokenReplace p }
  SUB                 { \p s -> TokenSubs p }
  PRED                { \p s -> TokenPreds p }
  OBJ                 { \p s -> TokenObjs p }


  -------------------------------
  --           I/O             --
  -------------------------------

  \" $ascii+ \. "ttl" \"    { \p s -> TokenFilename p s }
  
  -------------------------------
  --          LITERALS         --
  -------------------------------

  true                { \p s -> TokenTrue p } 
  false               { \p s -> TokenFalse p } 
  $sign? $digit+      { \p s -> TokenIntLiteral p (read s) } 
  \" $ascii+ \"       { \p s -> TokenStringLiteral p s}

  -------------------------------
  --           SYMBOLS         --
  -------------------------------
  
  \*                  { \p s -> TokenAsterisks p }
  \,                  { \p s -> TokenComma p }
  \.                  { \p s -> TokenFullStop p }
  \(                  { \p s -> TokenLeftBracket p }
  \)                  { \p s -> TokenRightBracket p }
  "->"                {\p s -> TokenArrow p }

  -----------------------------------------
  --           COMPARE OPERATORS         --
  -----------------------------------------
  
  \>                  { \p s -> TokenGreaterThan p }
  \<                  { \p s -> TokenLessThan p }
  \=                  { \p s -> TokenEqual p }      
  "!="                { \p s -> TokenNotEqual p }
  ">="                { \p s -> TokenGreaterOrEqual p }
  "<="                { \p s -> TokenLessOrEqual p }

  -----------------------------------------
  --           ARITHMETIC OPERATORS      --
  -----------------------------------------

  \+                  { \p s -> TokenPlusSign p }
  \-                  { \p s -> TokenMinusSign p }
  \/                  { \p s -> TokenDivSign p }
  \x                  { \p s -> TokenMultSign p }

{
  
-- WHITESPACE MAY NOT BE NEEDED ASK TO MAKE SURE
-- Each action has type :: AlexPosn -> String -> RDFToken

-- The token type:
data RDFToken = 
  TokenTypeBool AlexPosn               |
  TokenTypeInt AlexPosn                |
  TokenTypeString AlexPosn             |
  TokenTypeSub AlexPosn                |
  TokenTypePred AlexPosn               |
  TokenTypeObj AlexPosn                |
  TokenTypeURI AlexPosn                |
  TokenTypeFile AlexPosn               |
  TokenSelect AlexPosn                 |
  TokenFrom AlexPosn                   |
  TokenWhere AlexPosn                  |
  TokenAnd AlexPosn                    |
  TokenOr AlexPosn                     |
  TokenType AlexPosn                   |
  TokenIf AlexPosn                     |
  TokenReplace AlexPosn                |
  TokenSubs AlexPosn                   |
  TokenPreds AlexPosn                  |
  TokenObjs AlexPosn                   |
  TokenFilename AlexPosn String        |
  TokenTrue AlexPosn                   |
  TokenFalse AlexPosn                  |
  TokenIntLiteral AlexPosn Int         |
  TokenStringLiteral AlexPosn String   |
  TokenAsterisks AlexPosn              |
  TokenComma AlexPosn                  |
  TokenFullStop AlexPosn               |
  TokenLeftBracket AlexPosn            |
  TokenRightBracket AlexPosn           |
  TokenArrow AlexPosn                  |
  TokenGreaterThan AlexPosn            |
  TokenLessThan AlexPosn               |
  TokenEqual AlexPosn                  |
  TokenNotEqual AlexPosn               |
  TokenGreaterOrEqual AlexPosn         |
  TokenLessOrEqual AlexPosn            |
  TokenPlusSign AlexPosn               |
  TokenMinusSign AlexPosn              |
  TokenDivSign AlexPosn                |   
  TokenMultSign AlexPosn
  deriving Show 

-- Write a function tokenPosn in your Alex file that extracts the source code position (line:column) from a given token as a string e.g. "5:43".

tokenPosn :: RDFToken -> String

-------------------------------
--            TYPES          --
------------------------------- 

tokenPosn (TokenTypeBool (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeString  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeSub  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypePred  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeObj  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeURI  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeFile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

-------------------------------
--          OPERATORS        --
-------------------------------

tokenPosn (TokenSelect (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFrom  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhere  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd  (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)   
tokenPosn (TokenType (AlexPn a l c)) = show(l) ++ ":" ++ show(c) 
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)   
tokenPosn (TokenReplace (AlexPn a l c)) = show(l) ++ ":" ++ show(c) 
tokenPosn (TokenSubs (AlexPn a l c)) = show(l) ++ ":" ++ show(c) 
tokenPosn (TokenPreds (AlexPn a l c)) = show(l) ++ ":" ++ show(c) 
tokenPosn (TokenObjs (AlexPn a l c)) = show(l) ++ ":" ++ show(c) 

-------------------------------
--          I/O         --
-------------------------------

tokenPosn (TokenFilename (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)

--------------------------------
--           LITERALS         --
--------------------------------
tokenPosn (TokenTrue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIntLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStringLiteral (AlexPn a l c) i) = show(l) ++ ":" ++ show(c)

-------------------------------
--          SYMBOLS          --
-------------------------------

tokenPosn (TokenAsterisks (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenComma (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFullStop (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightBracket (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenArrow (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

-----------------------------------------
--           COMPARE OPERATORS         --
-----------------------------------------

tokenPosn (TokenGreaterThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessThan (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNotEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLessOrEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

-----------------------------------------
--           ARITHMETIC OPERATORS      --
-----------------------------------------

tokenPosn (TokenPlusSign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinusSign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDivSign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMultSign (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

}
