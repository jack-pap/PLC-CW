
module RDFEval where
import RDFGrammar


import SurpassingMyLimits

-- --Data structures as defined in RDFGrammer:
-- data Type = TyBool | TyInt | TyString | TyTriple | TySub | TyPred
--             | TyObj | TyFilename
--             deriving (Show, Eq)
        
--type Environment = [ (String,Expr) ]

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

-- Checks for terminated expressions
isValue :: Expr -> Bool
--isValue (FileName _ ) = True
isValue (Integer _ ) = True
isValue TmTrue = True
isValue TmFalse = True
isValue Asterisks  = True
isValue (Str _) = True
isValue _ = False

--Small step evaluation function
eval1 :: Expr -> IO ()
-- Evaluation rules for Select operator
-- eval1 (Select e1 e2,env,k) = (e1,env,(HSelect e2 env):k)
-- eval1 (Asterisks,env1,(HSelect e2 env2):k) = (e2,env2,(SelectH (Asterisks)):k)
-- eval1 ((FileName n),env,(SelectH (Asterisks)):k) = (Str ((getAllFiles (removeWhiteSpaceList (splitOn ',' n)))),[],k)

-- Evaluation rules for SelectWithCond operator
eval1 (SelectWithCond e1 filenames predicate) |e1 == Asterisks = getAllFiles (removeWhiteSpaceList (filenameConv filenames))
eval1 (SELECT) = filehandler (error "")

eval1 (predicate) = error 

eval2 preficate alldata = helper (predicate filter)

-- Evaluation rules for Select operator
eval1 (Select Asterisks (filenames)) = getAllFiles (removeWhiteSpaceList (filenameConv filenames))

--eval1 (LessThanEqual e1 e2) | (isValue e1 && isValuee1) && (e1 <= e2) = TmTrue 

-- -- Rule for runtime errors
-- eval1 (e,env,k) = error "Evaluation Error"

-- Function to iterate the small step reduction to termination
-- evalLoop :: Expr -> Expr 
-- evalLoop e = evalLoop' (e,[],[])
--   where evalLoop' (e,env,k) = if (e' == e) && (isValue e') && (null k) then e' else evalLoop' (e',env',k')
--                        where (e',env',k') = eval1 (e,env,k) 

-- Function to unparse underlying values from the AST term
-- unparse :: Expr -> String 
-- unparse (FileName n) = n
-- unparse (Integer n) = show n
-- unparse (TmTrue) = "true"
-- unparse (TmFalse) = "false"
-- unparse (Base) = "@base"
-- unparse (Prefix) = "@prefix"
-- unparse (Asterisks) = "*"
-- unparse (Str n) = n
-- unparse _ = "Unknown"