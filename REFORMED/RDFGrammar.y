{ 
module RDFGrammar where 
import RDFToken
}

%name parseCalc 
%tokentype { RDFToken } 
%error { parseError }
%token   

  -------------------------------
  --            TYPES          --
  ------------------------------- 

  Bool                { TokenTypeBool _ }
  Int                 { TokenTypeInt _ }
  String              { TokenTypeString _ }
  Base                { TokenTypeBase _ }
  Prefix              { TokenTypePrefix _ }
  Triple              { TokenTypeTriple _ }
  Sub                 { TokenTypeSub _ }
  Pred                { TokenTypePred _ }
  Obj                 { TokenTypeObj _ }
  URI                 { TokenTypeURI _ }
  Filename            { TokenTypeFile _ }


  SELECT              { TokenSelect _ }
  FROM                { TokenFrom _ }
  WHERE               { TokenWhere _ }
  AND                 { TokenAnd _ }
  OR                  { TokenOr _ }
  TYPE                { TokenType _ }

  -------------------------------
  --           I/O             --
  -------------------------------

  filename            { TokenFilename _ $$ }

  -------------------------------
  --          LITERALS         --
  -------------------------------

  true                { TokenTrue _ } 
  false               { TokenFalse _ } 
  int                 { TokenIntLiteral _ $$ } 
  str                 { TokenStringLiteral _ $$ }
  "@base"             { TokenBase _ }
  "@prefix"           { TokenPrefix _ }

  -------------------------------
  --           SYMBOLS         --
  -------------------------------
  
  '*'                  { TokenAsterisks _ }
  ','                  { TokenComma _ }
  '.'                  { TokenFullStop _ }
  '('                  { TokenLeftBracket _ }
  ')'                  { TokenRightBracket _ }

  -----------------------------------------
  --           COMPARE OPERATORS         --
  -----------------------------------------
  
  '>'                  { TokenGreaterThan _ }
  '<'                  { TokenLessThan _ }
  '='                  { TokenEqual _ }      
  "!="                 { TokenNotEqual _ }
  ">="                 { TokenGreaterOrEqual _ }
  "<="                 { TokenLessOrEqual _ }


-- ================================================================================ --
-- ============================== GRAMMAR DEFINITION ============================== --
-- ================================================================================ --

%left SELECT FROM WHERE
%left AND OR TYPE
%nonassoc filename true false int str 
%left "@base" "@prefix"
%nonassoc '*'
%left '.'
%nonassoc '<'
%nonassoc '>'
%nonassoc '='
%nonassoc "!="
%nonassoc ">="
%nonassoc "<="
%left ','
%nonassoc '(' ')'



%% 

Expr : SELECT Expr         { Select $2 }
     | FROM Expr           { From $2 }
     | WHERE Expr          { Where $2 }
     | AND Expr            { And $2 }
     | OR Expr             { Or $2 }
     | Expr TYPE Type      { TypeFinder $1 $3 }
     | filename            { FileName $1 }
     | true                { TmTrue }
     | false               { TmFalse }
     | int                 { Integer $1 }
     | str                 { Str $1 }
     | "@base" Expr        { Base $2 }
     | "@prefix" Expr      { Prefix $2 }
     | '*'                 { Asterisks}
     | filename '.' Type   { CallFromFile $1 $3 }
     | Expr '>' Expr       { Greater $1 $3 }
     | Expr '<' Expr       { Less $1 $3 }
     | Expr '=' Expr       { Equal $1 $3 }
     | Expr "!=" Expr      { NotEqual $1 $3 }
     | Expr "<=" Expr      { LessThanEqual $1 $3 }
     | Expr ">=" Expr      { GreaterThanEqual $1 $3 }
     | Expr ',' Expr       { Comma $1 $3 }
     | '(' Expr ')'        { $2 }                 
             

Type : Bool       { TyBool }
     | Int        { TyInt }
     | String     { TyString }
     | Base       { TyBase }
     | Prefix     { TyPrefix }
     | Triple     { TyTriple } 
     | Sub        { TySub }
     | Pred       { TyPred }
     | Obj        { TyObj }
     | URI        { TyURI }
     | Filename   { TyFilename }


{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Type = TyBool | TyInt | TyString | TyBase | TyPrefix | TyTriple | TySub | TyPred
            | TyObj | TyURI | TyFilename
        deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = Select Expr | From Expr | Where Expr | And Expr | Or Expr | TypeFinder Expr Type
            | FileName Expr | TmTrue | TmFalse | Integer Int | Str String | Base Expr 
            | Prefix Expr | Asterisks | CallFromFile Expr Type | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr
            | Lambda String Type Expr | Cl String Type Expr Environment
}