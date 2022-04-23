
module RDFEval where
import RDFGrammar

import Helper

-- --Data structures as defined in RDFGrammer:
-- data Type = TyBool | TyInt | TyString | TySub | TyPred
--             | TyObj | TyFilename
--             deriving (Show, Eq)
        
--type Environment = [ (String,Expr) ]

-- data Expr = SelectWithCond Expr Expr Expr | Select Expr Expr | And Expr Expr | Or Expr Expr 
--             | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
--             | Subs | Preds | Objs
--             | FileName String | TmTrue | TmFalse | Integer Int | Str String | Base 
--             | Prefix | Asterisks | CallFromFileSub String | CallFromFilePred String
--             | CallFromFileObj String | Greater Expr Expr
--             | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
--             | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
--             | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
--             | Lambda String Type Expr | Cl String Type Expr Environment
--             deriving (Show, Eq)

data Frame = HSelect Expr Environment | SelectH Expr | FromH 
           | HWhere Expr Environment | WhereH Expr 
           | HAnd Expr Environment | AndH Expr
           | HOr Expr Environment | OrH Expr 
           | HGreater Expr Environment | GreaterH Expr 
           | HLess Expr Environment | LessH Expr 
           | HEqual Expr Environment | EqualH Expr 
           | HNotEqual Expr Environment | NotEqualH Expr
           | HLessThanEqual Expr Environment | LessThanEqualH Expr 
           | HGreaterThanEqual Expr Environment | GreaterThanEqualH Expr
           | HComma Expr Environment | CommaH Expr
           
type Kontinuation = [ Frame ]
type State = (Expr,Environment,Kontinuation)

update :: Environment -> String -> Expr -> Environment
update env x e = (x,e) : env

-- Checks for terminated expressions
isValue :: Expr -> Bool
isValue (FileName _) = True
isValue (Integer _) = True
isValue TmTrue = True
isValue TmFalse = True
isValue Base = True
isValue Prefix = True 
isValue Asterisks  = True
isValue (Str _) = True
isValue _ = False

--Small step evaluation function
eval1 :: State -> State
                  
-- Rule for terminated evaluations
eval1 (v,env,[]) | isValue v = (v,env,[])

-- Evaluation rules for From operator
eval1 (Select e1 e2,env,k) = (e1,env,(HSelect e2 env):k)
eval1 (Asterisks,env1,(HSelect e env2):k) = (e,env2,(SelectH (Asterisks)):k)
eval1 ((Str n),env,(SelectH (Asterisks)):k) = (Str ((getAllFiles (removeWhiteSpace (splitOn ',' n)))),[],k)

-- Evaluation rules for And operator
eval1 ((And e1 e2),env,k) = (e1,env,(HAnd e2 env):k)
eval1 ((TmTrue),env1,(HAnd e env2):k) = (e,env2,(AndH (TmTrue)) : k)
eval1 ((TmTrue),env,(AndH (TmTrue)):k) = (TmTrue,[],k)

eval1 ((TmTrue),env1,(HAnd e env2):k) = (e,env2,(AndH (TmTrue)) : k)
eval1 ((TmFalse),env,(AndH (TmTrue)):k) = (TmFalse,[],k)

eval1 ((TmFalse),env1,(HAnd e env2):k) = (e,env2,(AndH (TmFalse)) : k)
eval1 ((TmFalse),env,(AndH (TmFalse)):k) = (TmFalse,[],k)

eval1 ((TmFalse),env1,(HAnd e env2):k) = (e,env2,(AndH (TmFalse)) : k)
eval1 ((TmTrue),env,(AndH (TmFalse)):k) = (TmFalse,[],k)

-- Evaluation rules for Or operator
eval1 ((Or e1 e2),env,k) = (e1,env,(HOr e2 env):k)
eval1 ((TmTrue),env1,(HOr e env2):k) = (e,env2,(OrH (TmTrue)) : k)
eval1 ((TmTrue),env,(OrH (TmTrue)):k) = (TmTrue,[],k)

eval1 ((TmTrue),env1,(HOr e env2):k) = (e,env2,(OrH (TmTrue)) : k)
eval1 ((TmFalse),env,(OrH (TmTrue)):k) = (TmTrue,[],k)

