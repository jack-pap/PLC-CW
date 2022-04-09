{-# OPTIONS_GHC -w #-}
module RDFGrammar where 
import RDFToken
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22
	= HappyTerminal (RDFToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,126) ([0,768,8,0,1,0,0,8,0,0,0,256,0,0,2050,0,0,8,0,2,0,0,0,0,2048,0,2048,0,0,2056,0,0,16,0,0,0,0,0,0,16,0,3072,0,0,16,0,0,4,0,4,0,0,0,0,0,0,0,0,0,2048,0,0,4,0,0,0,0,4,0,4096,0,2048,0,0,2050,0,0,8,0,4096,0,2048,0,0,2048,0,0,4,0,2056,0,0,0,0,0,0,0,4,0,0,0,8192,0,0,1024,0,0,0,0,2050,0,0,0,0,8,0,18432,0,0,0,0,0,16,0,0,0,0,0,0,0,0,0,8,0,0,0,8192,0,0,0,0,0,0,0,8,0,0,0,0,0,0,2048,0,0,64,0,0,1,49152,26632,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,2,0,2048,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Expr","PAndT","Y","Prefix","X","Triple","Repeated","ObjList","Sub","Pred","Obj","Literal","URI","Shorthand","Link","Tag","Domain","SubDomain","N","true","false","\"@base\"","\"@prefix\"","\"http://\"","name","':'","'/'","'#'","'\"'","';'","','","'.'","'<'","'>'","int","str","%eof"]
        bit_start = st Prelude.* 40
        bit_end = (st Prelude.+ 1) Prelude.* 40
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..39]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (25) = happyShift action_9
action_0 (26) = happyShift action_10
action_0 (36) = happyShift action_11
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 (6) = happyGoto action_5
action_0 (7) = happyGoto action_6
action_0 (8) = happyGoto action_7
action_0 (9) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (25) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (36) = happyShift action_19
action_2 (16) = happyGoto action_24
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (40) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (25) = happyShift action_23
action_4 _ = happyReduce_3

action_5 (26) = happyShift action_10
action_5 (36) = happyShift action_11
action_5 (5) = happyGoto action_22
action_5 (6) = happyGoto action_5
action_5 (7) = happyGoto action_6
action_5 (8) = happyGoto action_7
action_5 (9) = happyGoto action_8
action_5 _ = happyReduce_7

action_6 (36) = happyShift action_11
action_6 (9) = happyGoto action_21
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (26) = happyShift action_10
action_7 (7) = happyGoto action_20
action_7 (8) = happyGoto action_7
action_7 _ = happyReduce_11

action_8 _ = happyReduce_9

action_9 (36) = happyShift action_19
action_9 (16) = happyGoto action_18
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (28) = happyShift action_17
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (28) = happyShift action_15
action_11 (36) = happyShift action_16
action_11 (12) = happyGoto action_12
action_11 (16) = happyGoto action_13
action_11 (17) = happyGoto action_14
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (37) = happyShift action_33
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_18

action_14 _ = happyReduce_19

action_15 (29) = happyShift action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (27) = happyShift action_28
action_16 (28) = happyShift action_31
action_16 (18) = happyGoto action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (29) = happyShift action_30
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (35) = happyShift action_29
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (27) = happyShift action_28
action_19 (18) = happyGoto action_27
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_10

action_21 _ = happyReduce_8

action_22 _ = happyReduce_6

action_23 (36) = happyShift action_19
action_23 (16) = happyGoto action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (35) = happyShift action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyFail (happyExpListPerState 25)

action_26 (35) = happyShift action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (37) = happyShift action_42
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (28) = happyShift action_41
action_28 (20) = happyGoto action_40
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (26) = happyShift action_10
action_29 (36) = happyShift action_11
action_29 (5) = happyGoto action_39
action_29 (6) = happyGoto action_5
action_29 (7) = happyGoto action_6
action_29 (8) = happyGoto action_7
action_29 (9) = happyGoto action_8
action_29 _ = happyReduce_1

action_30 (36) = happyShift action_19
action_30 (16) = happyGoto action_38
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (37) = happyShift action_37
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (28) = happyShift action_36
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (36) = happyShift action_35
action_33 (10) = happyGoto action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (35) = happyShift action_51
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (28) = happyShift action_15
action_35 (36) = happyShift action_16
action_35 (13) = happyGoto action_48
action_35 (16) = happyGoto action_49
action_35 (17) = happyGoto action_50
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_31

action_37 _ = happyReduce_30

action_38 (35) = happyShift action_47
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_2

action_40 (30) = happyShift action_46
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (35) = happyShift action_45
action_41 _ = happyReduce_38

action_42 _ = happyReduce_29

action_43 (26) = happyShift action_10
action_43 (36) = happyShift action_11
action_43 (5) = happyGoto action_44
action_43 (6) = happyGoto action_5
action_43 (7) = happyGoto action_6
action_43 (8) = happyGoto action_7
action_43 (9) = happyGoto action_8
action_43 _ = happyReduce_4

action_44 _ = happyReduce_5

action_45 (28) = happyShift action_41
action_45 (20) = happyGoto action_58
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (28) = happyShift action_56
action_46 (31) = happyShift action_57
action_46 (19) = happyGoto action_53
action_46 (21) = happyGoto action_54
action_46 (22) = happyGoto action_55
action_46 _ = happyReduce_32

action_47 _ = happyReduce_12

action_48 (37) = happyShift action_52
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_20

action_50 _ = happyReduce_21

action_51 _ = happyReduce_13

action_52 (36) = happyShift action_63
action_52 (11) = happyGoto action_62
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_34

action_54 (30) = happyShift action_61
action_54 _ = happyReduce_33

action_55 (30) = happyShift action_60
action_55 _ = happyReduce_40

action_56 _ = happyReduce_41

action_57 (28) = happyShift action_59
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_37

action_59 _ = happyReduce_36

action_60 (28) = happyShift action_56
action_60 (21) = happyGoto action_74
action_60 (22) = happyGoto action_55
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (31) = happyShift action_57
action_61 (19) = happyGoto action_73
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (33) = happyShift action_72
action_62 _ = happyReduce_15

action_63 (23) = happyShift action_68
action_63 (24) = happyShift action_69
action_63 (28) = happyShift action_15
action_63 (36) = happyShift action_16
action_63 (38) = happyShift action_70
action_63 (39) = happyShift action_71
action_63 (14) = happyGoto action_64
action_63 (15) = happyGoto action_65
action_63 (16) = happyGoto action_66
action_63 (17) = happyGoto action_67
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (37) = happyShift action_76
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_24

action_66 _ = happyReduce_22

action_67 _ = happyReduce_23

action_68 _ = happyReduce_27

action_69 _ = happyReduce_28

action_70 _ = happyReduce_25

action_71 _ = happyReduce_26

action_72 (36) = happyShift action_35
action_72 (10) = happyGoto action_75
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_35

action_74 _ = happyReduce_39

action_75 _ = happyReduce_14

action_76 (34) = happyShift action_77
action_76 _ = happyReduce_17

action_77 (36) = happyShift action_63
action_77 (11) = happyGoto action_78
action_77 _ = happyFail (happyExpListPerState 77)

action_78 _ = happyReduce_16

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Base happy_var_2
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (BandO happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 4 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (OandB happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 5 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (OandBandO happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (PAndT happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Y happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  6 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (PandTT happy_var_1 happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (Triplee happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  7 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Prefixx happy_var_1 happy_var_2
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (X happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 5 8 happyReduction_12
happyReduction_12 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Prefixxx happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 5 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Tripled happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 6 10 happyReduction_14
happyReduction_14 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ReRepeated happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 10 happyReduction_15
happyReduction_15 ((HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Repeatedd happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 5 11 happyReduction_16
happyReduction_16 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (ObjectListss happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (ObjectLists happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  12 happyReduction_18
happyReduction_18 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn12
		 (SubjectURI happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  12 happyReduction_19
happyReduction_19 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (SubjectSH happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  13 happyReduction_20
happyReduction_20 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 (PredicateURI happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  13 happyReduction_21
happyReduction_21 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn13
		 (PredicateSH happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  14 happyReduction_22
happyReduction_22 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (ObjectURI happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  14 happyReduction_23
happyReduction_23 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn14
		 (ObjectSH happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  14 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (ObjectLit happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  15 happyReduction_25
happyReduction_25 (HappyTerminal (TokenIntLiteral _ happy_var_1))
	 =  HappyAbsSyn15
		 (LiteralInt happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  15 happyReduction_26
happyReduction_26 (HappyTerminal (TokenStrLiteral _ happy_var_1))
	 =  HappyAbsSyn15
		 (LiteralString happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn15
		 (LiteralTrue
	)

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn15
		 (LiteralFalse
	)

happyReduce_29 = happySpecReduce_3  16 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (URI happy_var_2
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  17 happyReduction_30
happyReduction_30 _
	(HappyTerminal (TokenName _ happy_var_2))
	_
	 =  HappyAbsSyn17
		 (ShortURIB happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyTerminal (TokenName _ happy_var_3))
	_
	(HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn17
		 (ShortURIP happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  18 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn20  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (LinkD happy_var_2
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happyReduce 4 18 happyReduction_33
happyReduction_33 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (LinkDS happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 4 18 happyReduction_34
happyReduction_34 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (LinkDT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_35 = happyReduce 6 18 happyReduction_35
happyReduction_35 ((HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (LinkDST happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_2  19 happyReduction_36
happyReduction_36 (HappyTerminal (TokenName _ happy_var_2))
	_
	 =  HappyAbsSyn19
		 (Tags happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  20 happyReduction_37
happyReduction_37 (HappyAbsSyn20  happy_var_3)
	_
	(HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn20
		 (Domainss happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  20 happyReduction_38
happyReduction_38 (HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn20
		 (Domains happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  21 happyReduction_39
happyReduction_39 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (SubDomainss happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  21 happyReduction_40
happyReduction_40 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn21
		 (N happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  22 happyReduction_41
happyReduction_41 (HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn22
		 (String happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 40 40 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTrue _ happy_dollar_dollar -> cont 23;
	TokenFalse _ happy_dollar_dollar -> cont 24;
	TokenBase _ -> cont 25;
	TokenPrefix _ -> cont 26;
	TokenHTTP _ -> cont 27;
	TokenName _ happy_dollar_dollar -> cont 28;
	TokenColon _ -> cont 29;
	TokenBackSlash _ -> cont 30;
	TokenTag _ -> cont 31;
	TokenQuote _ -> cont 32;
	TokenSemiColon _ -> cont 33;
	TokenComma _ -> cont 34;
	TokenFullStop _ -> cont 35;
	TokenLessThan _ -> cont 36;
	TokenGreaterThan _ -> cont 37;
	TokenIntLiteral _ happy_dollar_dollar -> cont 38;
	TokenStrLiteral _ happy_dollar_dollar -> cont 39;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 40 tk tks = happyError' (tks, explist)
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

data Expr = Base URI 
          | BandO URI PAndT 
          | OandB PAndT URI 
          | OandBandO PAndT URI PAndT 
          deriving Show
          

data PAndT = PAndT Y PAndT
           deriving Show

data Y = PandTT Prefix Triple
       | Triplee Triple 
     deriving Show

data Prefix = Prefixx X Prefix
            deriving Show

data X = Prefixxx String URI 
       deriving Show

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

data Link = LinkD Domain
          | LinkDS Domain Subdomain
          | LinkDT Domain Subdomain
          | LinkDST Domain Subdomain Tag
          deriving Show
          
data Tag = Tags String
           deriving Show

data Domain = Domainss String Domain
            | Domains String
            deriving Show 
            
    
data Subdomain = Subdomainss N Subdomain
               | N N
               deriving Show

data N = String String
       deriving Show
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
