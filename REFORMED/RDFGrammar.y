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

Expr : SELECT Expr Expr    { Select $2 $3 }
     | FROM Expr           { From $2 }
     | Expr WHERE Expr     { Where $1 $3}
     | Expr AND Expr       { And $1 $3 }
     | Expr OR Expr        { Or $1 $3 }
     | Expr TYPE Type      { TypeFinder $1 $3 }
     | filename            { FileName $1 }
     | true                { TmTrue }
     | false               { TmFalse }
     | int                 { Integer $1 }
     | str                 { Str $1 }
     | "@base"             { Base }
     | "@prefix"           { Prefix }
     | '*'                 { Asterisks }
     | filename '.' Type   { CallFromFile $1 $3 }
     | Expr '>' Expr       { Greater $1 $3 }
     | Expr '<' Expr       { Less $1 $3 }
     | Expr '=' Expr       { Equal $1 $3 }
     | Expr "!=" Expr      { NotEqual $1 $3 }
     | Expr "<=" Expr      { LessThanEqual $1 $3 }
     | Expr ">=" Expr      { GreaterThanEqual $1 $3 }
     | Expr ',' Expr       { Comma $1 $3 }
     | '(' Expr ')'        { $2 }                 
             

Type : Bool                      { TyBool }
     | Int                       { TyInt }
     | String                    { TyString }
     | Base                      { TyBase }
     | Prefix                    { TyPrefix }
     | Sub                       { TySub }
     | Pred                      { TyPred }
     | Obj                       { TyObj }
     | Triple Type Type Type     { TyTriple $2 $3 $4 } 
     | URI                       { TyURI }
     | Filename                  { TyFilename }


{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Type = TyBool | TyInt | TyString | TyBase | TyPrefix | TySub | TyPred
            | TyObj | TyTriple Type Type Type | TyURI | TyFilename
            deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = Select Expr Expr | From Expr | Where Expr Expr | And Expr Expr | Or Expr Expr | TypeFinder Expr Type
            | FileName String | TmTrue | TmFalse | Integer Int | Str String | Base 
            | Prefix | Asterisks | CallFromFile String Type | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr
            | Lambda String Type Expr | Cl String Type Expr Environment
            deriving (Show, Eq)
}