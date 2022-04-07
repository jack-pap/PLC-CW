{-# OPTIONS_GHC -w #-}
module RDFGrammar where 
import RDFToken
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,119) ([0,96,1,1024,0,0,1024,0,0,0,1536,16,32768,512,0,0,0,0,8,0,1,0,8224,0,0,8,0,0,0,0,0,1024,0,24576,0,0,16,0,32768,0,4096,0,0,0,0,0,0,0,0,0,512,0,8192,0,0,0,0,128,0,16384,0,1024,0,8192,128,0,4096,0,0,4,16384,0,0,2048,0,32768,0,8192,32,0,0,0,0,0,0,8,32768,512,0,256,0,0,4,0,0,0,8200,0,256,4,32768,0,0,144,0,0,0,0,128,0,0,0,0,0,0,0,0,1024,0,0,0,16384,0,0,0,0,64,0,0,0,0,0,0,32,0,8192,0,0,16,32768,53265,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,2048,0,0,4,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Expr","PAndT","Prefix","Triple","Repeated","ObjList","Sub","Pred","Obj","Literal","URI","Shorthand","Tag","Domain","SubDomain","Link","true","false","\"@base\"","\"@prefix\"","\"http://\"","name","':'","'/'","'#'","'\"'","';'","','","'.'","'<'","'>'","int","str","%eof"]
        bit_start = st Prelude.* 37
        bit_end = (st Prelude.+ 1) Prelude.* 37
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..36]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (22) = happyShift action_7
action_0 (23) = happyShift action_8
action_0 (33) = happyShift action_9
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 (6) = happyGoto action_5
action_0 (7) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (33) = happyShift action_17
action_2 (14) = happyGoto action_22
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (37) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (22) = happyShift action_21
action_4 (23) = happyShift action_8
action_4 (33) = happyShift action_9
action_4 (5) = happyGoto action_20
action_4 (6) = happyGoto action_5
action_4 (7) = happyGoto action_6
action_4 _ = happyReduce_3

action_5 (23) = happyShift action_8
action_5 (33) = happyShift action_9
action_5 (6) = happyGoto action_18
action_5 (7) = happyGoto action_19
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_8

action_7 (33) = happyShift action_17
action_7 (14) = happyGoto action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (25) = happyShift action_15
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (25) = happyShift action_13
action_9 (33) = happyShift action_14
action_9 (10) = happyGoto action_10
action_9 (14) = happyGoto action_11
action_9 (15) = happyGoto action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (34) = happyShift action_31
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_16

action_12 _ = happyReduce_17

action_13 (26) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (24) = happyShift action_26
action_14 (25) = happyShift action_29
action_14 (19) = happyGoto action_25
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (26) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (32) = happyShift action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (24) = happyShift action_26
action_17 (19) = happyGoto action_25
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (23) = happyShift action_8
action_18 (6) = happyGoto action_18
action_18 _ = happyReduce_9

action_19 _ = happyReduce_7

action_20 (23) = happyShift action_8
action_20 (33) = happyShift action_9
action_20 (5) = happyGoto action_20
action_20 (6) = happyGoto action_5
action_20 (7) = happyGoto action_6
action_20 _ = happyReduce_6

action_21 (33) = happyShift action_17
action_21 (14) = happyGoto action_24
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (32) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyShift action_41
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (34) = happyShift action_40
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (25) = happyShift action_39
action_26 (17) = happyGoto action_38
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (23) = happyShift action_8
action_27 (33) = happyShift action_9
action_27 (5) = happyGoto action_37
action_27 (6) = happyGoto action_5
action_27 (7) = happyGoto action_6
action_27 _ = happyReduce_1

action_28 (33) = happyShift action_17
action_28 (14) = happyGoto action_36
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (34) = happyShift action_35
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (25) = happyShift action_34
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (33) = happyShift action_33
action_31 (8) = happyGoto action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (32) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (25) = happyShift action_13
action_33 (33) = happyShift action_14
action_33 (11) = happyGoto action_46
action_33 (14) = happyGoto action_47
action_33 (15) = happyGoto action_48
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_29

action_35 _ = happyReduce_28

action_36 (32) = happyShift action_45
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (23) = happyShift action_8
action_37 (33) = happyShift action_9
action_37 (5) = happyGoto action_20
action_37 (6) = happyGoto action_5
action_37 (7) = happyGoto action_6
action_37 _ = happyReduce_2

action_38 (27) = happyShift action_44
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (32) = happyShift action_43
action_39 _ = happyReduce_32

action_40 _ = happyReduce_27

action_41 (23) = happyShift action_8
action_41 (33) = happyShift action_9
action_41 (5) = happyGoto action_42
action_41 (6) = happyGoto action_5
action_41 (7) = happyGoto action_6
action_41 _ = happyReduce_4

action_42 (23) = happyShift action_8
action_42 (33) = happyShift action_9
action_42 (5) = happyGoto action_20
action_42 (6) = happyGoto action_5
action_42 (7) = happyGoto action_6
action_42 _ = happyReduce_5

action_43 (25) = happyShift action_39
action_43 (17) = happyGoto action_55
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (25) = happyShift action_53
action_44 (28) = happyShift action_54
action_44 (16) = happyGoto action_51
action_44 (18) = happyGoto action_52
action_44 _ = happyReduce_35

