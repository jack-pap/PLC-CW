{-# OPTIONS_GHC -w #-}
module RDFGrammar where 
import RDFToken
import System.IO
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (RDFToken)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,222) ([0,1,16,0,4,0,0,0,33,0,0,0,0,0,528,0,1024,16384,0,0,0,2,32768,0,1,0,0,8,0,0,0,0,32,64,0,0,4,0,0,528,0,0,56,0,0,256,0,0,0,0,0,4,0,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,0,16384,32752,4,0,4096,0,0,0,0,0,896,0,0,0,57600,127,0,4096,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,32752,4,0,56,32,0,0,65168,7,57344,0,0,64,1024,0,256,4096,0,1024,18431,0,4096,8188,1,16384,32752,4,0,65473,17,0,65284,71,0,64528,287,0,61504,1151,0,49408,4607,0,1024,18431,0,4096,8188,1,16384,32752,4,0,1,16,0,4,64,61440,15,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,30,0,256,124,0,1024,504,0,4096,2032,0,16384,8168,0,0,32641,0,0,57344,1,0,16,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,4,0,1,16,0,0,16,0,0,512,0,0,0,0,256,4096,0,0,32768,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Expr","Selectors","FileList","Comparators","Type","Bool","Int","String","Triple","Sub","Pred","Obj","Filename","SELECT","FROM","WHERE","AND","OR","TYPE","IF","REPLACE","TRIPLE","SUB","PRED","OBJ","filename","true","false","int","str","'*'","','","'.'","'('","')'","\"->\"","'>'","'<'","'='","\"!=\"","\">=\"","\"<=\"","'+'","'-'","'/'","'x'","%eof"]
        bit_start = st Prelude.* 50
        bit_end = (st Prelude.+ 1) Prelude.* 50
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..49]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_4
action_0 (37) = happyShift action_5
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (29) = happyShift action_8
action_2 (34) = happyShift action_9
action_2 (5) = happyGoto action_10
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (50) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (29) = happyShift action_8
action_4 (34) = happyShift action_9
action_4 (5) = happyGoto action_7
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (17) = happyShift action_4
action_5 (37) = happyShift action_5
action_5 (4) = happyGoto action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (38) = happyShift action_15
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (18) = happyShift action_14
action_7 (35) = happyShift action_12
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (36) = happyShift action_13
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_4

action_10 (18) = happyShift action_11
action_10 (35) = happyShift action_12
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (29) = happyShift action_17
action_11 (6) = happyGoto action_22
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (29) = happyShift action_8
action_12 (34) = happyShift action_9
action_12 (5) = happyGoto action_21
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (26) = happyShift action_18
action_13 (27) = happyShift action_19
action_13 (28) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (29) = happyShift action_17
action_14 (6) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_3

action_16 (19) = happyShift action_23
action_16 _ = happyReduce_2

action_17 (35) = happyShift action_24
action_17 _ = happyReduce_9

action_18 _ = happyReduce_5

action_19 _ = happyReduce_6

action_20 _ = happyReduce_7

action_21 _ = happyReduce_8

action_22 (19) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (17) = happyShift action_4
action_23 (23) = happyShift action_28
action_23 (24) = happyShift action_29
action_23 (25) = happyShift action_30
action_23 (26) = happyShift action_31
action_23 (27) = happyShift action_32
action_23 (28) = happyShift action_33
action_23 (29) = happyShift action_34
action_23 (30) = happyShift action_35
action_23 (31) = happyShift action_36
action_23 (32) = happyShift action_37
action_23 (33) = happyShift action_38
action_23 (37) = happyShift action_39
action_23 (4) = happyGoto action_26
action_23 (7) = happyGoto action_27
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (29) = happyShift action_17
action_24 (6) = happyGoto action_25
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_10

