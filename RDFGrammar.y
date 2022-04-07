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
    str              { TokenStrLiteral _ $$ }

%% 

Expr : "@base" URI '.'                    { Base $2 }
     | "@base" URI '.' PAndT              { BandO $2 $4 }
     | PAndT                              { $1 }
     | PAndT "@base" URI '.'              { OandB $1 $3 }
     | PAndT "@base" URI '.' PAndT        { OandBandO $1 $3 $5 }

PAndT : PAndT PAndT                       { $1 $2 }
      | Prefix Triple                     { PandT $1 $2 }
      | Triple                            { Triplee $1 }

Prefix : Prefix Prefix                    { $1 $2 }
       | "@prefix" name':' URI '.'        { Prefixx $2 $4 }

Triple : '<' Sub '>' Repeated '.'         { Tripled $2 $4 }

Repeated : '<' Pred '>' ObjList ';' Repeated { ReRepeated $2 $4 $6 }
         | '<' Pred '>' ObjList              { Repeatedd $2 $4 }

ObjList : '<' Obj '>' ',' ObjList { ObjectListss $2 $5 }
        | '<' Obj '>'             { ObjectLists $2 }

Sub  : URI                      { SubjectURI $1 }
     | Shorthand                { SubjectSH $1 }

Pred : URI                      { PredicateURI $1 }
     | Shorthand                { PredicateSH $1 }

Obj  : URI                      { ObjectURI $1 }
     | Shorthand                { ObjectSH $1 }
     | Literal                  { ObjectLit $1 }

Literal : int                   { LiteralInt $1 }
        | str                   { LiteralString $1 }
        | true                  { LiteralTrue }
        | false                 { LiteralFalse }

URI : '<' Link '>'              { URI $2 }

Shorthand : '<' name '>'      { ShortURIB $2 }
          | name':' name    { ShortURIP $1 $3 }

Tag : '#' name                { Tags $2 }

Domain : name '.' Domain      { Domainss $1 $3 } 
       | name                 { Domains $1 }

SubDomain : name '/' SubDomain  { SubDomainss $1 $3 }
          | name                { SubDomains $1 }

Link : "http://" Domain '/'                     { LinkD $2 }
     | "http://" Domain '/' SubDomain           { LinkDS $2 $4 } 
     | "http://" Domain '/' Tag                 { LinkDT $2 $4 }
     | "http://" Domain '/' SubDomain '/' Tag   { LinkDST $2 $4 $6 }    

{ 
parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Expr = Base URI 
          | BandO URI PAndT 
          | OandB PAndT URI 
          | OandBandO PAndT URI PAndT 
          deriving Show
          

data PAndT = PandT Prefix Triple
           | Triplee Triple 
           deriving Show

data Prefix = Prefixx String URI 

data Triple = Tripled Sub Repeated

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
             | LiteralString String
             | LiteralTrue
             | LiteralFalse
             deriving Show

data URI = URIs Link
        deriving Show 

data Shorthand = ShortURIB String
                | ShortURIP String String
                deriving Show

data Tag = Tags String
           deriving Show

data Domain = Domainss String Domain
            | Domains String
            deriving Show 
            
    
data Subdomain = Subdomainss String Subdomain
               | Subdomains String
               deriving Show

data Link = LinkD Domain
          | LinkDS Domain Subdomain
          | LinkDT Domain Subdomain
          | LinkDST Domain Subdomain Tag
          deriving Show
}