action_45 _ = happyReduce_10

action_46 (34) = happyShift action_50
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_18

action_48 _ = happyReduce_19

action_49 _ = happyReduce_11

action_50 (33) = happyShift action_60
action_50 (9) = happyGoto action_59
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_37

action_52 (27) = happyShift action_58
action_52 _ = happyReduce_36

action_53 (27) = happyShift action_57
action_53 _ = happyReduce_34

action_54 (25) = happyShift action_56
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_31

action_56 _ = happyReduce_30

action_57 (25) = happyShift action_53
action_57 (18) = happyGoto action_71
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (28) = happyShift action_54
action_58 (16) = happyGoto action_70
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (30) = happyShift action_69
action_59 _ = happyReduce_13

action_60 (20) = happyShift action_65
action_60 (21) = happyShift action_66
action_60 (25) = happyShift action_13
action_60 (33) = happyShift action_14
action_60 (35) = happyShift action_67
action_60 (36) = happyShift action_68
action_60 (12) = happyGoto action_61
action_60 (13) = happyGoto action_62
action_60 (14) = happyGoto action_63
action_60 (15) = happyGoto action_64
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (34) = happyShift action_73
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_22

action_63 _ = happyReduce_20

action_64 _ = happyReduce_21

action_65 _ = happyReduce_25

action_66 _ = happyReduce_26

action_67 _ = happyReduce_23

action_68 _ = happyReduce_24

action_69 (33) = happyShift action_33
action_69 (8) = happyGoto action_72
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_38

action_71 _ = happyReduce_33

action_72 _ = happyReduce_12

action_73 (31) = happyShift action_74
action_73 _ = happyReduce_15

action_74 (33) = happyShift action_60
action_74 (9) = happyGoto action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_14

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Base happy_var_2
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
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
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (OandB happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 5 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (OandBandO happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_2  5 happyReduction_6
happyReduction_6 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 happy_var_2
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  5 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (PandT happy_var_1 happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (Triplee happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  6 happyReduction_9
happyReduction_9 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happyReduce 5 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenName _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Prefixx happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 5 7 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Tripled happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 6 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (ReRepeated happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Repeatedd happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 9 happyReduction_14
happyReduction_14 ((HappyAbsSyn9  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (ObjectListss happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  9 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (ObjectLists happy_var_2
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn10
		 (SubjectURI happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn10
		 (SubjectSH happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn11
		 (PredicateURI happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn11
		 (PredicateSH happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn12
		 (ObjectURI happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn12
		 (ObjectSH happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  12 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (ObjectLit happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyTerminal (TokenIntLiteral _ happy_var_1))
	 =  HappyAbsSyn13
		 (LiteralInt happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 (HappyTerminal (TokenStrLiteral _ happy_var_1))
	 =  HappyAbsSyn13
		 (LiteralString happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  13 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn13
		 (LiteralTrue
	)

happyReduce_26 = happySpecReduce_1  13 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn13
		 (LiteralFalse
	)

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (URI happy_var_2
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  15 happyReduction_28
happyReduction_28 _
	(HappyTerminal (TokenName _ happy_var_2))
	_
	 =  HappyAbsSyn15
		 (ShortURIB happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 (HappyTerminal (TokenName _ happy_var_3))
	_
	(HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn15
		 (ShortURIP happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  16 happyReduction_30
happyReduction_30 (HappyTerminal (TokenName _ happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Tags happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyAbsSyn17  happy_var_3)
	_
	(HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn17
		 (Domainss happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  17 happyReduction_32
happyReduction_32 (HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn17
		 (Domains happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  18 happyReduction_33
happyReduction_33 (HappyAbsSyn18  happy_var_3)
	_
	(HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn18
		 (SubDomainss happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  18 happyReduction_34
happyReduction_34 (HappyTerminal (TokenName _ happy_var_1))
	 =  HappyAbsSyn18
		 (SubDomains happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  19 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (LinkD happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happyReduce 4 19 happyReduction_36
happyReduction_36 ((HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (LinkDS happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 4 19 happyReduction_37
happyReduction_37 ((HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (LinkDT happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happyReduce 6 19 happyReduction_38
happyReduction_38 ((HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (LinkDST happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 37 37 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTrue _ happy_dollar_dollar -> cont 20;
	TokenFalse _ happy_dollar_dollar -> cont 21;
	TokenBase _ -> cont 22;
	TokenPrefix _ -> cont 23;
	TokenHTTP _ -> cont 24;
	TokenName _ happy_dollar_dollar -> cont 25;
	TokenColon _ -> cont 26;
	TokenBackSlash _ -> cont 27;
	TokenTag _ -> cont 28;
	TokenQuote _ -> cont 29;
	TokenSemiColon _ -> cont 30;
	TokenComma _ -> cont 31;
	TokenFullStop _ -> cont 32;
	TokenLessThan _ -> cont 33;
	TokenGreaterThan _ -> cont 34;
	TokenIntLiteral _ happy_dollar_dollar -> cont 35;
	TokenStrLiteral _ happy_dollar_dollar -> cont 36;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 37 tk tks = happyError' (tks, explist)
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