action_26 (20) = happyShift action_56
action_26 (21) = happyShift action_57
action_26 (22) = happyShift action_58
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (35) = happyShift action_45
action_27 (40) = happyShift action_46
action_27 (41) = happyShift action_47
action_27 (42) = happyShift action_48
action_27 (43) = happyShift action_49
action_27 (44) = happyShift action_50
action_27 (45) = happyShift action_51
action_27 (46) = happyShift action_52
action_27 (47) = happyShift action_53
action_27 (48) = happyShift action_54
action_27 (49) = happyShift action_55
action_27 _ = happyReduce_1

action_28 (37) = happyShift action_44
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (37) = happyShift action_43
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_16

action_31 _ = happyReduce_17

action_32 _ = happyReduce_18

action_33 _ = happyReduce_19

action_34 (36) = happyShift action_42
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_20

action_36 _ = happyReduce_21

action_37 _ = happyReduce_22

action_38 _ = happyReduce_23

action_39 (17) = happyShift action_4
action_39 (23) = happyShift action_28
action_39 (24) = happyShift action_29
action_39 (25) = happyShift action_30
action_39 (26) = happyShift action_31
action_39 (27) = happyShift action_32
action_39 (28) = happyShift action_33
action_39 (29) = happyShift action_34
action_39 (30) = happyShift action_35
action_39 (31) = happyShift action_36
action_39 (32) = happyShift action_37
action_39 (33) = happyShift action_38
action_39 (37) = happyShift action_39
action_39 (4) = happyGoto action_40
action_39 (7) = happyGoto action_41
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (20) = happyShift action_56
action_40 (21) = happyShift action_57
action_40 (22) = happyShift action_58
action_40 (38) = happyShift action_15
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (35) = happyShift action_45
action_41 (38) = happyShift action_86
action_41 (40) = happyShift action_46
action_41 (41) = happyShift action_47
action_41 (42) = happyShift action_48
action_41 (43) = happyShift action_49
action_41 (44) = happyShift action_50
action_41 (45) = happyShift action_51
action_41 (46) = happyShift action_52
action_41 (47) = happyShift action_53
action_41 (48) = happyShift action_54
action_41 (49) = happyShift action_55
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (26) = happyShift action_83
action_42 (27) = happyShift action_84
action_42 (28) = happyShift action_85
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (17) = happyShift action_4
action_43 (37) = happyShift action_5
action_43 (4) = happyGoto action_82
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (17) = happyShift action_4
action_44 (37) = happyShift action_5
action_44 (4) = happyGoto action_81
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (17) = happyShift action_4
action_45 (23) = happyShift action_28
action_45 (24) = happyShift action_29
action_45 (25) = happyShift action_30
action_45 (26) = happyShift action_31
action_45 (27) = happyShift action_32
action_45 (28) = happyShift action_33
action_45 (29) = happyShift action_34
action_45 (30) = happyShift action_35
action_45 (31) = happyShift action_36
action_45 (32) = happyShift action_37
action_45 (33) = happyShift action_38
action_45 (37) = happyShift action_39
action_45 (4) = happyGoto action_26
action_45 (7) = happyGoto action_80
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (17) = happyShift action_4
action_46 (23) = happyShift action_28
action_46 (24) = happyShift action_29
action_46 (25) = happyShift action_30
action_46 (26) = happyShift action_31
action_46 (27) = happyShift action_32
action_46 (28) = happyShift action_33
action_46 (29) = happyShift action_34
action_46 (30) = happyShift action_35
action_46 (31) = happyShift action_36
action_46 (32) = happyShift action_37
action_46 (33) = happyShift action_38
action_46 (37) = happyShift action_39
action_46 (4) = happyGoto action_26
action_46 (7) = happyGoto action_79
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (17) = happyShift action_4
action_47 (23) = happyShift action_28
action_47 (24) = happyShift action_29
action_47 (25) = happyShift action_30
action_47 (26) = happyShift action_31
action_47 (27) = happyShift action_32
action_47 (28) = happyShift action_33
action_47 (29) = happyShift action_34
action_47 (30) = happyShift action_35
action_47 (31) = happyShift action_36
action_47 (32) = happyShift action_37
action_47 (33) = happyShift action_38
action_47 (37) = happyShift action_39
action_47 (4) = happyGoto action_26
action_47 (7) = happyGoto action_78
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (17) = happyShift action_4
action_48 (23) = happyShift action_28
action_48 (24) = happyShift action_29
action_48 (25) = happyShift action_30
action_48 (26) = happyShift action_31
action_48 (27) = happyShift action_32
action_48 (28) = happyShift action_33
action_48 (29) = happyShift action_34
action_48 (30) = happyShift action_35
action_48 (31) = happyShift action_36
action_48 (32) = happyShift action_37
action_48 (33) = happyShift action_38
action_48 (37) = happyShift action_39
action_48 (4) = happyGoto action_26
action_48 (7) = happyGoto action_77
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (17) = happyShift action_4
action_49 (23) = happyShift action_28
action_49 (24) = happyShift action_29
action_49 (25) = happyShift action_30
action_49 (26) = happyShift action_31
action_49 (27) = happyShift action_32
action_49 (28) = happyShift action_33
action_49 (29) = happyShift action_34
action_49 (30) = happyShift action_35
action_49 (31) = happyShift action_36
action_49 (32) = happyShift action_37
action_49 (33) = happyShift action_38
action_49 (37) = happyShift action_39
action_49 (4) = happyGoto action_26
action_49 (7) = happyGoto action_76
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (17) = happyShift action_4
action_50 (23) = happyShift action_28
action_50 (24) = happyShift action_29
action_50 (25) = happyShift action_30
action_50 (26) = happyShift action_31
action_50 (27) = happyShift action_32
action_50 (28) = happyShift action_33
action_50 (29) = happyShift action_34
action_50 (30) = happyShift action_35
action_50 (31) = happyShift action_36
action_50 (32) = happyShift action_37
action_50 (33) = happyShift action_38
action_50 (37) = happyShift action_39
action_50 (4) = happyGoto action_26
action_50 (7) = happyGoto action_75
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (17) = happyShift action_4
action_51 (23) = happyShift action_28
action_51 (24) = happyShift action_29
action_51 (25) = happyShift action_30
action_51 (26) = happyShift action_31
action_51 (27) = happyShift action_32
action_51 (28) = happyShift action_33
action_51 (29) = happyShift action_34
action_51 (30) = happyShift action_35
action_51 (31) = happyShift action_36
action_51 (32) = happyShift action_37
action_51 (33) = happyShift action_38
action_51 (37) = happyShift action_39
action_51 (4) = happyGoto action_26
action_51 (7) = happyGoto action_74
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_4
action_52 (23) = happyShift action_28
action_52 (24) = happyShift action_29
action_52 (25) = happyShift action_30
action_52 (26) = happyShift action_31
action_52 (27) = happyShift action_32
action_52 (28) = happyShift action_33
action_52 (29) = happyShift action_34
action_52 (30) = happyShift action_35
action_52 (31) = happyShift action_36
action_52 (32) = happyShift action_37
action_52 (33) = happyShift action_38
action_52 (37) = happyShift action_39
action_52 (4) = happyGoto action_26
action_52 (7) = happyGoto action_73
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (17) = happyShift action_4
action_53 (23) = happyShift action_28
action_53 (24) = happyShift action_29
action_53 (25) = happyShift action_30
action_53 (26) = happyShift action_31
action_53 (27) = happyShift action_32
action_53 (28) = happyShift action_33
action_53 (29) = happyShift action_34
action_53 (30) = happyShift action_35
action_53 (31) = happyShift action_36
action_53 (32) = happyShift action_37
action_53 (33) = happyShift action_38
action_53 (37) = happyShift action_39
action_53 (4) = happyGoto action_26
action_53 (7) = happyGoto action_72
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (17) = happyShift action_4
action_54 (23) = happyShift action_28
action_54 (24) = happyShift action_29
action_54 (25) = happyShift action_30
action_54 (26) = happyShift action_31
action_54 (27) = happyShift action_32
action_54 (28) = happyShift action_33
action_54 (29) = happyShift action_34
action_54 (30) = happyShift action_35
action_54 (31) = happyShift action_36
action_54 (32) = happyShift action_37
action_54 (33) = happyShift action_38
action_54 (37) = happyShift action_39
action_54 (4) = happyGoto action_26
action_54 (7) = happyGoto action_71
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (17) = happyShift action_4
action_55 (23) = happyShift action_28
action_55 (24) = happyShift action_29
action_55 (25) = happyShift action_30
action_55 (26) = happyShift action_31
action_55 (27) = happyShift action_32
action_55 (28) = happyShift action_33
action_55 (29) = happyShift action_34
action_55 (30) = happyShift action_35
action_55 (31) = happyShift action_36
action_55 (32) = happyShift action_37
action_55 (33) = happyShift action_38
action_55 (37) = happyShift action_39
action_55 (4) = happyGoto action_26
action_55 (7) = happyGoto action_70
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (17) = happyShift action_4
action_56 (37) = happyShift action_5
action_56 (4) = happyGoto action_69
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (17) = happyShift action_4
action_57 (37) = happyShift action_5
action_57 (4) = happyGoto action_68
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (9) = happyShift action_60
action_58 (10) = happyShift action_61
action_58 (11) = happyShift action_62
action_58 (12) = happyShift action_63
action_58 (13) = happyShift action_64
action_58 (14) = happyShift action_65
action_58 (15) = happyShift action_66
action_58 (16) = happyShift action_67
action_58 (8) = happyGoto action_59
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_13

