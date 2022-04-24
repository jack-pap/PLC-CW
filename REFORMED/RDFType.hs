
module RDFType where 
import RDFGrammar

-- Data structures as defined in RDFGrammer:

-- data Type = TyBool | TyInt | TyString | TyTriple | TySub | TyPred
--             | TyObj | TyFilename
--             deriving (Show, Eq)
        
-- type Environment = [ (String,Expr) ]

-- data Expr = SelectWithCond Expr FileList Expr | Select Expr FileList | And Expr Expr | Or Expr Expr 
--             | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
--             | Triple | Subs | Preds | Objs
--             | TmTrue | TmFalse | Integer Int | Str String 
--             | Asterisks | CallFromFileSub String | CallFromFilePred String
--             | CallFromFileObj String | Greater Expr Expr
--             | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
--             | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
--             | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
--             deriving (Show, Eq)

type TypeEnvironment = [ (String,Type) ]

getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = error "Variable binding not found"
getBinding x ((y,t):tenv) | x == y  = t
                        | otherwise = getBinding x tenv

addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment
addBinding x t tenv = (x,t):tenv

typeOf :: TypeEnvironment -> Expr -> Type

typeOf tenv (SelectWithCond e1 f1 p1 ) | (typeOf tenv p1 == TyBool) = TyString 
typeOf tenv (Select e1 f1) = TyString 
-- typeOf tenv (From e1 ) = TyFilename 
typeOf tenv (And e1 e2 ) | (typeOf tenv e1, typeOf tenv e2) == (TyBool,TyBool)  = TyBool
typeOf tenv (Or e1 e2) | (typeOf tenv e1, typeOf tenv e2) == (TyBool,TyBool)  = TyBool
typeOf tenv (TypeFinder e1 t1 ) = t1 

typeOf tenv (Subs) = TySub 
typeOf tenv (Preds) = TyPred 
typeOf tenv (Objs) = TyObj 

--typeOf tenv (FileName s1) = TyString  
typeOf tenv (TmTrue ) = TyBool 
typeOf tenv (TmFalse ) = TyBool 
typeOf tenv (Integer e1 ) = TyInt
typeOf tenv (Str e1 ) = TyString
-- typeOf tenv (Base) = TyBase 
-- typeOf tenv (Prefix ) = TyPrefix 
typeOf tenv (Asterisks ) = TyString

typeOf tenv (CallFromFileSub s1) = TyString
typeOf tenv (CallFromFilePred s1) = TyString
typeOf tenv (CallFromFileObj s1) = TyString 

typeOf tenv (Greater e1 e2 ) | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyInt) = TyBool
                             | (typeOf tenv e1, typeOf tenv e2) == (TyString ,TyInt) = TyBool
                             | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyString) = TyBool                            
typeOf tenv (Less e1 e2 ) | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyInt) = TyBool
                          | (typeOf tenv e1, typeOf tenv e2) == (TyString ,TyInt) = TyBool
                          | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyString) = TyBool

typeOf tenv (Equal e1 e2 ) = TyBool
typeOf tenv (NotEqual e1 e2 ) = TyBool
typeOf tenv (LessThanEqual e1 e2 ) | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyInt) = TyBool
                                   | (typeOf tenv e1, typeOf tenv e2) == (TyString,TyInt) = TyBool
                                   | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyString) = TyBool  

typeOf tenv (GreaterThanEqual e1 e2 ) | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyInt) = TyBool
                                      | (typeOf tenv e1, typeOf tenv e2) == (TyString,TyInt) = TyBool
                                      | (typeOf tenv e1, typeOf tenv e2) == (TyInt,TyString) = TyBool   
typeOf tenv (Comma e1 e2 ) = TyString 

typeOf tenv (Plus e1 e2 ) = TyInt
typeOf tenv (Minus e1 e2 ) = TyInt
typeOf tenv (Div e1 e2 ) = TyInt
typeOf tenv (Mult e1 e2 ) = TyInt

typeOf tenv _ = error "Type Error"

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
