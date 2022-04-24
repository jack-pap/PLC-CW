{ 
module RDFGrammar where 
import RDFToken
import System.IO
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
  Triple              { TokenTypeTriple _ }
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
  TRIPLE              { TokenTriple _ }
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
%nonassoc TRIPLE SUB PRED OBJ filename true false int str 
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

Expr : SELECT Selectors FROM FileList WHERE Comparators { SelectWithCond $2 $4 $6 }
     | SELECT Selectors FROM FileList            { Select $2 $4 }
     | '(' Expr ')'                              { $2 }
     
Selectors : '*'                                  { Asterisks }
          | filename '.' SUB                     { CallFromFileSub $1 }
          | filename '.' PRED                    { CallFromFilePred $1 }
          | filename '.' OBJ                     { CallFromFileObj $1 }
          | Selectors ',' Selectors              { $1 $3 }
                      

FileList : filename              { Name $1 }
         | filename ',' FileList { Names $1 $3 }


Comparators : Expr AND Expr                        { And $1 $3 }
            | Expr OR Expr                         { Or $1 $3 }
            | Expr TYPE Type                       { TypeFinder $1 $3 }
            | IF '(' Expr ',' Expr ',' Expr ')'    { If $3 $5 $7 }
            | REPLACE '(' Expr "->" Expr ')'       { Replace $3 $5 }
            | TRIPLE                               { Triple }
            | SUB                                  { Subs }
            | PRED                                 { Preds }
            | OBJ                                  { Objs }
            | true                                 { TmTrue }
            | false                                { TmFalse }
            | int                                  { Integer $1 }
            | str                                  { Str $1 }
            | filename '.' SUB                     { CallFromFileSub $1 }
            | filename '.' PRED                    { CallFromFilePred $1 }
            | filename '.' OBJ                     { CallFromFileObj $1 }
            | Comparators '>' Comparators          { Greater $1 $3 }
            | Comparators '<' Comparators          { Less $1 $3 }
            | Comparators '=' Comparators          { Equal $1 $3 }
            | Comparators "!=" Comparators         { NotEqual $1 $3 }
            | Comparators "<=" Comparators         { LessThanEqual $1 $3 }
            | Comparators ">=" Comparators                       { GreaterThanEqual $1 $3 }
            | Comparators ',' Comparators                        { Comma $1 $3 }
            | Comparators '+' Comparators                        { Plus $1 $3 }
            | Comparators '-' Comparators                        { Minus $1 $3 }
            | Comparators '/' Comparators                        { Div $1 $3 }
            | Comparators 'x' Comparators                        { Mult $1 $3 }
            | '(' Comparators ')'                  { $2 }

Type : Bool                      { TyBool }
     | Int                       { TyInt }
     | String                    { TyString }
     | Triple                    { TyTriple }
     | Sub                       { TySub }
     | Pred                      { TyPred }
     | Obj                       { TyObj }
     | Filename                  { TyFilename }


{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Type = TyBool | TyInt | TyString | TyTriple | TySub | TyPred
            | TyObj | TyFilename
            deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = SelectWithCond Expr FileList Expr | Select Expr FileList | And Expr Expr | Or Expr Expr 
            | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
            | Triple | Subs | Preds | Objs
            | TmTrue | TmFalse | Integer Int | Str String 
            | Asterisks | CallFromFileSub String | CallFromFilePred String
            | CallFromFileObj String | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
            | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
            deriving (Show, Eq)

data FileList = Name String | Names String FileList
              deriving (Show, Eq)

data Comparators = 

}