action_60 _ = happyReduce_39

action_61 _ = happyReduce_40

action_62 _ = happyReduce_41

action_63 _ = happyReduce_42

action_64 _ = happyReduce_43

action_65 _ = happyReduce_44

action_66 _ = happyReduce_45

action_67 _ = happyReduce_46

action_68 _ = happyReduce_12

action_69 _ = happyReduce_11

action_70 _ = happyReduce_37

action_71 _ = happyReduce_36

action_72 _ = happyReduce_35

action_73 _ = happyReduce_34

action_74 (35) = happyShift action_45
action_74 (45) = happyFail []
action_74 (46) = happyShift action_52
action_74 (47) = happyShift action_53
action_74 (48) = happyShift action_54
action_74 (49) = happyShift action_55
action_74 _ = happyReduce_31

action_75 (35) = happyShift action_45
action_75 (44) = happyFail []
action_75 (45) = happyShift action_51
action_75 (46) = happyShift action_52
action_75 (47) = happyShift action_53
action_75 (48) = happyShift action_54
action_75 (49) = happyShift action_55
action_75 _ = happyReduce_32

action_76 (35) = happyShift action_45
action_76 (43) = happyFail []
action_76 (44) = happyShift action_50
action_76 (45) = happyShift action_51
action_76 (46) = happyShift action_52
action_76 (47) = happyShift action_53
action_76 (48) = happyShift action_54
action_76 (49) = happyShift action_55
action_76 _ = happyReduce_30

