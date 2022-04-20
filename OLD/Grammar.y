{ 
module RDFGrammar where 
import RDFToken
}

%name parseCalc 
%tokentype { RDFToken } 
%error { parseError }
%token   
    true             { TokenTrue _ $$ } 
    false            { TokenFalse _ $$ } 
    "@base"          { TokenBase _ }
    "@prefix"        { TokenPrefix _ }
    "http://"        { TokenHTTP _ }
    name             { TokenName _ $$ }       
    ':'              { TokenColon _ } 
    '/'              { TokenBackSlash _ }
    '#'              { TokenTag _ }
    '"'              { TokenQuote _ }
    ';'              { TokenSemiColon _ }
    ','              { TokenComma _ }
    '.'              { TokenFullStop _ }
    '<'              { TokenLessThan _ }
    '>'              { TokenGreaterThan _ }
    int              { TokenIntLiteral _ $$ }  
    special          { TokenStrLiteral _ $$ }


%nonassoc '<'
%nonassoc true false

%% 

Expr : "@base" URI '.'                    { Base $2 }
     | "@prefix" name':' URI '.'
     | Sub Pred ObjList '.'
     | Pred ObjList
     | Obj ','
     | Expr Expr


Prefix : X Prefix                    { Prefixx $1 $2 }
       | X                           { X $1 }

X : "@prefix" name':' URI '.'       { Prefixxx $2 $4 } 

Triple : Sub Repeated '.'         { Tripled $1 $2 }

Repeated : Pred ObjList ';' Repeated { ReRepeated $1 $2 $4 }
         | Pred ObjList              { Repeatedd $1 $2 }

ObjList : Obj ',' ObjList { ObjectListss $1 $3 }
        | Obj             { ObjectLists $1 }

Sub  : URI                      { SubjectURI $1 }
     | Shorthand                { SubjectSH $1 }

Pred : URI                      { PredicateURI $1 }
     | Shorthand                { PredicateSH $1 }

Obj  : URI                      { ObjectURI $1 }
     | Shorthand                { ObjectSH $1 }
     | Literal                  { ObjectLit $1 }

Literal : int                   { LiteralInt $1 }
        | '"' J '"'             { LiteralString $2 }
        | true                  { LiteralTrue }
        | false                 { LiteralFalse }

J : A J                        { AJ $1 $2 }
  | A                          { A $1 }

A : special    { Special $1 }
  | name       { Strings $1 }
  | ':'        { Col $1 }
  | '/'        { Slash $1 }
  | '#'        { Hash $1 }
  -- | '"'        { Double $1 }
  | ';'        { Semi $1 }
  | ','        { Comma $1 }
  | '.'        { Dot $1 }
  | '<'        { Less $1 }
  | '>'        { More $1 }

URI : '<' Link '>'              { URIs $2 }

Shorthand : '<' name '>'      { ShortURIB $2 }
          | name ':' name     { ShortURIP $1 $3 }

Link : "http://" Domain '/'                     { LinkD $2 }
     | "http://" Domain '/' SubDomain           { LinkDS $2 $4 } 

Domain : name '.' Domain      { Domainss $1 $3 } 
       | name                 { Domains $1 }

SubDomain : name '/' SubDomain  { SubDomainss $1 $3 }
          | '#' name            { Ns $2 }
          | name                { Nss $1 }

--N : name { S $1 }  

{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Expr = Base URI 
          | BandO URI PAndT 
          | PAndT PAndT
          | OandB PAndT URI 
          | OandBandO PAndT URI PAndT 
          deriving Show
          

data PAndT = PAndTs Y PAndT
           | Y Y
           deriving Show


data Y = PandTT Prefix Triple
       | Triplee Triple
       deriving Show

data Prefix = Prefixx X Prefix
            | X X
            deriving Show

data X = Prefixxx String URI 
       deriving Show

data Triple = Tripled Sub Repeated
            deriving Show

data Repeated = ReRepeated Pred ObjList Repeated
              | Repeatedd Pred ObjList
              deriving Show

data ObjList = ObjectListss Obj ObjList
             | ObjectLists Obj
             deriving Show

data Sub = SubjectURI URI
         | SubjectSH Shorthand
         deriving Show

data Pred = PredicateURI URI
          | PredicateSH Shorthand
          deriving Show

data Obj = ObjectURI URI
         | ObjectSH Shorthand
         | ObjectLit Literal
         deriving Show
         
data Literal = LiteralInt Int
             | LiteralString J
             | LiteralTrue
             | LiteralFalse
             deriving Show

data J = AJ A J                       
       | A A                         
       deriving Show

data A = Special String
       | Strings String
       | Col RDFToken       
       | Slash RDFToken
       | Hash RDFToken
       | Semi RDFToken
       | Double RDFToken
       -- | Semi TokenSemiColon
       | Comma RDFToken
       | Dot RDFToken
       | Less RDFToken
       | More RDFToken
       deriving Show

data URI = URIs Link
        deriving Show 

data Shorthand = ShortURIB String
                | ShortURIP String String
                deriving Show

data Link = LinkD Domain
          | LinkDS Domain Subdomain
          deriving Show
          
--data Tag = Tags String
--           deriving Show

data Domain = Domainss String Domain
            | Domains String
            deriving Show 
            
    
data Subdomain = SubDomainss String Subdomain
               | Ns String
               | Nss String
               deriving Show

--data N = S String
--       deriving Show
}