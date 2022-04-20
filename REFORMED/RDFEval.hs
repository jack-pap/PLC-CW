
module RDFEval where
import RDFGrammar

--Data structures as defined in RDFGrammer:
--data Type = TyBool | TyInt | TyString | TyBase | TyPrefix | TySub | TyPred
--            | TyObj | TyTriple Type Type Type | TyURI | TyFilename
--            deriving (Show, Eq)
        
--type Environment = [ (String,Expr) ]

--data Expr = Select Expr Expr | From Expr | Where Expr Expr | And Expr Expr | Or Expr Expr | TypeFinder Expr Type
--            | FileName String | TmTrue | TmFalse | Integer Int | Str String | Base 
--            | Prefix | Asterisks | CallFromFile String Type | Greater Expr Expr
--            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
--            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr
--            | Lambda String Type Expr | Cl String Type Expr Environment
--            deriving (Show, Eq)

data Frame = HSelect Expr Environment | SelectH Expr | FromH 
           | HWhere Expr Environment | WhereH Expr 
           | HAnd Expr Environment | AndH Expr
           | HOr Expr Environment | OrH Expr 
           | HGreater Expr Environment | GreaterH Expr 
           | HLess Expr Environment | LessH Expr 
           | HEqual Expr Environment | EqualH Expr 
           | HNotEqual Expr Environment | NotEqualH Exp
           | HLessThanEqual Expr Environment | LessThanEqualH Expr 
           | HGreaterThanEqual Expr Environment | GreaterThanEqualH Expr
           
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

-- Evaluation rules for less than operator
eval1 ((TmCompare e1 e2),env,k) = (e1,env,(HCompare e2 env):k)
eval1 ((TmInt n),env1,(HCompare e env2):k) = (e,env2,(CompareH (TmInt n)) : k)
eval1 ((TmInt m),env,(CompareH (TmInt n)):k) | n < m = (TmTrue,[],k)
                                             | otherwise = (TmFalse,[],k)

-- Evaluation rules for plus operator
eval1 ((TmAdd e1 e2),env,k) = (e1,env,(HAdd e2 env):k)
eval1 ((TmInt n),env1,(HAdd e env2):k) = (e,env2,(AddH (TmInt n)) : k)
eval1 ((TmInt m),env,(AddH (TmInt n)):k) = (TmInt (n + m),[],k)

-- Evaluation rules for projections
eval1 ((TmFst e1),env,k) = (e1,env, FstH : k)
eval1 ((TmSnd e1),env,k) = (e1,env, SndH : k)
eval1 ((TmPair v w),env, FstH:k) | isValue v && isValue w = ( v , [] , k)
eval1 ((TmPair v w),env, SndH:k) | isValue v && isValue w = ( w , [] , k)

-- Evaluation rules for pairs
eval1 ((TmPair e1 e2),env,k) = (e1,env,(HPair e2 env):k)
eval1 (v,env1,(HPair e env2):k) | isValue v = (e,env2,(PairH v) : k)
eval1 (w,env,(PairH v):k) | isValue w = ( (TmPair v w),[],k)

-- Evaluation rules for if-then-else
eval1 ((TmIf e1 e2 e3),env,k) = (e1,env,(HIf e2 e3 env):k)
eval1 (TmTrue,env1,(HIf e2 e3 env2):k) = (e2,env2,k)
eval1 (TmFalse,env1,(HIf e2 e3 env2):k) = (e3,env2,k)

-- Evaluation rules for Let blocks
eval1 ((TmLet x typ e1 e2),env,k) = (e1,env,(HLet x typ e2 env):k)
eval1 (v,env1,(HLet x typ e env2):k) | isValue v = (e, update env2 x v , k)

--  Rule to make closures from lambda abstractions.
eval1 ((TmLambda x typ e),env,k) = ((Cl x typ e env), [], k)

-- Evaluation rules for application
eval1 ((TmApp e1 e2),env,k) = (e1,env, (HApp e2 env) : k)
eval1 (v,env1,(HApp e env2):k ) | isValue v = (e, env2, (AppH v) : k)
eval1 (v,env1,(AppH (Cl x typ e env2) ) : k )  = (e, update env2 x v, k)

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
unparse (Asterisks) = '*'
unparse (Str n) = n
unparse _ = "Unknown"