action_77 (35) = happyShift action_45
action_77 (42) = happyFail []
action_77 (43) = happyShift action_49
action_77 (44) = happyShift action_50
action_77 (45) = happyShift action_51
action_77 (46) = happyShift action_52
action_77 (47) = happyShift action_53
action_77 (48) = happyShift action_54
action_77 (49) = happyShift action_55
action_77 _ = happyReduce_29

action_78 (35) = happyShift action_45
action_78 (40) = happyShift action_46
action_78 (41) = happyFail []
action_78 (42) = happyShift action_48
action_78 (43) = happyShift action_49
action_78 (44) = happyShift action_50
action_78 (45) = happyShift action_51
action_78 (46) = happyShift action_52
action_78 (47) = happyShift action_53
action_78 (48) = happyShift action_54
action_78 (49) = happyShift action_55
action_78 _ = happyReduce_28

action_79 (35) = happyShift action_45
action_79 (40) = happyFail []
action_79 (42) = happyShift action_48
action_79 (43) = happyShift action_49
action_79 (44) = happyShift action_50
action_79 (45) = happyShift action_51
action_79 (46) = happyShift action_52
action_79 (47) = happyShift action_53
action_79 (48) = happyShift action_54
action_79 (49) = happyShift action_55
action_79 _ = happyReduce_27

