
module RDFType where 
import RDFGrammar

-- Data structures as defined in RDFGrammer:

-- data Type = TyBool | TyInt | TyString | TyTriple | TySub | TyPred
--             | TyObj | TyFilename
--             deriving (Show, Eq)
        
-- type Environment = [ (String,Expr) ]

-- data Expr = SelectWithCond Expr FileList Expr | Select Expr FileList 
--             deriving (Show, Eq)

-- data FileList = Name String | Names String FileList
--               deriving (Show, Eq)

-- data Comparators = And Expr Expr | Or Expr Expr 
--             | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
--             | Triple | Subs | Preds | Objs
--             | TmTrue | TmFalse | Integer Int | Str String 
--             | Greater Expr Expr
--             | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
--             | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
--             | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
--             deriving (Show, Eq)

-- data Selectors = Asterisks | CallFromFileSub String | CallFromFilePred String
--                | CallFromFileObj String
--                deriving (Show, Eq)



typeOfE :: Expr -> Type

typeOfE (SelectWithCond e1 f1 p1 ) | (typeOfE p1 == TyBool) = TyString 
typeOfE (Select e1 f1) = TyString 
typeOfE _ = error "Type Error"

typeOfF :: FileList -> Type 

typeOfF (Name s1 ) = TyFilename 
typeOfF (Names s1 fl1 ) = TyFilename 
typeOfF _ = error "Type Error"

typeOfS :: Selectors -> Type 

typeOfS Asterisks = TyString
typeOfS (CallFromFileSub s1) = TyString
typeOfS (CallFromFilePred s1) = TyString
typeOfS (CallFromFileObj s1) = TyString 
typeOfS _ = error "Type Error"

typeOfC :: Comparators -> Type 

typeOfC (And e1 e2 ) | (typeOfE  e1, typeOfE  e2) == (TyBool,TyBool)  = TyBool
typeOfC (Or e1 e2) | (typeOfE  e1, typeOfE  e2) == (TyBool,TyBool)  = TyBool
typeOfC (TypeFinder e1 t1 ) = t1 

typeOfC Subs = TySub 
typeOfC Preds = TyPred 
typeOfC Objs = TyObj 

typeOfC TmTrue = TyBool 
typeOfC TmFalse = TyBool 
typeOfC (Integer e1)  = TyInt
typeOfC (Str e1)  = TyString

typeOfC (Greater e1 e2 ) | (typeOfE e1, typeOfE e2) == (TyInt,TyInt) = TyBool
                        | (typeOfE e1, typeOfE e2) == (TyString ,TyInt) = TyBool
                        | (typeOfE e1, typeOfE e2) == (TyInt,TyString) = TyBool                            
typeOfC (Less e1 e2 ) | (typeOfE e1, typeOfE e2) == (TyInt,TyInt) = TyBool
                     | (typeOfE e1, typeOfE e2) == (TyString ,TyInt) = TyBool
                     | (typeOfE e1, typeOfE e2) == (TyInt,TyString) = TyBool

typeOfC (Equal e1 e2 ) = TyBool
typeOfC (NotEqual e1 e2 ) = TyBool
typeOfC (LessThanEqual e1 e2 ) | (typeOfE e1, typeOfE e2) == (TyInt,TyInt) = TyBool
                              | (typeOfE e1, typeOfE e2) == (TyString,TyInt) = TyBool
                              | (typeOfE e1, typeOfE e2) == (TyInt,TyString) = TyBool  

typeOfC (GreaterThanEqual e1 e2 ) | (typeOfE e1, typeOfE e2) == (TyInt,TyInt) = TyBool
                                 | (typeOfE e1, typeOfE e2) == (TyString,TyInt) = TyBool
                                 | (typeOfE e1, typeOfE e2) == (TyInt,TyString) = TyBool   
typeOfC (Comma e1 e2 ) = TyString 

typeOfC (Plus e1 e2 ) = TyInt
typeOfC (Minus e1 e2 ) = TyInt
typeOfC (Div e1 e2 )  = TyInt
typeOfC (Mult e1 e2 ) = TyInt

typeOfC _ = error "Type Error"


-- Function for printing the results of the TypeCheck
unparseType :: Type -> String
unparseType TyBool = "Bool"
unparseType TyInt = "Int"
unparseType TyString = "String"
unparseType TySub = "Sub"
unparseType TyPred = "Predicate"
unparseType TyObj = "Object"
unparseType TyTriple = "Triple"
unparseType TyFilename = "Filename" 