eval1 ((TmFalse),env1,(HOr e env2):k) = (e,env2,(OrH (TmFalse)) : k)
eval1 ((TmTrue),env,(OrH (TmFalse)):k) = (TmTrue,[],k)

eval1 ((TmFalse),env1,(HOr e env2):k) = (e,env2,(OrH (TmFalse)) : k)
eval1 ((TmFalse),env,(OrH (TmFalse)):k) = (TmFalse,[],k)                                      
                                      

-- Evaluation rules for Greater operator
eval1 ((Greater e1 e2),env,k) = (e1,env,(HGreater e2 env):k)
eval1 ((Integer n),env1,(HGreater e env2):k) = (e,env2,(GreaterH (Integer n)) : k)
eval1 ((Integer m),env,(GreaterH (Integer n)):k) | n > m = (TmTrue,[],k)
                                                 | otherwise = (TmFalse,[],k)

eval1 ((Greater e1 e2),env,k) = (e1,env,(HGreater e2 env):k)
eval1 ((Str n),env1,(HGreater e env2):k) = (e,env2,(GreaterH (Str n)) : k)
eval1 ((Str m),env,(GreaterH (Integer n)):k) = (TmFalse,[],k)

-- Evaluation rules for Less operator
eval1 ((Less e1 e2),env,k) = (e1,env,(HLess e2 env):k)
eval1 ((Integer n),env1,(HLess e env2):k) = (e,env2,(LessH (Integer n)) : k)
eval1 ((Integer m),env,(LessH (Integer n)):k) | n < m = (TmTrue,[],k)
                                              | otherwise = (TmFalse,[],k)

-- Evaluation rules for Equal operator
eval1 ((Equal e1 e2),env,k) | (isValue e1 && isValue e2) && (e1 == e2) = (TmTrue,[],k)
                            | (isValue e1 && isValue e2) && (e1 /= e2) = (TmFalse,[],k)
                            | otherwise = error "Wrong types in your equal parameters"


-- Evaluation rules for NotEqual operator
eval1 ((NotEqual e1 e2),env,k) | (isValue e1 && isValue e2) && (e1 /= e2) = (TmTrue,[],k)
                               | (isValue e1 && isValue e2) && (e1 == e2) = (TmFalse,[],k)
                               | otherwise = error "Wrong types in your equal parameters"


-- Evaluation rules for Greater than or equal operator
eval1 ((GreaterThanEqual e1 e2),env,k) = (e1,env,(HGreaterThanEqual e2 env):k)
eval1 ((Integer n),env1,(HLess e env2):k) = (e,env2,(GreaterThanEqualH (Integer n)) : k)
eval1 ((Integer m),env,(LessH (Integer n)):k) | n >= m = (TmTrue,[],k)
                                              | otherwise = (TmFalse,[],k)
                                              
-- Evaluation rules for Less than or equal operator
eval1 ((LessThanEqual e1 e2),env,k) = (e1,env,(HLessThanEqual e2 env):k)
eval1 ((Integer n),env1,(HLessThanEqual e env2):k) = (e,env2,(LessThanEqualH (Integer n)) : k)
eval1 ((Integer m),env,(LessThanEqualH (Integer n)):k) | n <= m = (TmTrue,[],k)
                                                       | otherwise = (TmFalse,[],k)

-- Rule for runtime errors
eval1 (e,env,k) = error "Evaluation Error"

-- Function to iterate the small step reduction to termination
evalLoop :: Expr -> Expr 
evalLoop e = evalLoop' (e,[],[])
  where evalLoop' (e,env,k) = if (e' == e) && (isValue e') && (null k) then e' else evalLoop' (e',env',k')
                       where (e',env',k') = eval1 (e,env,k) 

-- Function to unparse underlying values from the AST term
unparse :: Expr -> String 
unparse (FileName n) = n
unparse (Integer n) = show n
unparse (TmTrue) = "true"
unparse (TmFalse) = "false"
unparse (Base) = "@base"
unparse (Prefix) = "@prefix"
unparse (Asterisks) = "*"
unparse (Str n) = n
unparse _ = "Unknown"