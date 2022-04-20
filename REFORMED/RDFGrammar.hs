{-# OPTIONS_GHC -w #-}
module RDFGrammar where 
import RDFToken
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5
	= HappyTerminal (RDFToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,154) ([0,16323,1,512,0,0,65292,4,57344,57857,7,64560,19,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63584,39,0,36879,61503,127,0,0,16440,252,34304,639,0,65292,4,6144,2558,65024,15,0,24576,10232,0,61632,79,32768,40929,0,49920,319,0,32646,2,3072,1279,0,65048,9,61440,55295,15,1792,8072,0,4096,0,0,16416,0,16384,192,0,49280,1,0,977,0,33280,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65280,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63616,1,0,1009,49152,57857,7,0,0,0,0,63488,63,0,32752,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Expr","Type","Bool","Int","String","Base","Prefix","Triple","Sub","Pred","Obj","URI","Filename","SELECT","FROM","WHERE","AND","OR","TYPE","filename","true","false","int","str","\"@base\"","\"@prefix\"","'*'","','","'.'","'('","')'","'>'","'<'","'='","\"!=\"","\">=\"","\"<=\"","%eof"]
        bit_start = st Prelude.* 41
        bit_end = (st Prelude.+ 1) Prelude.* 41
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..40]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_2
action_0 (18) = happyShift action_4
action_0 (23) = happyShift action_5
action_0 (24) = happyShift action_6
action_0 (25) = happyShift action_7
action_0 (26) = happyShift action_8
action_0 (27) = happyShift action_9
action_0 (28) = happyShift action_10
action_0 (29) = happyShift action_11
action_0 (30) = happyShift action_12
action_0 (33) = happyShift action_13
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (17) = happyShift action_2
action_2 (18) = happyShift action_4
action_2 (23) = happyShift action_5
action_2 (24) = happyShift action_6
action_2 (25) = happyShift action_7
action_2 (26) = happyShift action_8
action_2 (27) = happyShift action_9
action_2 (28) = happyShift action_10
action_2 (29) = happyShift action_11
action_2 (30) = happyShift action_12
action_2 (33) = happyShift action_13
action_2 (4) = happyGoto action_28
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (19) = happyShift action_17
action_3 (20) = happyShift action_18
action_3 (21) = happyShift action_19
action_3 (22) = happyShift action_20
action_3 (31) = happyShift action_21
action_3 (35) = happyShift action_22
action_3 (36) = happyShift action_23
action_3 (37) = happyShift action_24
action_3 (38) = happyShift action_25
action_3 (39) = happyShift action_26
action_3 (40) = happyShift action_27
action_3 (41) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_2
action_4 (18) = happyShift action_4
action_4 (23) = happyShift action_5
action_4 (24) = happyShift action_6
action_4 (25) = happyShift action_7
action_4 (26) = happyShift action_8
action_4 (27) = happyShift action_9
action_4 (28) = happyShift action_10
action_4 (29) = happyShift action_11
action_4 (30) = happyShift action_12
action_4 (33) = happyShift action_13
action_4 (4) = happyGoto action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (32) = happyShift action_15
action_5 _ = happyReduce_7

action_6 _ = happyReduce_8

action_7 _ = happyReduce_9

action_8 _ = happyReduce_10

action_9 _ = happyReduce_11

action_10 _ = happyReduce_12

action_11 _ = happyReduce_13

action_12 _ = happyReduce_14

action_13 (17) = happyShift action_2
action_13 (18) = happyShift action_4
action_13 (23) = happyShift action_5
action_13 (24) = happyShift action_6
action_13 (25) = happyShift action_7
action_13 (26) = happyShift action_8
action_13 (27) = happyShift action_9
action_13 (28) = happyShift action_10
action_13 (29) = happyShift action_11
action_13 (30) = happyShift action_12
action_13 (33) = happyShift action_13
action_13 (4) = happyGoto action_14
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (19) = happyShift action_17
action_14 (20) = happyShift action_18
action_14 (21) = happyShift action_19
action_14 (22) = happyShift action_20
action_14 (31) = happyShift action_21
action_14 (34) = happyShift action_53
action_14 (35) = happyShift action_22
action_14 (36) = happyShift action_23
action_14 (37) = happyShift action_24
action_14 (38) = happyShift action_25
action_14 (39) = happyShift action_26
action_14 (40) = happyShift action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (6) = happyShift action_38
action_15 (7) = happyShift action_39
action_15 (8) = happyShift action_40
action_15 (9) = happyShift action_41
action_15 (10) = happyShift action_42
action_15 (11) = happyShift action_43
action_15 (12) = happyShift action_44
action_15 (13) = happyShift action_45
action_15 (14) = happyShift action_46
action_15 (15) = happyShift action_47
action_15 (16) = happyShift action_48
action_15 (5) = happyGoto action_52
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (20) = happyShift action_18
action_16 (21) = happyShift action_19
action_16 (22) = happyShift action_20
action_16 (31) = happyShift action_21
action_16 (35) = happyShift action_22
action_16 (36) = happyShift action_23
action_16 (37) = happyShift action_24
action_16 (38) = happyShift action_25
action_16 (39) = happyShift action_26
action_16 (40) = happyShift action_27
action_16 _ = happyReduce_2

action_17 (17) = happyShift action_2
action_17 (18) = happyShift action_4
action_17 (23) = happyShift action_5
action_17 (24) = happyShift action_6
action_17 (25) = happyShift action_7
action_17 (26) = happyShift action_8
action_17 (27) = happyShift action_9
action_17 (28) = happyShift action_10
action_17 (29) = happyShift action_11
action_17 (30) = happyShift action_12
action_17 (33) = happyShift action_13
action_17 (4) = happyGoto action_51
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (17) = happyShift action_2
action_18 (18) = happyShift action_4
action_18 (23) = happyShift action_5
action_18 (24) = happyShift action_6
action_18 (25) = happyShift action_7
action_18 (26) = happyShift action_8
action_18 (27) = happyShift action_9
action_18 (28) = happyShift action_10
action_18 (29) = happyShift action_11
action_18 (30) = happyShift action_12
action_18 (33) = happyShift action_13
action_18 (4) = happyGoto action_50
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (17) = happyShift action_2
action_19 (18) = happyShift action_4
action_19 (23) = happyShift action_5
action_19 (24) = happyShift action_6
action_19 (25) = happyShift action_7
action_19 (26) = happyShift action_8
action_19 (27) = happyShift action_9
action_19 (28) = happyShift action_10
action_19 (29) = happyShift action_11
action_19 (30) = happyShift action_12
action_19 (33) = happyShift action_13
action_19 (4) = happyGoto action_49
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (6) = happyShift action_38
action_20 (7) = happyShift action_39
action_20 (8) = happyShift action_40
action_20 (9) = happyShift action_41
action_20 (10) = happyShift action_42
action_20 (11) = happyShift action_43
action_20 (12) = happyShift action_44
action_20 (13) = happyShift action_45
action_20 (14) = happyShift action_46
action_20 (15) = happyShift action_47
action_20 (16) = happyShift action_48
action_20 (5) = happyGoto action_37
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (17) = happyShift action_2
action_21 (18) = happyShift action_4
action_21 (23) = happyShift action_5
action_21 (24) = happyShift action_6
action_21 (25) = happyShift action_7
action_21 (26) = happyShift action_8
action_21 (27) = happyShift action_9
action_21 (28) = happyShift action_10
action_21 (29) = happyShift action_11
action_21 (30) = happyShift action_12
action_21 (33) = happyShift action_13
action_21 (4) = happyGoto action_36
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (17) = happyShift action_2
action_22 (18) = happyShift action_4
action_22 (23) = happyShift action_5
action_22 (24) = happyShift action_6
action_22 (25) = happyShift action_7
action_22 (26) = happyShift action_8
action_22 (27) = happyShift action_9
action_22 (28) = happyShift action_10
action_22 (29) = happyShift action_11
action_22 (30) = happyShift action_12
action_22 (33) = happyShift action_13
action_22 (4) = happyGoto action_35
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (17) = happyShift action_2
action_23 (18) = happyShift action_4
action_23 (23) = happyShift action_5
action_23 (24) = happyShift action_6
action_23 (25) = happyShift action_7
action_23 (26) = happyShift action_8
action_23 (27) = happyShift action_9
action_23 (28) = happyShift action_10
action_23 (29) = happyShift action_11
action_23 (30) = happyShift action_12
action_23 (33) = happyShift action_13
action_23 (4) = happyGoto action_34
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (17) = happyShift action_2
action_24 (18) = happyShift action_4
action_24 (23) = happyShift action_5
action_24 (24) = happyShift action_6
action_24 (25) = happyShift action_7
action_24 (26) = happyShift action_8
action_24 (27) = happyShift action_9
action_24 (28) = happyShift action_10
action_24 (29) = happyShift action_11
action_24 (30) = happyShift action_12
action_24 (33) = happyShift action_13
action_24 (4) = happyGoto action_33
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (17) = happyShift action_2
action_25 (18) = happyShift action_4
action_25 (23) = happyShift action_5
action_25 (24) = happyShift action_6
action_25 (25) = happyShift action_7
action_25 (26) = happyShift action_8
action_25 (27) = happyShift action_9
action_25 (28) = happyShift action_10
action_25 (29) = happyShift action_11
action_25 (30) = happyShift action_12
action_25 (33) = happyShift action_13
action_25 (4) = happyGoto action_32
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (17) = happyShift action_2
action_26 (18) = happyShift action_4
action_26 (23) = happyShift action_5
action_26 (24) = happyShift action_6
action_26 (25) = happyShift action_7
action_26 (26) = happyShift action_8
action_26 (27) = happyShift action_9
action_26 (28) = happyShift action_10
action_26 (29) = happyShift action_11
action_26 (30) = happyShift action_12
action_26 (33) = happyShift action_13
action_26 (4) = happyGoto action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (17) = happyShift action_2
action_27 (18) = happyShift action_4
action_27 (23) = happyShift action_5
action_27 (24) = happyShift action_6
action_27 (25) = happyShift action_7
action_27 (26) = happyShift action_8
action_27 (27) = happyShift action_9
action_27 (28) = happyShift action_10
action_27 (29) = happyShift action_11
action_27 (30) = happyShift action_12
action_27 (33) = happyShift action_13
action_27 (4) = happyGoto action_30
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (17) = happyShift action_2
action_28 (18) = happyShift action_4
action_28 (19) = happyShift action_17
action_28 (20) = happyShift action_18
action_28 (21) = happyShift action_19
action_28 (22) = happyShift action_20
action_28 (23) = happyShift action_5
action_28 (24) = happyShift action_6
action_28 (25) = happyShift action_7
action_28 (26) = happyShift action_8
action_28 (27) = happyShift action_9
action_28 (28) = happyShift action_10
action_28 (29) = happyShift action_11
action_28 (30) = happyShift action_12
action_28 (31) = happyShift action_21
action_28 (33) = happyShift action_13
action_28 (35) = happyShift action_22
action_28 (36) = happyShift action_23
action_28 (37) = happyShift action_24
action_28 (38) = happyShift action_25
action_28 (39) = happyShift action_26
action_28 (40) = happyShift action_27
action_28 (4) = happyGoto action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (20) = happyShift action_18
action_29 (21) = happyShift action_19
action_29 (22) = happyShift action_20
action_29 (31) = happyShift action_21
action_29 (35) = happyShift action_22
action_29 (36) = happyShift action_23
action_29 (37) = happyShift action_24
action_29 (38) = happyShift action_25
action_29 (39) = happyShift action_26
action_29 (40) = happyShift action_27
action_29 _ = happyReduce_1

action_30 (31) = happyShift action_21
action_30 (40) = happyFail []
action_30 _ = happyReduce_20

action_31 (31) = happyShift action_21
action_31 (39) = happyFail []
action_31 (40) = happyShift action_27
action_31 _ = happyReduce_21

action_32 (31) = happyShift action_21
action_32 (38) = happyFail []
action_32 (39) = happyShift action_26
action_32 (40) = happyShift action_27
action_32 _ = happyReduce_19

action_33 (31) = happyShift action_21
action_33 (37) = happyFail []
action_33 (38) = happyShift action_25
action_33 (39) = happyShift action_26
action_33 (40) = happyShift action_27
action_33 _ = happyReduce_18

action_34 (31) = happyShift action_21
action_34 (35) = happyShift action_22
action_34 (36) = happyFail []
action_34 (37) = happyShift action_24
action_34 (38) = happyShift action_25
action_34 (39) = happyShift action_26
action_34 (40) = happyShift action_27
action_34 _ = happyReduce_17

action_35 (31) = happyShift action_21
action_35 (35) = happyFail []
action_35 (37) = happyShift action_24
action_35 (38) = happyShift action_25
action_35 (39) = happyShift action_26
action_35 (40) = happyShift action_27
action_35 _ = happyReduce_16

action_36 _ = happyReduce_22

action_37 _ = happyReduce_6

action_38 _ = happyReduce_24

action_39 _ = happyReduce_25

action_40 _ = happyReduce_26

action_41 _ = happyReduce_27

action_42 _ = happyReduce_28

action_43 (6) = happyShift action_38
action_43 (7) = happyShift action_39
action_43 (8) = happyShift action_40
action_43 (9) = happyShift action_41
action_43 (10) = happyShift action_42
action_43 (11) = happyShift action_43
action_43 (12) = happyShift action_44
action_43 (13) = happyShift action_45
action_43 (14) = happyShift action_46
action_43 (15) = happyShift action_47
action_43 (16) = happyShift action_48
action_43 (5) = happyGoto action_54
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_29

action_45 _ = happyReduce_30

action_46 _ = happyReduce_31

action_47 _ = happyReduce_33

action_48 _ = happyReduce_34

action_49 (31) = happyShift action_21
action_49 (35) = happyShift action_22
action_49 (36) = happyShift action_23
action_49 (37) = happyShift action_24
action_49 (38) = happyShift action_25
action_49 (39) = happyShift action_26
action_49 (40) = happyShift action_27
action_49 _ = happyReduce_5

action_50 (31) = happyShift action_21
action_50 (35) = happyShift action_22
action_50 (36) = happyShift action_23
action_50 (37) = happyShift action_24
action_50 (38) = happyShift action_25
action_50 (39) = happyShift action_26
action_50 (40) = happyShift action_27
action_50 _ = happyReduce_4

action_51 (20) = happyShift action_18
action_51 (21) = happyShift action_19
action_51 (22) = happyShift action_20
action_51 (31) = happyShift action_21
action_51 (35) = happyShift action_22
action_51 (36) = happyShift action_23
action_51 (37) = happyShift action_24
action_51 (38) = happyShift action_25
action_51 (39) = happyShift action_26
action_51 (40) = happyShift action_27
action_51 _ = happyReduce_3

action_52 _ = happyReduce_15

action_53 _ = happyReduce_23

action_54 (6) = happyShift action_38
action_54 (7) = happyShift action_39
action_54 (8) = happyShift action_40
action_54 (9) = happyShift action_41
action_54 (10) = happyShift action_42
action_54 (11) = happyShift action_43
action_54 (12) = happyShift action_44
action_54 (13) = happyShift action_45
action_54 (14) = happyShift action_46
action_54 (15) = happyShift action_47
action_54 (16) = happyShift action_48
action_54 (5) = happyGoto action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (6) = happyShift action_38
action_55 (7) = happyShift action_39
action_55 (8) = happyShift action_40
action_55 (9) = happyShift action_41
action_55 (10) = happyShift action_42
action_55 (11) = happyShift action_43
action_55 (12) = happyShift action_44
action_55 (13) = happyShift action_45
action_55 (14) = happyShift action_46
action_55 (15) = happyShift action_47
action_55 (16) = happyShift action_48
action_55 (5) = happyGoto action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_32

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_3)
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Select happy_var_2 happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (From happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Where happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  4 happyReduction_4
happyReduction_4 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (And happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  4 happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Or happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  4 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (TypeFinder happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  4 happyReduction_7
happyReduction_7 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn4
		 (FileName happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  4 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn4
		 (TmTrue
	)

happyReduce_9 = happySpecReduce_1  4 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn4
		 (TmFalse
	)

happyReduce_10 = happySpecReduce_1  4 happyReduction_10
happyReduction_10 (HappyTerminal (TokenIntLiteral _ happy_var_1))
	 =  HappyAbsSyn4
		 (Integer happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  4 happyReduction_11
happyReduction_11 (HappyTerminal (TokenStringLiteral _ happy_var_1))
	 =  HappyAbsSyn4
		 (Str happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  4 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn4
		 (Base
	)

happyReduce_13 = happySpecReduce_1  4 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn4
		 (Prefix
	)

happyReduce_14 = happySpecReduce_1  4 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn4
		 (Asterisks
	)

happyReduce_15 = happySpecReduce_3  4 happyReduction_15
happyReduction_15 (HappyAbsSyn5  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn4
		 (CallFromFile happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  4 happyReduction_16
happyReduction_16 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  4 happyReduction_17
happyReduction_17 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Less happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  4 happyReduction_18
happyReduction_18 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  4 happyReduction_19
happyReduction_19 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (NotEqual happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  4 happyReduction_20
happyReduction_20 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (LessThanEqual happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  4 happyReduction_21
happyReduction_21 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (GreaterThanEqual happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  4 happyReduction_22
happyReduction_22 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (Comma happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  4 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  5 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn5
		 (TyBool
	)

happyReduce_25 = happySpecReduce_1  5 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn5
		 (TyInt
	)

happyReduce_26 = happySpecReduce_1  5 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn5
		 (TyString
	)

happyReduce_27 = happySpecReduce_1  5 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn5
		 (TyBase
	)

happyReduce_28 = happySpecReduce_1  5 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn5
		 (TyPrefix
	)

happyReduce_29 = happySpecReduce_1  5 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn5
		 (TySub
	)

happyReduce_30 = happySpecReduce_1  5 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn5
		 (TyPred
	)

happyReduce_31 = happySpecReduce_1  5 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn5
		 (TyObj
	)

happyReduce_32 = happyReduce 4 5 happyReduction_32
happyReduction_32 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (TyTriple happy_var_2 happy_var_3 happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_1  5 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn5
		 (TyURI
	)

happyReduce_34 = happySpecReduce_1  5 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn5
		 (TyFilename
	)

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBool _ -> cont 6;
	TokenTypeInt _ -> cont 7;
	TokenTypeString _ -> cont 8;
	TokenTypeBase _ -> cont 9;
	TokenTypePrefix _ -> cont 10;
	TokenTypeTriple _ -> cont 11;
	TokenTypeSub _ -> cont 12;
	TokenTypePred _ -> cont 13;
	TokenTypeObj _ -> cont 14;
	TokenTypeURI _ -> cont 15;
	TokenTypeFile _ -> cont 16;
	TokenSelect _ -> cont 17;
	TokenFrom _ -> cont 18;
	TokenWhere _ -> cont 19;
	TokenAnd _ -> cont 20;
	TokenOr _ -> cont 21;
	TokenType _ -> cont 22;
	TokenFilename _ happy_dollar_dollar -> cont 23;
	TokenTrue _ -> cont 24;
	TokenFalse _ -> cont 25;
	TokenIntLiteral _ happy_dollar_dollar -> cont 26;
	TokenStringLiteral _ happy_dollar_dollar -> cont 27;
	TokenBase _ -> cont 28;
	TokenPrefix _ -> cont 29;
	TokenAsterisks _ -> cont 30;
	TokenComma _ -> cont 31;
	TokenFullStop _ -> cont 32;
	TokenLeftBracket _ -> cont 33;
	TokenRightBracket _ -> cont 34;
	TokenGreaterThan _ -> cont 35;
	TokenLessThan _ -> cont 36;
	TokenEqual _ -> cont 37;
	TokenNotEqual _ -> cont 38;
	TokenGreaterOrEqual _ -> cont 39;
	TokenLessOrEqual _ -> cont 40;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 41 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(RDFToken)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [RDFToken] -> a
parseError [] = error "Parse error on empty file" 
parseError (t:ts) = error ("Parse error at " ++ tokenPosn t)

data Type = TyBool | TyInt | TyString | TyBase | TyPrefix | TySub | TyPred
            | TyObj | TyTriple Type Type Type | TyURI | TyFilename
            deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = Select Expr Expr | From Expr | Where Expr Expr | And Expr Expr | Or Expr Expr | TypeFinder Expr Type
            | FileName String | TmTrue | TmFalse | Integer Int | Str String | Base 
            | Prefix | Asterisks | CallFromFile String Type | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr
            | Lambda String Type Expr | Cl String Type Expr Environment
            deriving (Show, Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
