
module RDFEval where
import RDFGrammar
import SurpassingMyLimits
import RDFGrammar (Comparators(LessThanEqual))


-- --Data structures as defined in RDFGrammer:
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
eval1 (SelectWithCond e1 filenames predicate) |e1 == Asterisks = getAllFiles (removeWhiteSpaceList (filenameConv filenames)) --eval2 predicate (getAllFiles (removeWhiteSpaceList (filenameConv filenames)))

-- Evaluation rules for Select operator
eval1 (Select Asterisks (filenames)) = getAllFiles (removeWhiteSpaceList (filenameConv filenames))

eval2 :: Comparators -> IO ()
eval2 (And e1 e2) alldata = helper (filter (e1 && e2) alldata)
eval2 (Or e1 e2) alldata = helper (filter (e1 || e2) alldata)
eval2 (TypeFinder e1 t1) alldata = helper (filter (\x -> typeOfE e1 == t1) alldata)
eval2 (If p1 e1 e2) alldata | p1 == TyTrue = helper (filter e1 alldata)
                            | otherwise = helper (filter e2 alldata)
eval2 (Replace e1 e2) alldata = list comprehension 
eval2 (Greater e1 e2) alldata = helper (filter (\x -> e1 > e2) alldata)
eval2 (Less e1 e2) alldata = helper (filter (\x -> e1 < e2) alldata)
eval2 (Equal e1 e2) alldata = helper (filter (\x -> e1 == e2) alldata)
eval2 (NotEqual e1 e2) alldata = helper (filter (\x -> e1 /= e2) alldata)
eval2 (LessThanEqual e1 e2) alldata = helper (filter (\x -> e1 <= e2) alldata)
eval2 (GreaterThanEqual e1 e2) alldata = helper (filter (\x -> e1 >= e2) alldata)
eval2 (Plus e1 e2) alldata = helper (filter (\x -> e1 + e2) alldata)
eval2 (Minus e1 e2) alldata = helper (filter (\x -> e1 - e2) alldata)
eval2 (Div e1 e2) alldata = helper (filter (\x -> e1 / e2) alldata)
eval2 (Mult e1 e2) alldata = helper (filter (\x -> e1 * e2) alldata)




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