action_80 (46) = happyShift action_52
action_80 (47) = happyShift action_53
action_80 (48) = happyShift action_54
action_80 (49) = happyShift action_55
action_80 _ = happyReduce_33

action_81 (35) = happyShift action_88
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (39) = happyShift action_87
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_24

action_84 _ = happyReduce_25

action_85 _ = happyReduce_26

action_86 _ = happyReduce_38

action_87 (17) = happyShift action_4
action_87 (37) = happyShift action_5
action_87 (4) = happyGoto action_90
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (17) = happyShift action_4
action_88 (37) = happyShift action_5
action_88 (4) = happyGoto action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (35) = happyShift action_92
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (38) = happyShift action_91
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_15

action_92 (17) = happyShift action_4
action_92 (37) = happyShift action_5
action_92 (4) = happyGoto action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (38) = happyShift action_94
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_14

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (SelectWithCond happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 4 4 happyReduction_2
happyReduction_2 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Select happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  4 happyReduction_3
happyReduction_3 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (happy_var_2
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn5
		 (Asterisks
	)

happyReduce_5 = happySpecReduce_3  5 happyReduction_5
happyReduction_5 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn5
		 (CallFromFileSub happy_var_1
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  5 happyReduction_6
happyReduction_6 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn5
		 (CallFromFilePred happy_var_1
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn5
		 (CallFromFileObj happy_var_1
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  5 happyReduction_8
happyReduction_8 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn6
		 (Name happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn6
		 (Names happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (And happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (Or happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn7
		 (TypeFinder happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 8 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 6 7 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Replace happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  7 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn7
		 (Triple
	)

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn7
		 (Subs
	)

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn7
		 (Preds
	)

happyReduce_19 = happySpecReduce_1  7 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn7
		 (Objs
	)

happyReduce_20 = happySpecReduce_1  7 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn7
		 (TmTrue
	)

happyReduce_21 = happySpecReduce_1  7 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn7
		 (TmFalse
	)

happyReduce_22 = happySpecReduce_1  7 happyReduction_22
happyReduction_22 (HappyTerminal (TokenIntLiteral _ happy_var_1))
	 =  HappyAbsSyn7
		 (Integer happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  7 happyReduction_23
happyReduction_23 (HappyTerminal (TokenStringLiteral _ happy_var_1))
	 =  HappyAbsSyn7
		 (Str happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  7 happyReduction_24
happyReduction_24 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn7
		 (CallFromFileSub happy_var_1
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  7 happyReduction_25
happyReduction_25 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn7
		 (CallFromFilePred happy_var_1
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  7 happyReduction_26
happyReduction_26 _
	_
	(HappyTerminal (TokenFilename _ happy_var_1))
	 =  HappyAbsSyn7
		 (CallFromFileObj happy_var_1
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  7 happyReduction_27
happyReduction_27 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  7 happyReduction_28
happyReduction_28 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Less happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  7 happyReduction_29
happyReduction_29 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  7 happyReduction_30
happyReduction_30 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (NotEqual happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  7 happyReduction_31
happyReduction_31 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (LessThanEqual happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  7 happyReduction_32
happyReduction_32 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (GreaterThanEqual happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  7 happyReduction_33
happyReduction_33 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Comma happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  7 happyReduction_34
happyReduction_34 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  7 happyReduction_35
happyReduction_35 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  7 happyReduction_36
happyReduction_36 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Div happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  7 happyReduction_37
happyReduction_37 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  7 happyReduction_38
happyReduction_38 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  8 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn8
		 (TyBool
	)

happyReduce_40 = happySpecReduce_1  8 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn8
		 (TyInt
	)

happyReduce_41 = happySpecReduce_1  8 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn8
		 (TyString
	)

happyReduce_42 = happySpecReduce_1  8 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn8
		 (TyTriple
	)

happyReduce_43 = happySpecReduce_1  8 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn8
		 (TySub
	)

happyReduce_44 = happySpecReduce_1  8 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn8
		 (TyPred
	)

happyReduce_45 = happySpecReduce_1  8 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn8
		 (TyObj
	)

happyReduce_46 = happySpecReduce_1  8 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn8
		 (TyFilename
	)

happyNewToken action sts stk [] =
	action 50 50 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTypeBool _ -> cont 9;
	TokenTypeInt _ -> cont 10;
	TokenTypeString _ -> cont 11;
	TokenTypeTriple _ -> cont 12;
	TokenTypeSub _ -> cont 13;
	TokenTypePred _ -> cont 14;
	TokenTypeObj _ -> cont 15;
	TokenTypeFile _ -> cont 16;
	TokenSelect _ -> cont 17;
	TokenFrom _ -> cont 18;
	TokenWhere _ -> cont 19;
	TokenAnd _ -> cont 20;
	TokenOr _ -> cont 21;
	TokenType _ -> cont 22;
	TokenIf _ -> cont 23;
	TokenReplace _ -> cont 24;
	TokenTriple _ -> cont 25;
	TokenSubs _ -> cont 26;
	TokenPreds _ -> cont 27;
	TokenObjs _ -> cont 28;
	TokenFilename _ happy_dollar_dollar -> cont 29;
	TokenTrue _ -> cont 30;
	TokenFalse _ -> cont 31;
	TokenIntLiteral _ happy_dollar_dollar -> cont 32;
	TokenStringLiteral _ happy_dollar_dollar -> cont 33;
	TokenAsterisks _ -> cont 34;
	TokenComma _ -> cont 35;
	TokenFullStop _ -> cont 36;
	TokenLeftBracket _ -> cont 37;
	TokenRightBracket _ -> cont 38;
	TokenArrow _ -> cont 39;
	TokenGreaterThan _ -> cont 40;
	TokenLessThan _ -> cont 41;
	TokenEqual _ -> cont 42;
	TokenNotEqual _ -> cont 43;
	TokenGreaterOrEqual _ -> cont 44;
	TokenLessOrEqual _ -> cont 45;
	TokenPlusSign _ -> cont 46;
	TokenMinusSign _ -> cont 47;
	TokenDivSign _ -> cont 48;
	TokenMultSign _ -> cont 49;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 50 tk tks = happyError' (tks, explist)
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

data Type = TyBool | TyInt | TyString | TyTriple | TySub | TyPred
            | TyObj | TyFilename
            deriving (Show, Eq)
        
type Environment = [ (String,Expr) ]

data Expr = SelectWithCond Expr FileList Expr | Select Expr FileList 
            deriving (Show, Eq)

data FileList = Name String | Names String FileList
              deriving (Show, Eq)

data Comparators = And Expr Expr | Or Expr Expr 
            | TypeFinder Expr Type | If Expr Expr Expr | Replace Expr Expr 
            | Triple | Subs | Preds | Objs
            | TmTrue | TmFalse | Integer Int | Str String 
            | Greater Expr Expr
            | Less Expr Expr | Equal Expr Expr | NotEqual Expr Expr 
            | LessThanEqual Expr Expr | GreaterThanEqual Expr Expr | Comma Expr Expr 
            | Plus Expr Expr | Minus Expr Expr | Div Expr Expr | Mult Expr Expr
            deriving (Show, Eq)

data Selectors = Asterisks | CallFromFileSub String | CallFromFilePred String
               | CallFromFileObj String
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
