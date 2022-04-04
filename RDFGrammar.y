{ 
module RDFGrammar where 
import RDFTokens 
}

%name parseCalc 
%tokentype { RDFToken } 
%error { parseError }
%token   
    true             { TokenTrue _ $$ } 
    false            { TokenFalse _ $$ } 
    "@base"          { TokenBase _ }
    "@prefix"        { TokenPrefix _ }
    $name+           { TokenName _ $$ }       
    ':'              { TokenColon _ } 
    '/'              { TokenBackSlash _ }
    '#'              { TokenTag _ }
    '"'              { TokenQuote _ }
    ';'              { TokenSemiColon _ }
    ','              { TokenComma _ }
    '.'              { TokenFullStop _ }
    '<'              { TokenLessThan _ }
    '>'              { TokenGreaterThan _ }
    $sign? $digit+   { TokenIntLiteral _ $$ }  
    '"' $ascii+ '"'  { TokenStrLiteral _ $$ }

%% 

Expr : "@base" URI '.'                    { Base $2 }
     | "@base" URI '.' PAndT              { BAndO $2 $4 }
     | PAndT                              { $1 }
     | PAndT "@base" URI '.'              { OAndB $1 $3 }
     | PAndT "@base" URI '.' PAndT        { OAndBAndO $1 $3 $5 }

PAndT : PAndT PAndT 
      | prefix Triple 
      | Triple

prefix : prefix prefix  
       | @prefix name':' URI '.'

Triple : '<' Sub '>' Repeated '.'

Repeated : '<' Pred '>' ObjList ';' Repeated
         | '<' Pred '>' ObjList 

ObjList : '<' Obj '>' ',' ObjList 
        | '<' Obj '>'

Sub  : URI
Pred : URI
Obj  : URI 
     | Literal

Literal : $sign? $digit+ 
        | '"' $ascii+ '"' 
        | true 
        | false

URI : '<' link '>'

Tag : '#' $name+    

Domains : $name+ '.' Domains
        | $name+

SubDomains : $name+ '/' SubDomains
           | $name+

link : "http://" Domains '/'
     | "http://" Domains '/' SubDomains
     | "http://" Domains '/' Tag 
     | "http://" Domains '/' SubDomains '/' Tag     

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