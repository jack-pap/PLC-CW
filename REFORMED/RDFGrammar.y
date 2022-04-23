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
  Sub                 { TokenTypeSub _ }
  Pred                { TokenTypePred _ }
  Obj                 { TokenTypeObj _ }
  Filename            { TokenTypeFile _ }

  -------------------------------
  --          OPERATORS        --
  -------------------------------

  SELECT              { TokenSelect _ }
  FROM                { TokenFrom _ }
  WHERE               { TokenWhere _ }
  AND                 { TokenAnd _ }
  OR                  { TokenOr _ }
  TYPE                { TokenType _ }
  IF                  { TokenIf _ }
  REPLACE             { TokenReplace _ }
  SUB                 { TokenSubs _ }
  PRED                { TokenPreds _ }
  OBJ                 { TokenObjs _ }

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

  -------------------------------
  --           SYMBOLS         --
  -------------------------------
  
  '*'                  { TokenAsterisks _ }
  ','                  { TokenComma _ }
  '.'                  { TokenFullStop _ }
  '('                  { TokenLeftBracket _ }
  ')'                  { TokenRightBracket _ }
  "->"                 { TokenArrow _ }

  -----------------------------------------
  --           COMPARE OPERATORS         --
  -----------------------------------------
  
  '>'                  { TokenGreaterThan _ }
  '<'                  { TokenLessThan _ }
  '='                  { TokenEqual _ }      
  "!="                 { TokenNotEqual _ }
  ">="                 { TokenGreaterOrEqual _ }
  "<="                 { TokenLessOrEqual _ }

  -----------------------------------------
  --           ARITHMETIC OPERATORS      --
  -----------------------------------------

  '+'                  { TokenPlusSign _ }
  '-'                  { TokenMinusSign _ }
  '/'                  { TokenDivSign _ }
  'x'                  { TokenMultSign _ }


-- ================================================================================ --
-- ============================== GRAMMAR DEFINITION ============================== --
-- ================================================================================ --

%left SELECT FROM WHERE
%left AND OR TYPE
%nonassoc IF
%left REPLACE
%left "->"
%nonassoc SUB PRED OBJ filename true false int str 
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
%left '+' '-' '/' 'x'



%% 

Expr : SELECT Expr FROM Expr WHERE Expr    { SelectWithCond $2 $4 $6 }
     | SELECT Expr FROM Expr               { Select $2 $4 }
     | Expr AND Expr                       { And $1 $3 }
     | Expr OR Expr                        { Or $1 $3 }
     | Expr TYPE Type                      { TypeFinder $1 $3 }
     | IF '(' Expr ',' Expr ',' Expr ')'   { If $3 $5 $7 }
     | REPLACE '(' Expr "->" Expr ')'      { Replace $3 $5 }
     | SUB                                 { Subs }
     | PRED                                { Preds }
     | OBJ                                 { Objs }
     | filename                            { FileName $1 }
     | true                                { TmTrue }
     | false                               { TmFalse }
     | int                                 { Integer $1 }
     | str                                 { Str $1 }
     | '*'                                 { Asterisks }
     | filename '.' SUB                    { CallFromFileSub $1 }
     | filename '.' PRED                   { CallFromFilePred $1 }
     | filename '.' OBJ                    { CallFromFileObj $1 }
     | Expr '>' Expr                       { Greater $1 $3 }
     | Expr '<' Expr                       { Less $1 $3 }
     | Expr '=' Expr                       { Equal $1 $3 }
     | Expr "!=" Expr                      { NotEqual $1 $3 }
     | Expr "<=" Expr                      { LessThanEqual $1 $3 }
     | Expr ">=" Expr                      { GreaterThanEqual $1 $3 }
     | Expr ',' Expr                       { Comma $1 $3 }
     | '(' Expr ')'                        { $2 } 
     | Expr '+' Expr                       { Plus $1 $3 }
     | Expr '-' Expr                       { Minus $1 $3 }
     | Expr '/' Expr                       { Div $1 $3 }
     | Expr 'x' Expr                       { Mult $1 $3 }                
             

Type : Bool                      { TyBool }
     | Int                       { TyInt }
     | String                    { TyString }
     | Sub                       { TySub }
     | Pred                      { TyPred }
     | Obj                       { TyObj }
     | Filename                  { TyFilename }


{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Type = TyBool | TyInt | TyString | TySub | TyPred
            | TyObj | TyFilename
            deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = SelectWithCond Expr Expr Expr | Select Expr Expr | And Expr Expr | Or Expr Expr 
            | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
            | Subs | Preds | Objs
            | FileName String | TmTrue | TmFalse | Integer Int | Str String | Base 
            | Prefix | Asterisks | CallFromFileSub String | CallFromFilePred String
            | CallFromFileObj String | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
            | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
            | Lambda String Type Expr | Cl String Type Expr Environment
            deriving (Show, Eq)
}