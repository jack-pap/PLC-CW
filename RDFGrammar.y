{ 
module RDFGrammar where 
import RDFTokens 
}

%name parseCalc 
%tokentype { RDFToken } 
%error { parseError }
%token 
    $sign? $digit+   { TokenIntLiteral _ $$ } 
    $alpha           { TokenStrLiteral _ $$ } 
    "@base"          { TokenBase _ }
    "@prefix"        { TokenPrefix _ }
    '.'              { TokenFullStop _ }
    '<'              { TokenLessThan _ }
    '>'              { TokenGreaterThan _ }

%% 

Expr : "@base" '<' link '>' '.'           { Base $3 }
     | "@base" '<' link '>' '.' options   { BAndO $3 $6 }
     | options                            { $1 }
     | options "@base" '<' link '>' '.'   { OAndB $1 $4 }
     | options base "." options           { OandBAndO $1 $2 $4 }

options : options options 
        | Option2

Option2 : Option2 Option2 
        | prefix Triple 
        | Triple

base : @base URI

prefix : prefix prefix 
       | prefix Option2 
       | @prefix name : URI \.

Triple : '<' Sub '>' '<' Pred '>' '<' Obj '>' '.'
       | '<' Sub '>' Repeated '<' Pred '>' '<' Obj '>' '.'

Repeated : '<' Pred '>' '<' Obj '>' ';'
         | Repeated '<' Pred '>' '<' Obj '>' ';'

Sub  : URI
Pred : URI
OBJ  : URI 
     | Literal

Literal : $sign? $digit+ 
        | String 
        | true 
        | false

URI : "<"link">" 
    | "<"link"#"tag">"

tag : String

link : "http://"String"/" 




Exp : let var '=' Exp in Exp { Let $2 $4 $6 } 
    | Exp '+' Exp            { Plus $1 $3 } 
    | Exp '-' Exp            { Minus $1 $3 } 
    | Exp '*' Exp            { Times $1 $3 } 
    | Exp '/' Exp            { Div $1 $3 } 
    | Exp '^' Exp            { Expo $1 $3}
    | '(' Exp ')'            { $2 } 
    | '-' Exp %prec NEG      { Negate $2 } 
    | int                    { Int $1 } 
    | var                    { Var $1 } 
    
{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Exp = Let String Exp Exp 
         | Plus Exp Exp 
         | Minus Exp Exp 
         | Times Exp Exp 
         | Div Exp Exp 
         | Expo Exp Exp
         | Negate Exp
         | Int Int 
         | Var String 
         deriving Show 
} 