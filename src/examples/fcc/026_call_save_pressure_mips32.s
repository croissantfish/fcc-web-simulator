        .data
_nl:    .asciiz "\n"
_str0:    .asciiz "P "
_str1:    .asciiz "M0 "
_str2:    .asciiz "M1 "
_str3:    .asciiz "S "

        .text
        .globl main

func_leaf:
        addiu $sp, $sp, -80
        sw    $ra, 76($sp)
        sw    $fp, 72($sp)
        addiu $fp, $sp, 80
        sw    $a0, -80($fp)
        sw    $a1, -76($fp)
        sw    $a2, -72($fp)
_entry_0:
        addiu $t0, $fp, -80
        sw    $t0, -68($fp)
        lw    $t0, -68($fp)
        lw    $t0, 0($t0)
        sw    $t0, -64($fp)
        lw    $t0, -64($fp)
        li    $t1, 3
        mul   $t0, $t0, $t1
        sw    $t0, -60($fp)
        addiu $t0, $fp, -76
        sw    $t0, -56($fp)
        lw    $t0, -56($fp)
        lw    $t0, 0($t0)
        sw    $t0, -52($fp)
        lw    $t0, -52($fp)
        li    $t1, 5
        mul   $t0, $t0, $t1
        sw    $t0, -48($fp)
        lw    $t0, -60($fp)
        lw    $t1, -48($fp)
        sub   $t0, $t0, $t1
        sw    $t0, -44($fp)
        addiu $t0, $fp, -72
        sw    $t0, -40($fp)
        lw    $t0, -40($fp)
        lw    $t0, 0($t0)
        sw    $t0, -36($fp)
        lw    $t0, -36($fp)
        li    $t1, 7
        mul   $t0, $t0, $t1
        sw    $t0, -32($fp)
        lw    $t0, -44($fp)
        lw    $t1, -32($fp)
        add   $t0, $t0, $t1
        sw    $t0, -28($fp)
        lw    $t0, -28($fp)
        li    $t1, 11
        add   $t0, $t0, $t1
        sw    $t0, -24($fp)
        lw    $v0, -24($fp)
        lw    $ra, -4($fp)
        lw    $fp, -8($fp)
        addiu $sp, $sp, 80
        jr    $ra
func_combine:
        addiu $sp, $sp, -176
        sw    $ra, 172($sp)
        sw    $fp, 168($sp)
        addiu $fp, $sp, 176
        sw    $a0, -176($fp)
        sw    $a1, -172($fp)
        sw    $a2, -168($fp)
        sw    $a3, -164($fp)
        lw    $t0, 0($fp)
        sw    $t0, -160($fp)
        lw    $t0, 4($fp)
        sw    $t0, -156($fp)
_entry_1:
        addiu $t0, $fp, -176
        sw    $t0, -152($fp)
        lw    $t0, -152($fp)
        lw    $t0, 0($t0)
        sw    $t0, -148($fp)
        addiu $t0, $fp, -172
        sw    $t0, -144($fp)
        lw    $t0, -144($fp)
        lw    $t0, 0($t0)
        sw    $t0, -140($fp)
        addiu $t0, $fp, -168
        sw    $t0, -136($fp)
        lw    $t0, -136($fp)
        lw    $t0, 0($t0)
        sw    $t0, -132($fp)
        lw    $a0, -148($fp)
        lw    $a1, -140($fp)
        lw    $a2, -132($fp)
        jal   func_leaf
        sw    $v0, -128($fp)
        addiu $t0, $fp, -164
        sw    $t0, -124($fp)
        lw    $t0, -124($fp)
        lw    $t0, 0($t0)
        sw    $t0, -120($fp)
        addiu $t0, $fp, -160
        sw    $t0, -116($fp)
        lw    $t0, -116($fp)
        lw    $t0, 0($t0)
        sw    $t0, -112($fp)
        addiu $t0, $fp, -156
        sw    $t0, -108($fp)
        lw    $t0, -108($fp)
        lw    $t0, 0($t0)
        sw    $t0, -104($fp)
        lw    $a0, -120($fp)
        lw    $a1, -112($fp)
        lw    $a2, -104($fp)
        jal   func_leaf
        sw    $v0, -100($fp)
        li    $t0, 2
        lw    $t1, -100($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -96($fp)
        lw    $t0, -128($fp)
        lw    $t1, -96($fp)
        add   $t0, $t0, $t1
        sw    $t0, -92($fp)
        addiu $t0, $fp, -176
        sw    $t0, -88($fp)
        lw    $t0, -88($fp)
        lw    $t0, 0($t0)
        sw    $t0, -84($fp)
        addiu $t0, $fp, -168
        sw    $t0, -80($fp)
        lw    $t0, -80($fp)
        lw    $t0, 0($t0)
        sw    $t0, -76($fp)
        lw    $t0, -84($fp)
        lw    $t1, -76($fp)
        add   $t0, $t0, $t1
        sw    $t0, -72($fp)
        addiu $t0, $fp, -172
        sw    $t0, -68($fp)
        lw    $t0, -68($fp)
        lw    $t0, 0($t0)
        sw    $t0, -64($fp)
        addiu $t0, $fp, -164
        sw    $t0, -60($fp)
        lw    $t0, -60($fp)
        lw    $t0, 0($t0)
        sw    $t0, -56($fp)
        lw    $t0, -64($fp)
        lw    $t1, -56($fp)
        add   $t0, $t0, $t1
        sw    $t0, -52($fp)
        addiu $t0, $fp, -160
        sw    $t0, -48($fp)
        lw    $t0, -48($fp)
        lw    $t0, 0($t0)
        sw    $t0, -44($fp)
        addiu $t0, $fp, -156
        sw    $t0, -40($fp)
        lw    $t0, -40($fp)
        lw    $t0, 0($t0)
        sw    $t0, -36($fp)
        lw    $t0, -44($fp)
        lw    $t1, -36($fp)
        add   $t0, $t0, $t1
        sw    $t0, -32($fp)
        lw    $a0, -72($fp)
        lw    $a1, -52($fp)
        lw    $a2, -32($fp)
        jal   func_leaf
        sw    $v0, -28($fp)
        lw    $t0, -92($fp)
        lw    $t1, -28($fp)
        sub   $t0, $t0, $t1
        sw    $t0, -24($fp)
        lw    $v0, -24($fp)
        lw    $ra, -4($fp)
        lw    $fp, -8($fp)
        addiu $sp, $sp, 176
        jr    $ra
func_pressure:
        addiu $sp, $sp, -1120
        sw    $ra, 1116($sp)
        sw    $fp, 1112($sp)
        addiu $fp, $sp, 1120
        sw    $a0, -1112($fp)
        sw    $a1, -1108($fp)
_entry_2:
        addiu $t0, $fp, -1108
        sw    $t0, -1036($fp)
        lw    $t0, -1036($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1032($fp)
        lw    $t0, -1032($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, -1028($fp)
        addiu $t0, $fp, -1104
        sw    $t0, -1024($fp)
        lw    $t2, -1024($fp)
        lw    $t0, -1028($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -1020($fp)
        lw    $t0, -1020($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1016($fp)
        lw    $t0, -1016($fp)
        li    $t1, 2
        add   $t0, $t0, $t1
        sw    $t0, -1012($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -1008($fp)
        lw    $t0, -1008($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1004($fp)
        lw    $t0, -1012($fp)
        lw    $t1, -1004($fp)
        add   $t0, $t0, $t1
        sw    $t0, -1000($fp)
        addiu $t0, $fp, -1100
        sw    $t0, -996($fp)
        lw    $t2, -996($fp)
        lw    $t0, -1000($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -992($fp)
        lw    $t0, -992($fp)
        lw    $t0, 0($t0)
        sw    $t0, -988($fp)
        lw    $t0, -988($fp)
        li    $t1, 3
        add   $t0, $t0, $t1
        sw    $t0, -984($fp)
        addiu $t0, $fp, -1096
        sw    $t0, -980($fp)
        lw    $t2, -980($fp)
        lw    $t0, -984($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -976($fp)
        lw    $t0, -976($fp)
        lw    $t0, 0($t0)
        sw    $t0, -972($fp)
        lw    $t0, -972($fp)
        li    $t1, 4
        add   $t0, $t0, $t1
        sw    $t0, -968($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -964($fp)
        lw    $t0, -964($fp)
        lw    $t0, 0($t0)
        sw    $t0, -960($fp)
        lw    $t0, -968($fp)
        lw    $t1, -960($fp)
        add   $t0, $t0, $t1
        sw    $t0, -956($fp)
        addiu $t0, $fp, -1092
        sw    $t0, -952($fp)
        lw    $t2, -952($fp)
        lw    $t0, -956($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -948($fp)
        lw    $t0, -948($fp)
        lw    $t0, 0($t0)
        sw    $t0, -944($fp)
        lw    $t0, -944($fp)
        li    $t1, 5
        add   $t0, $t0, $t1
        sw    $t0, -940($fp)
        addiu $t0, $fp, -1088
        sw    $t0, -936($fp)
        lw    $t2, -936($fp)
        lw    $t0, -940($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -932($fp)
        lw    $t0, -932($fp)
        lw    $t0, 0($t0)
        sw    $t0, -928($fp)
        lw    $t0, -928($fp)
        li    $t1, 6
        add   $t0, $t0, $t1
        sw    $t0, -924($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -920($fp)
        lw    $t0, -920($fp)
        lw    $t0, 0($t0)
        sw    $t0, -916($fp)
        lw    $t0, -924($fp)
        lw    $t1, -916($fp)
        add   $t0, $t0, $t1
        sw    $t0, -912($fp)
        addiu $t0, $fp, -1084
        sw    $t0, -908($fp)
        lw    $t2, -908($fp)
        lw    $t0, -912($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -904($fp)
        lw    $t0, -904($fp)
        lw    $t0, 0($t0)
        sw    $t0, -900($fp)
        lw    $t0, -900($fp)
        li    $t1, 7
        add   $t0, $t0, $t1
        sw    $t0, -896($fp)
        addiu $t0, $fp, -1080
        sw    $t0, -892($fp)
        lw    $t2, -892($fp)
        lw    $t0, -896($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -888($fp)
        lw    $t0, -888($fp)
        lw    $t0, 0($t0)
        sw    $t0, -884($fp)
        lw    $t0, -884($fp)
        li    $t1, 8
        add   $t0, $t0, $t1
        sw    $t0, -880($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -876($fp)
        lw    $t0, -876($fp)
        lw    $t0, 0($t0)
        sw    $t0, -872($fp)
        lw    $t0, -880($fp)
        lw    $t1, -872($fp)
        add   $t0, $t0, $t1
        sw    $t0, -868($fp)
        addiu $t0, $fp, -1076
        sw    $t0, -864($fp)
        lw    $t2, -864($fp)
        lw    $t0, -868($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -860($fp)
        lw    $t0, -860($fp)
        lw    $t0, 0($t0)
        sw    $t0, -856($fp)
        lw    $t0, -856($fp)
        li    $t1, 9
        add   $t0, $t0, $t1
        sw    $t0, -852($fp)
        addiu $t0, $fp, -1072
        sw    $t0, -848($fp)
        lw    $t2, -848($fp)
        lw    $t0, -852($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -844($fp)
        lw    $t0, -844($fp)
        lw    $t0, 0($t0)
        sw    $t0, -840($fp)
        lw    $t0, -840($fp)
        li    $t1, 10
        add   $t0, $t0, $t1
        sw    $t0, -836($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -832($fp)
        lw    $t0, -832($fp)
        lw    $t0, 0($t0)
        sw    $t0, -828($fp)
        lw    $t0, -836($fp)
        lw    $t1, -828($fp)
        add   $t0, $t0, $t1
        sw    $t0, -824($fp)
        addiu $t0, $fp, -1068
        sw    $t0, -820($fp)
        lw    $t2, -820($fp)
        lw    $t0, -824($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -816($fp)
        lw    $t0, -816($fp)
        lw    $t0, 0($t0)
        sw    $t0, -812($fp)
        lw    $t0, -812($fp)
        li    $t1, 11
        add   $t0, $t0, $t1
        sw    $t0, -808($fp)
        addiu $t0, $fp, -1064
        sw    $t0, -804($fp)
        lw    $t2, -804($fp)
        lw    $t0, -808($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1108
        sw    $t0, -800($fp)
        lw    $t0, -800($fp)
        lw    $t0, 0($t0)
        sw    $t0, -796($fp)
        lw    $t0, -796($fp)
        li    $t1, 12
        add   $t0, $t0, $t1
        sw    $t0, -792($fp)
        addiu $t0, $fp, -1112
        sw    $t0, -788($fp)
        lw    $t0, -788($fp)
        lw    $t0, 0($t0)
        sw    $t0, -784($fp)
        lw    $t0, -792($fp)
        lw    $t1, -784($fp)
        add   $t0, $t0, $t1
        sw    $t0, -780($fp)
        addiu $t0, $fp, -1060
        sw    $t0, -776($fp)
        lw    $t2, -776($fp)
        lw    $t0, -780($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1104
        sw    $t0, -772($fp)
        lw    $t0, -772($fp)
        lw    $t0, 0($t0)
        sw    $t0, -768($fp)
        addiu $t0, $fp, -1100
        sw    $t0, -764($fp)
        lw    $t0, -764($fp)
        lw    $t0, 0($t0)
        sw    $t0, -760($fp)
        li    $t0, 2
        lw    $t1, -760($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -756($fp)
        lw    $t0, -768($fp)
        lw    $t1, -756($fp)
        add   $t0, $t0, $t1
        sw    $t0, -752($fp)
        addiu $t0, $fp, -1096
        sw    $t0, -748($fp)
        lw    $t0, -748($fp)
        lw    $t0, 0($t0)
        sw    $t0, -744($fp)
        li    $t0, 3
        lw    $t1, -744($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -740($fp)
        lw    $t0, -752($fp)
        lw    $t1, -740($fp)
        add   $t0, $t0, $t1
        sw    $t0, -736($fp)
        addiu $t0, $fp, -1092
        sw    $t0, -732($fp)
        lw    $t0, -732($fp)
        lw    $t0, 0($t0)
        sw    $t0, -728($fp)
        li    $t0, 4
        lw    $t1, -728($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -724($fp)
        lw    $t0, -736($fp)
        lw    $t1, -724($fp)
        add   $t0, $t0, $t1
        sw    $t0, -720($fp)
        addiu $t0, $fp, -1088
        sw    $t0, -716($fp)
        lw    $t0, -716($fp)
        lw    $t0, 0($t0)
        sw    $t0, -712($fp)
        li    $t0, 5
        lw    $t1, -712($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -708($fp)
        lw    $t0, -720($fp)
        lw    $t1, -708($fp)
        add   $t0, $t0, $t1
        sw    $t0, -704($fp)
        addiu $t0, $fp, -1084
        sw    $t0, -700($fp)
        lw    $t0, -700($fp)
        lw    $t0, 0($t0)
        sw    $t0, -696($fp)
        li    $t0, 6
        lw    $t1, -696($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -692($fp)
        lw    $t0, -704($fp)
        lw    $t1, -692($fp)
        add   $t0, $t0, $t1
        sw    $t0, -688($fp)
        addiu $t0, $fp, -1080
        sw    $t0, -684($fp)
        lw    $t0, -684($fp)
        lw    $t0, 0($t0)
        sw    $t0, -680($fp)
        li    $t0, 7
        lw    $t1, -680($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -676($fp)
        lw    $t0, -688($fp)
        lw    $t1, -676($fp)
        add   $t0, $t0, $t1
        sw    $t0, -672($fp)
        addiu $t0, $fp, -1076
        sw    $t0, -668($fp)
        lw    $t0, -668($fp)
        lw    $t0, 0($t0)
        sw    $t0, -664($fp)
        li    $t0, 8
        lw    $t1, -664($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -660($fp)
        lw    $t0, -672($fp)
        lw    $t1, -660($fp)
        add   $t0, $t0, $t1
        sw    $t0, -656($fp)
        addiu $t0, $fp, -1072
        sw    $t0, -652($fp)
        lw    $t0, -652($fp)
        lw    $t0, 0($t0)
        sw    $t0, -648($fp)
        li    $t0, 9
        lw    $t1, -648($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -644($fp)
        lw    $t0, -656($fp)
        lw    $t1, -644($fp)
        add   $t0, $t0, $t1
        sw    $t0, -640($fp)
        addiu $t0, $fp, -1068
        sw    $t0, -636($fp)
        lw    $t0, -636($fp)
        lw    $t0, 0($t0)
        sw    $t0, -632($fp)
        li    $t0, 10
        lw    $t1, -632($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -628($fp)
        lw    $t0, -640($fp)
        lw    $t1, -628($fp)
        add   $t0, $t0, $t1
        sw    $t0, -624($fp)
        addiu $t0, $fp, -1064
        sw    $t0, -620($fp)
        lw    $t0, -620($fp)
        lw    $t0, 0($t0)
        sw    $t0, -616($fp)
        li    $t0, 11
        lw    $t1, -616($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -612($fp)
        lw    $t0, -624($fp)
        lw    $t1, -612($fp)
        add   $t0, $t0, $t1
        sw    $t0, -608($fp)
        addiu $t0, $fp, -1060
        sw    $t0, -604($fp)
        lw    $t0, -604($fp)
        lw    $t0, 0($t0)
        sw    $t0, -600($fp)
        li    $t0, 12
        lw    $t1, -600($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -596($fp)
        lw    $t0, -608($fp)
        lw    $t1, -596($fp)
        add   $t0, $t0, $t1
        sw    $t0, -592($fp)
        addiu $t0, $fp, -1056
        sw    $t0, -588($fp)
        lw    $t2, -588($fp)
        lw    $t0, -592($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1052
        sw    $t0, -584($fp)
        lw    $t2, -584($fp)
        li    $t0, 0
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1048
        sw    $t0, -580($fp)
        lw    $t2, -580($fp)
        li    $t0, 0
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1044
        sw    $t0, -576($fp)
        lw    $t2, -576($fp)
        li    $t0, 0
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1112
        sw    $t0, -572($fp)
        lw    $t0, -572($fp)
        lw    $t0, 0($t0)
        sw    $t0, -568($fp)
        lw    $t0, -568($fp)
        li    $t1, 0
        seq   $t0, $t0, $t1
        sw    $t0, -564($fp)
        lw    $t0, -564($fp)
        beqz  $t0, _if_else_4
        j     _if_then_3
_if_then_3:
        addiu $t0, $fp, -1104
        sw    $t0, -560($fp)
        lw    $t0, -560($fp)
        lw    $t0, 0($t0)
        sw    $t0, -556($fp)
        addiu $t0, $fp, -1100
        sw    $t0, -552($fp)
        lw    $t0, -552($fp)
        lw    $t0, 0($t0)
        sw    $t0, -548($fp)
        addiu $t0, $fp, -1096
        sw    $t0, -544($fp)
        lw    $t0, -544($fp)
        lw    $t0, 0($t0)
        sw    $t0, -540($fp)
        addiu $t0, $fp, -1092
        sw    $t0, -536($fp)
        lw    $t0, -536($fp)
        lw    $t0, 0($t0)
        sw    $t0, -532($fp)
        addiu $t0, $fp, -1088
        sw    $t0, -528($fp)
        lw    $t0, -528($fp)
        lw    $t0, 0($t0)
        sw    $t0, -524($fp)
        addiu $t0, $fp, -1084
        sw    $t0, -520($fp)
        lw    $t0, -520($fp)
        lw    $t0, 0($t0)
        sw    $t0, -516($fp)
        lw    $t0, -524($fp)
        sw    $t0, 0($sp)
        lw    $t0, -516($fp)
        sw    $t0, 4($sp)
        lw    $a0, -556($fp)
        lw    $a1, -548($fp)
        lw    $a2, -540($fp)
        lw    $a3, -532($fp)
        jal   func_combine
        sw    $v0, -512($fp)
        addiu $t0, $fp, -1080
        sw    $t0, -508($fp)
        lw    $t0, -508($fp)
        lw    $t0, 0($t0)
        sw    $t0, -504($fp)
        addiu $t0, $fp, -1076
        sw    $t0, -500($fp)
        lw    $t0, -500($fp)
        lw    $t0, 0($t0)
        sw    $t0, -496($fp)
        addiu $t0, $fp, -1072
        sw    $t0, -492($fp)
        lw    $t0, -492($fp)
        lw    $t0, 0($t0)
        sw    $t0, -488($fp)
        addiu $t0, $fp, -1068
        sw    $t0, -484($fp)
        lw    $t0, -484($fp)
        lw    $t0, 0($t0)
        sw    $t0, -480($fp)
        addiu $t0, $fp, -1064
        sw    $t0, -476($fp)
        lw    $t0, -476($fp)
        lw    $t0, 0($t0)
        sw    $t0, -472($fp)
        addiu $t0, $fp, -1060
        sw    $t0, -468($fp)
        lw    $t0, -468($fp)
        lw    $t0, 0($t0)
        sw    $t0, -464($fp)
        lw    $t0, -472($fp)
        sw    $t0, 0($sp)
        lw    $t0, -464($fp)
        sw    $t0, 4($sp)
        lw    $a0, -504($fp)
        lw    $a1, -496($fp)
        lw    $a2, -488($fp)
        lw    $a3, -480($fp)
        jal   func_combine
        sw    $v0, -460($fp)
        lw    $t0, -512($fp)
        lw    $t1, -460($fp)
        add   $t0, $t0, $t1
        sw    $t0, -456($fp)
        addiu $t0, $fp, -1044
        sw    $t0, -452($fp)
        lw    $t2, -452($fp)
        lw    $t0, -456($fp)
        sw    $t0, 0($t2)
        j     _if_end_5
_if_else_4:
        addiu $t0, $fp, -1112
        sw    $t0, -448($fp)
        lw    $t0, -448($fp)
        lw    $t0, 0($t0)
        sw    $t0, -444($fp)
        lw    $t0, -444($fp)
        li    $t1, 1
        sub   $t0, $t0, $t1
        sw    $t0, -440($fp)
        addiu $t0, $fp, -1108
        sw    $t0, -436($fp)
        lw    $t0, -436($fp)
        lw    $t0, 0($t0)
        sw    $t0, -432($fp)
        lw    $t0, -432($fp)
        li    $t1, 2
        add   $t0, $t0, $t1
        sw    $t0, -428($fp)
        lw    $a0, -440($fp)
        lw    $a1, -428($fp)
        jal   func_pressure
        sw    $v0, -424($fp)
        addiu $t0, $fp, -1052
        sw    $t0, -420($fp)
        lw    $t2, -420($fp)
        lw    $t0, -424($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1104
        sw    $t0, -416($fp)
        lw    $t0, -416($fp)
        lw    $t0, 0($t0)
        sw    $t0, -412($fp)
        addiu $t0, $fp, -1100
        sw    $t0, -408($fp)
        lw    $t0, -408($fp)
        lw    $t0, 0($t0)
        sw    $t0, -404($fp)
        addiu $t0, $fp, -1096
        sw    $t0, -400($fp)
        lw    $t0, -400($fp)
        lw    $t0, 0($t0)
        sw    $t0, -396($fp)
        lw    $a0, -412($fp)
        lw    $a1, -404($fp)
        lw    $a2, -396($fp)
        jal   func_leaf
        sw    $v0, -392($fp)
        addiu $t0, $fp, -1092
        sw    $t0, -388($fp)
        lw    $t0, -388($fp)
        lw    $t0, 0($t0)
        sw    $t0, -384($fp)
        addiu $t0, $fp, -1088
        sw    $t0, -380($fp)
        lw    $t0, -380($fp)
        lw    $t0, 0($t0)
        sw    $t0, -376($fp)
        addiu $t0, $fp, -1084
        sw    $t0, -372($fp)
        lw    $t0, -372($fp)
        lw    $t0, 0($t0)
        sw    $t0, -368($fp)
        lw    $a0, -384($fp)
        lw    $a1, -376($fp)
        lw    $a2, -368($fp)
        jal   func_leaf
        sw    $v0, -364($fp)
        addiu $t0, $fp, -1080
        sw    $t0, -360($fp)
        lw    $t0, -360($fp)
        lw    $t0, 0($t0)
        sw    $t0, -356($fp)
        addiu $t0, $fp, -1076
        sw    $t0, -352($fp)
        lw    $t0, -352($fp)
        lw    $t0, 0($t0)
        sw    $t0, -348($fp)
        addiu $t0, $fp, -1072
        sw    $t0, -344($fp)
        lw    $t0, -344($fp)
        lw    $t0, 0($t0)
        sw    $t0, -340($fp)
        lw    $a0, -356($fp)
        lw    $a1, -348($fp)
        lw    $a2, -340($fp)
        jal   func_leaf
        sw    $v0, -336($fp)
        addiu $t0, $fp, -1068
        sw    $t0, -332($fp)
        lw    $t0, -332($fp)
        lw    $t0, 0($t0)
        sw    $t0, -328($fp)
        addiu $t0, $fp, -1064
        sw    $t0, -324($fp)
        lw    $t0, -324($fp)
        lw    $t0, 0($t0)
        sw    $t0, -320($fp)
        addiu $t0, $fp, -1060
        sw    $t0, -316($fp)
        lw    $t0, -316($fp)
        lw    $t0, 0($t0)
        sw    $t0, -312($fp)
        lw    $t0, -320($fp)
        sw    $t0, 0($sp)
        lw    $t0, -312($fp)
        sw    $t0, 4($sp)
        lw    $a0, -392($fp)
        lw    $a1, -364($fp)
        lw    $a2, -336($fp)
        lw    $a3, -328($fp)
        jal   func_combine
        sw    $v0, -308($fp)
        addiu $t0, $fp, -1048
        sw    $t0, -304($fp)
        lw    $t2, -304($fp)
        lw    $t0, -308($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1056
        sw    $t0, -300($fp)
        lw    $t0, -300($fp)
        lw    $t0, 0($t0)
        sw    $t0, -296($fp)
        addiu $t0, $fp, -1052
        sw    $t0, -292($fp)
        lw    $t0, -292($fp)
        lw    $t0, 0($t0)
        sw    $t0, -288($fp)
        lw    $t0, -296($fp)
        lw    $t1, -288($fp)
        add   $t0, $t0, $t1
        sw    $t0, -284($fp)
        addiu $t0, $fp, -1048
        sw    $t0, -280($fp)
        lw    $t0, -280($fp)
        lw    $t0, 0($t0)
        sw    $t0, -276($fp)
        lw    $t0, -284($fp)
        lw    $t1, -276($fp)
        add   $t0, $t0, $t1
        sw    $t0, -272($fp)
        addiu $t0, $fp, -1044
        sw    $t0, -268($fp)
        lw    $t2, -268($fp)
        lw    $t0, -272($fp)
        sw    $t0, 0($t2)
        j     _if_end_5
_if_end_5:
        addiu $t0, $fp, -1060
        sw    $t0, -264($fp)
        lw    $t0, -264($fp)
        lw    $t0, 0($t0)
        sw    $t0, -260($fp)
        addiu $t0, $fp, -1064
        sw    $t0, -256($fp)
        lw    $t0, -256($fp)
        lw    $t0, 0($t0)
        sw    $t0, -252($fp)
        li    $t0, 2
        lw    $t1, -252($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -248($fp)
        lw    $t0, -260($fp)
        lw    $t1, -248($fp)
        add   $t0, $t0, $t1
        sw    $t0, -244($fp)
        addiu $t0, $fp, -1068
        sw    $t0, -240($fp)
        lw    $t0, -240($fp)
        lw    $t0, 0($t0)
        sw    $t0, -236($fp)
        li    $t0, 3
        lw    $t1, -236($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -232($fp)
        lw    $t0, -244($fp)
        lw    $t1, -232($fp)
        add   $t0, $t0, $t1
        sw    $t0, -228($fp)
        addiu $t0, $fp, -1072
        sw    $t0, -224($fp)
        lw    $t0, -224($fp)
        lw    $t0, 0($t0)
        sw    $t0, -220($fp)
        li    $t0, 4
        lw    $t1, -220($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -216($fp)
        lw    $t0, -228($fp)
        lw    $t1, -216($fp)
        add   $t0, $t0, $t1
        sw    $t0, -212($fp)
        addiu $t0, $fp, -1076
        sw    $t0, -208($fp)
        lw    $t0, -208($fp)
        lw    $t0, 0($t0)
        sw    $t0, -204($fp)
        li    $t0, 5
        lw    $t1, -204($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -200($fp)
        lw    $t0, -212($fp)
        lw    $t1, -200($fp)
        add   $t0, $t0, $t1
        sw    $t0, -196($fp)
        addiu $t0, $fp, -1080
        sw    $t0, -192($fp)
        lw    $t0, -192($fp)
        lw    $t0, 0($t0)
        sw    $t0, -188($fp)
        li    $t0, 6
        lw    $t1, -188($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -184($fp)
        lw    $t0, -196($fp)
        lw    $t1, -184($fp)
        add   $t0, $t0, $t1
        sw    $t0, -180($fp)
        addiu $t0, $fp, -1084
        sw    $t0, -176($fp)
        lw    $t0, -176($fp)
        lw    $t0, 0($t0)
        sw    $t0, -172($fp)
        li    $t0, 7
        lw    $t1, -172($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -168($fp)
        lw    $t0, -180($fp)
        lw    $t1, -168($fp)
        add   $t0, $t0, $t1
        sw    $t0, -164($fp)
        addiu $t0, $fp, -1088
        sw    $t0, -160($fp)
        lw    $t0, -160($fp)
        lw    $t0, 0($t0)
        sw    $t0, -156($fp)
        li    $t0, 8
        lw    $t1, -156($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -152($fp)
        lw    $t0, -164($fp)
        lw    $t1, -152($fp)
        add   $t0, $t0, $t1
        sw    $t0, -148($fp)
        addiu $t0, $fp, -1092
        sw    $t0, -144($fp)
        lw    $t0, -144($fp)
        lw    $t0, 0($t0)
        sw    $t0, -140($fp)
        li    $t0, 9
        lw    $t1, -140($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -136($fp)
        lw    $t0, -148($fp)
        lw    $t1, -136($fp)
        add   $t0, $t0, $t1
        sw    $t0, -132($fp)
        addiu $t0, $fp, -1096
        sw    $t0, -128($fp)
        lw    $t0, -128($fp)
        lw    $t0, 0($t0)
        sw    $t0, -124($fp)
        li    $t0, 10
        lw    $t1, -124($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -120($fp)
        lw    $t0, -132($fp)
        lw    $t1, -120($fp)
        add   $t0, $t0, $t1
        sw    $t0, -116($fp)
        addiu $t0, $fp, -1100
        sw    $t0, -112($fp)
        lw    $t0, -112($fp)
        lw    $t0, 0($t0)
        sw    $t0, -108($fp)
        li    $t0, 11
        lw    $t1, -108($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -104($fp)
        lw    $t0, -116($fp)
        lw    $t1, -104($fp)
        add   $t0, $t0, $t1
        sw    $t0, -100($fp)
        addiu $t0, $fp, -1104
        sw    $t0, -96($fp)
        lw    $t0, -96($fp)
        lw    $t0, 0($t0)
        sw    $t0, -92($fp)
        li    $t0, 12
        lw    $t1, -92($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -88($fp)
        lw    $t0, -100($fp)
        lw    $t1, -88($fp)
        add   $t0, $t0, $t1
        sw    $t0, -84($fp)
        addiu $t0, $fp, -1040
        sw    $t0, -80($fp)
        lw    $t2, -80($fp)
        lw    $t0, -84($fp)
        sw    $t0, 0($t2)
        la    $a0, _str0
        jal   putstr
        addiu $t0, $fp, -1112
        sw    $t0, -76($fp)
        lw    $t0, -76($fp)
        lw    $t0, 0($t0)
        sw    $t0, -72($fp)
        lw    $a0, -72($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1108
        sw    $t0, -68($fp)
        lw    $t0, -68($fp)
        lw    $t0, 0($t0)
        sw    $t0, -64($fp)
        lw    $a0, -64($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1056
        sw    $t0, -60($fp)
        lw    $t0, -60($fp)
        lw    $t0, 0($t0)
        sw    $t0, -56($fp)
        lw    $a0, -56($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1040
        sw    $t0, -52($fp)
        lw    $t0, -52($fp)
        lw    $t0, 0($t0)
        sw    $t0, -48($fp)
        lw    $a0, -48($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1052
        sw    $t0, -44($fp)
        lw    $t0, -44($fp)
        lw    $t0, 0($t0)
        sw    $t0, -40($fp)
        lw    $a0, -40($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1048
        sw    $t0, -36($fp)
        lw    $t0, -36($fp)
        lw    $t0, 0($t0)
        sw    $t0, -32($fp)
        lw    $a0, -32($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1044
        sw    $t0, -28($fp)
        lw    $t0, -28($fp)
        lw    $t0, 0($t0)
        sw    $t0, -24($fp)
        lw    $a0, -24($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        addiu $t0, $fp, -1044
        sw    $t0, -20($fp)
        lw    $t0, -20($fp)
        lw    $t0, 0($t0)
        sw    $t0, -16($fp)
        lw    $v0, -16($fp)
        lw    $ra, -4($fp)
        lw    $fp, -8($fp)
        addiu $sp, $sp, 1120
        jr    $ra
main:
        addiu $sp, $sp, -1376
        sw    $ra, 1372($sp)
        sw    $fp, 1368($sp)
        addiu $fp, $sp, 1376
_entry_6:
        jal   getint
        sw    $v0, -1284($fp)
        addiu $t0, $fp, -1368
        sw    $t0, -1280($fp)
        lw    $t2, -1280($fp)
        lw    $t0, -1284($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1276($fp)
        lw    $t0, -1276($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1272($fp)
        lw    $t0, -1272($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, -1268($fp)
        addiu $t0, $fp, -1364
        sw    $t0, -1264($fp)
        lw    $t2, -1264($fp)
        lw    $t0, -1268($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1260($fp)
        lw    $t0, -1260($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1256($fp)
        lw    $t0, -1256($fp)
        li    $t1, 2
        add   $t0, $t0, $t1
        sw    $t0, -1252($fp)
        addiu $t0, $fp, -1360
        sw    $t0, -1248($fp)
        lw    $t2, -1248($fp)
        lw    $t0, -1252($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1244($fp)
        lw    $t0, -1244($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1240($fp)
        lw    $t0, -1240($fp)
        li    $t1, 3
        add   $t0, $t0, $t1
        sw    $t0, -1236($fp)
        addiu $t0, $fp, -1356
        sw    $t0, -1232($fp)
        lw    $t2, -1232($fp)
        lw    $t0, -1236($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1228($fp)
        lw    $t0, -1228($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1224($fp)
        lw    $t0, -1224($fp)
        li    $t1, 4
        add   $t0, $t0, $t1
        sw    $t0, -1220($fp)
        addiu $t0, $fp, -1352
        sw    $t0, -1216($fp)
        lw    $t2, -1216($fp)
        lw    $t0, -1220($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1212($fp)
        lw    $t0, -1212($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1208($fp)
        lw    $t0, -1208($fp)
        li    $t1, 5
        add   $t0, $t0, $t1
        sw    $t0, -1204($fp)
        addiu $t0, $fp, -1348
        sw    $t0, -1200($fp)
        lw    $t2, -1200($fp)
        lw    $t0, -1204($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1196($fp)
        lw    $t0, -1196($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1192($fp)
        lw    $t0, -1192($fp)
        li    $t1, 6
        add   $t0, $t0, $t1
        sw    $t0, -1188($fp)
        addiu $t0, $fp, -1344
        sw    $t0, -1184($fp)
        lw    $t2, -1184($fp)
        lw    $t0, -1188($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1180($fp)
        lw    $t0, -1180($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1176($fp)
        lw    $t0, -1176($fp)
        li    $t1, 7
        add   $t0, $t0, $t1
        sw    $t0, -1172($fp)
        addiu $t0, $fp, -1340
        sw    $t0, -1168($fp)
        lw    $t2, -1168($fp)
        lw    $t0, -1172($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1164($fp)
        lw    $t0, -1164($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1160($fp)
        lw    $t0, -1160($fp)
        li    $t1, 8
        add   $t0, $t0, $t1
        sw    $t0, -1156($fp)
        addiu $t0, $fp, -1336
        sw    $t0, -1152($fp)
        lw    $t2, -1152($fp)
        lw    $t0, -1156($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1148($fp)
        lw    $t0, -1148($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1144($fp)
        lw    $t0, -1144($fp)
        li    $t1, 9
        add   $t0, $t0, $t1
        sw    $t0, -1140($fp)
        addiu $t0, $fp, -1332
        sw    $t0, -1136($fp)
        lw    $t2, -1136($fp)
        lw    $t0, -1140($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1132($fp)
        lw    $t0, -1132($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1128($fp)
        lw    $t0, -1128($fp)
        li    $t1, 10
        add   $t0, $t0, $t1
        sw    $t0, -1124($fp)
        addiu $t0, $fp, -1328
        sw    $t0, -1120($fp)
        lw    $t2, -1120($fp)
        lw    $t0, -1124($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1116($fp)
        lw    $t0, -1116($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1112($fp)
        lw    $t0, -1112($fp)
        li    $t1, 11
        add   $t0, $t0, $t1
        sw    $t0, -1108($fp)
        addiu $t0, $fp, -1324
        sw    $t0, -1104($fp)
        lw    $t2, -1104($fp)
        lw    $t0, -1108($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1100($fp)
        lw    $t0, -1100($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1096($fp)
        lw    $t0, -1096($fp)
        li    $t1, 12
        add   $t0, $t0, $t1
        sw    $t0, -1092($fp)
        addiu $t0, $fp, -1320
        sw    $t0, -1088($fp)
        lw    $t2, -1088($fp)
        lw    $t0, -1092($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1084($fp)
        lw    $t0, -1084($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1080($fp)
        lw    $t0, -1080($fp)
        li    $t1, 13
        add   $t0, $t0, $t1
        sw    $t0, -1076($fp)
        addiu $t0, $fp, -1316
        sw    $t0, -1072($fp)
        lw    $t2, -1072($fp)
        lw    $t0, -1076($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1068($fp)
        lw    $t0, -1068($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1064($fp)
        lw    $t0, -1064($fp)
        li    $t1, 14
        add   $t0, $t0, $t1
        sw    $t0, -1060($fp)
        addiu $t0, $fp, -1312
        sw    $t0, -1056($fp)
        lw    $t2, -1056($fp)
        lw    $t0, -1060($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1052($fp)
        lw    $t0, -1052($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1048($fp)
        lw    $t0, -1048($fp)
        li    $t1, 15
        add   $t0, $t0, $t1
        sw    $t0, -1044($fp)
        addiu $t0, $fp, -1308
        sw    $t0, -1040($fp)
        lw    $t2, -1040($fp)
        lw    $t0, -1044($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1368
        sw    $t0, -1036($fp)
        lw    $t0, -1036($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1032($fp)
        lw    $t0, -1032($fp)
        li    $t1, 16
        add   $t0, $t0, $t1
        sw    $t0, -1028($fp)
        addiu $t0, $fp, -1304
        sw    $t0, -1024($fp)
        lw    $t2, -1024($fp)
        lw    $t0, -1028($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1364
        sw    $t0, -1020($fp)
        lw    $t0, -1020($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1016($fp)
        addiu $t0, $fp, -1360
        sw    $t0, -1012($fp)
        lw    $t0, -1012($fp)
        lw    $t0, 0($t0)
        sw    $t0, -1008($fp)
        li    $t0, 2
        lw    $t1, -1008($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -1004($fp)
        lw    $t0, -1016($fp)
        lw    $t1, -1004($fp)
        add   $t0, $t0, $t1
        sw    $t0, -1000($fp)
        addiu $t0, $fp, -1356
        sw    $t0, -996($fp)
        lw    $t0, -996($fp)
        lw    $t0, 0($t0)
        sw    $t0, -992($fp)
        li    $t0, 3
        lw    $t1, -992($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -988($fp)
        lw    $t0, -1000($fp)
        lw    $t1, -988($fp)
        add   $t0, $t0, $t1
        sw    $t0, -984($fp)
        addiu $t0, $fp, -1352
        sw    $t0, -980($fp)
        lw    $t0, -980($fp)
        lw    $t0, 0($t0)
        sw    $t0, -976($fp)
        li    $t0, 4
        lw    $t1, -976($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -972($fp)
        lw    $t0, -984($fp)
        lw    $t1, -972($fp)
        add   $t0, $t0, $t1
        sw    $t0, -968($fp)
        addiu $t0, $fp, -1348
        sw    $t0, -964($fp)
        lw    $t0, -964($fp)
        lw    $t0, 0($t0)
        sw    $t0, -960($fp)
        li    $t0, 5
        lw    $t1, -960($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -956($fp)
        lw    $t0, -968($fp)
        lw    $t1, -956($fp)
        add   $t0, $t0, $t1
        sw    $t0, -952($fp)
        addiu $t0, $fp, -1344
        sw    $t0, -948($fp)
        lw    $t0, -948($fp)
        lw    $t0, 0($t0)
        sw    $t0, -944($fp)
        li    $t0, 6
        lw    $t1, -944($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -940($fp)
        lw    $t0, -952($fp)
        lw    $t1, -940($fp)
        add   $t0, $t0, $t1
        sw    $t0, -936($fp)
        addiu $t0, $fp, -1340
        sw    $t0, -932($fp)
        lw    $t0, -932($fp)
        lw    $t0, 0($t0)
        sw    $t0, -928($fp)
        li    $t0, 7
        lw    $t1, -928($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -924($fp)
        lw    $t0, -936($fp)
        lw    $t1, -924($fp)
        add   $t0, $t0, $t1
        sw    $t0, -920($fp)
        addiu $t0, $fp, -1336
        sw    $t0, -916($fp)
        lw    $t0, -916($fp)
        lw    $t0, 0($t0)
        sw    $t0, -912($fp)
        li    $t0, 8
        lw    $t1, -912($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -908($fp)
        lw    $t0, -920($fp)
        lw    $t1, -908($fp)
        add   $t0, $t0, $t1
        sw    $t0, -904($fp)
        addiu $t0, $fp, -1332
        sw    $t0, -900($fp)
        lw    $t0, -900($fp)
        lw    $t0, 0($t0)
        sw    $t0, -896($fp)
        li    $t0, 9
        lw    $t1, -896($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -892($fp)
        lw    $t0, -904($fp)
        lw    $t1, -892($fp)
        add   $t0, $t0, $t1
        sw    $t0, -888($fp)
        addiu $t0, $fp, -1328
        sw    $t0, -884($fp)
        lw    $t0, -884($fp)
        lw    $t0, 0($t0)
        sw    $t0, -880($fp)
        li    $t0, 10
        lw    $t1, -880($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -876($fp)
        lw    $t0, -888($fp)
        lw    $t1, -876($fp)
        add   $t0, $t0, $t1
        sw    $t0, -872($fp)
        addiu $t0, $fp, -1324
        sw    $t0, -868($fp)
        lw    $t0, -868($fp)
        lw    $t0, 0($t0)
        sw    $t0, -864($fp)
        li    $t0, 11
        lw    $t1, -864($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -860($fp)
        lw    $t0, -872($fp)
        lw    $t1, -860($fp)
        add   $t0, $t0, $t1
        sw    $t0, -856($fp)
        addiu $t0, $fp, -1320
        sw    $t0, -852($fp)
        lw    $t0, -852($fp)
        lw    $t0, 0($t0)
        sw    $t0, -848($fp)
        li    $t0, 12
        lw    $t1, -848($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -844($fp)
        lw    $t0, -856($fp)
        lw    $t1, -844($fp)
        add   $t0, $t0, $t1
        sw    $t0, -840($fp)
        addiu $t0, $fp, -1316
        sw    $t0, -836($fp)
        lw    $t0, -836($fp)
        lw    $t0, 0($t0)
        sw    $t0, -832($fp)
        li    $t0, 13
        lw    $t1, -832($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -828($fp)
        lw    $t0, -840($fp)
        lw    $t1, -828($fp)
        add   $t0, $t0, $t1
        sw    $t0, -824($fp)
        addiu $t0, $fp, -1312
        sw    $t0, -820($fp)
        lw    $t0, -820($fp)
        lw    $t0, 0($t0)
        sw    $t0, -816($fp)
        li    $t0, 14
        lw    $t1, -816($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -812($fp)
        lw    $t0, -824($fp)
        lw    $t1, -812($fp)
        add   $t0, $t0, $t1
        sw    $t0, -808($fp)
        addiu $t0, $fp, -1308
        sw    $t0, -804($fp)
        lw    $t0, -804($fp)
        lw    $t0, 0($t0)
        sw    $t0, -800($fp)
        li    $t0, 15
        lw    $t1, -800($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -796($fp)
        lw    $t0, -808($fp)
        lw    $t1, -796($fp)
        add   $t0, $t0, $t1
        sw    $t0, -792($fp)
        addiu $t0, $fp, -1304
        sw    $t0, -788($fp)
        lw    $t0, -788($fp)
        lw    $t0, 0($t0)
        sw    $t0, -784($fp)
        li    $t0, 16
        lw    $t1, -784($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -780($fp)
        lw    $t0, -792($fp)
        lw    $t1, -780($fp)
        add   $t0, $t0, $t1
        sw    $t0, -776($fp)
        addiu $t0, $fp, -1300
        sw    $t0, -772($fp)
        lw    $t2, -772($fp)
        lw    $t0, -776($fp)
        sw    $t0, 0($t2)
        la    $a0, _str1
        jal   putstr
        addiu $t0, $fp, -1364
        sw    $t0, -768($fp)
        lw    $t0, -768($fp)
        lw    $t0, 0($t0)
        sw    $t0, -764($fp)
        lw    $a0, -764($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1360
        sw    $t0, -760($fp)
        lw    $t0, -760($fp)
        lw    $t0, 0($t0)
        sw    $t0, -756($fp)
        lw    $a0, -756($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1356
        sw    $t0, -752($fp)
        lw    $t0, -752($fp)
        lw    $t0, 0($t0)
        sw    $t0, -748($fp)
        lw    $a0, -748($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1352
        sw    $t0, -744($fp)
        lw    $t0, -744($fp)
        lw    $t0, 0($t0)
        sw    $t0, -740($fp)
        lw    $a0, -740($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1348
        sw    $t0, -736($fp)
        lw    $t0, -736($fp)
        lw    $t0, 0($t0)
        sw    $t0, -732($fp)
        lw    $a0, -732($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1344
        sw    $t0, -728($fp)
        lw    $t0, -728($fp)
        lw    $t0, 0($t0)
        sw    $t0, -724($fp)
        lw    $a0, -724($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1340
        sw    $t0, -720($fp)
        lw    $t0, -720($fp)
        lw    $t0, 0($t0)
        sw    $t0, -716($fp)
        lw    $a0, -716($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1336
        sw    $t0, -712($fp)
        lw    $t0, -712($fp)
        lw    $t0, 0($t0)
        sw    $t0, -708($fp)
        lw    $a0, -708($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1332
        sw    $t0, -704($fp)
        lw    $t0, -704($fp)
        lw    $t0, 0($t0)
        sw    $t0, -700($fp)
        lw    $a0, -700($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1328
        sw    $t0, -696($fp)
        lw    $t0, -696($fp)
        lw    $t0, 0($t0)
        sw    $t0, -692($fp)
        lw    $a0, -692($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1324
        sw    $t0, -688($fp)
        lw    $t0, -688($fp)
        lw    $t0, 0($t0)
        sw    $t0, -684($fp)
        lw    $a0, -684($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1320
        sw    $t0, -680($fp)
        lw    $t0, -680($fp)
        lw    $t0, 0($t0)
        sw    $t0, -676($fp)
        lw    $a0, -676($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1316
        sw    $t0, -672($fp)
        lw    $t0, -672($fp)
        lw    $t0, 0($t0)
        sw    $t0, -668($fp)
        lw    $a0, -668($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1312
        sw    $t0, -664($fp)
        lw    $t0, -664($fp)
        lw    $t0, 0($t0)
        sw    $t0, -660($fp)
        lw    $a0, -660($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1308
        sw    $t0, -656($fp)
        lw    $t0, -656($fp)
        lw    $t0, 0($t0)
        sw    $t0, -652($fp)
        lw    $a0, -652($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1304
        sw    $t0, -648($fp)
        lw    $t0, -648($fp)
        lw    $t0, 0($t0)
        sw    $t0, -644($fp)
        lw    $a0, -644($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        addiu $t0, $fp, -1368
        sw    $t0, -640($fp)
        lw    $t0, -640($fp)
        lw    $t0, 0($t0)
        sw    $t0, -636($fp)
        li    $a0, 4
        lw    $a1, -636($fp)
        jal   func_pressure
        sw    $v0, -632($fp)
        addiu $t0, $fp, -1296
        sw    $t0, -628($fp)
        lw    $t2, -628($fp)
        lw    $t0, -632($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1364
        sw    $t0, -624($fp)
        lw    $t0, -624($fp)
        lw    $t0, 0($t0)
        sw    $t0, -620($fp)
        addiu $t0, $fp, -1360
        sw    $t0, -616($fp)
        lw    $t0, -616($fp)
        lw    $t0, 0($t0)
        sw    $t0, -612($fp)
        addiu $t0, $fp, -1356
        sw    $t0, -608($fp)
        lw    $t0, -608($fp)
        lw    $t0, 0($t0)
        sw    $t0, -604($fp)
        addiu $t0, $fp, -1352
        sw    $t0, -600($fp)
        lw    $t0, -600($fp)
        lw    $t0, 0($t0)
        sw    $t0, -596($fp)
        addiu $t0, $fp, -1348
        sw    $t0, -592($fp)
        lw    $t0, -592($fp)
        lw    $t0, 0($t0)
        sw    $t0, -588($fp)
        addiu $t0, $fp, -1344
        sw    $t0, -584($fp)
        lw    $t0, -584($fp)
        lw    $t0, 0($t0)
        sw    $t0, -580($fp)
        lw    $t0, -588($fp)
        sw    $t0, 0($sp)
        lw    $t0, -580($fp)
        sw    $t0, 4($sp)
        lw    $a0, -620($fp)
        lw    $a1, -612($fp)
        lw    $a2, -604($fp)
        lw    $a3, -596($fp)
        jal   func_combine
        sw    $v0, -576($fp)
        addiu $t0, $fp, -1340
        sw    $t0, -572($fp)
        lw    $t0, -572($fp)
        lw    $t0, 0($t0)
        sw    $t0, -568($fp)
        addiu $t0, $fp, -1336
        sw    $t0, -564($fp)
        lw    $t0, -564($fp)
        lw    $t0, 0($t0)
        sw    $t0, -560($fp)
        addiu $t0, $fp, -1332
        sw    $t0, -556($fp)
        lw    $t0, -556($fp)
        lw    $t0, 0($t0)
        sw    $t0, -552($fp)
        addiu $t0, $fp, -1328
        sw    $t0, -548($fp)
        lw    $t0, -548($fp)
        lw    $t0, 0($t0)
        sw    $t0, -544($fp)
        addiu $t0, $fp, -1324
        sw    $t0, -540($fp)
        lw    $t0, -540($fp)
        lw    $t0, 0($t0)
        sw    $t0, -536($fp)
        addiu $t0, $fp, -1320
        sw    $t0, -532($fp)
        lw    $t0, -532($fp)
        lw    $t0, 0($t0)
        sw    $t0, -528($fp)
        lw    $t0, -536($fp)
        sw    $t0, 0($sp)
        lw    $t0, -528($fp)
        sw    $t0, 4($sp)
        lw    $a0, -568($fp)
        lw    $a1, -560($fp)
        lw    $a2, -552($fp)
        lw    $a3, -544($fp)
        jal   func_combine
        sw    $v0, -524($fp)
        lw    $t0, -576($fp)
        lw    $t1, -524($fp)
        add   $t0, $t0, $t1
        sw    $t0, -520($fp)
        addiu $t0, $fp, -1316
        sw    $t0, -516($fp)
        lw    $t0, -516($fp)
        lw    $t0, 0($t0)
        sw    $t0, -512($fp)
        addiu $t0, $fp, -1312
        sw    $t0, -508($fp)
        lw    $t0, -508($fp)
        lw    $t0, 0($t0)
        sw    $t0, -504($fp)
        addiu $t0, $fp, -1308
        sw    $t0, -500($fp)
        lw    $t0, -500($fp)
        lw    $t0, 0($t0)
        sw    $t0, -496($fp)
        addiu $t0, $fp, -1304
        sw    $t0, -492($fp)
        lw    $t0, -492($fp)
        lw    $t0, 0($t0)
        sw    $t0, -488($fp)
        addiu $t0, $fp, -1364
        sw    $t0, -484($fp)
        lw    $t0, -484($fp)
        lw    $t0, 0($t0)
        sw    $t0, -480($fp)
        addiu $t0, $fp, -1360
        sw    $t0, -476($fp)
        lw    $t0, -476($fp)
        lw    $t0, 0($t0)
        sw    $t0, -472($fp)
        lw    $t0, -480($fp)
        sw    $t0, 0($sp)
        lw    $t0, -472($fp)
        sw    $t0, 4($sp)
        lw    $a0, -512($fp)
        lw    $a1, -504($fp)
        lw    $a2, -496($fp)
        lw    $a3, -488($fp)
        jal   func_combine
        sw    $v0, -468($fp)
        lw    $t0, -520($fp)
        lw    $t1, -468($fp)
        add   $t0, $t0, $t1
        sw    $t0, -464($fp)
        addiu $t0, $fp, -1292
        sw    $t0, -460($fp)
        lw    $t2, -460($fp)
        lw    $t0, -464($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, -1304
        sw    $t0, -456($fp)
        lw    $t0, -456($fp)
        lw    $t0, 0($t0)
        sw    $t0, -452($fp)
        addiu $t0, $fp, -1308
        sw    $t0, -448($fp)
        lw    $t0, -448($fp)
        lw    $t0, 0($t0)
        sw    $t0, -444($fp)
        li    $t0, 2
        lw    $t1, -444($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -440($fp)
        lw    $t0, -452($fp)
        lw    $t1, -440($fp)
        add   $t0, $t0, $t1
        sw    $t0, -436($fp)
        addiu $t0, $fp, -1312
        sw    $t0, -432($fp)
        lw    $t0, -432($fp)
        lw    $t0, 0($t0)
        sw    $t0, -428($fp)
        li    $t0, 3
        lw    $t1, -428($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -424($fp)
        lw    $t0, -436($fp)
        lw    $t1, -424($fp)
        add   $t0, $t0, $t1
        sw    $t0, -420($fp)
        addiu $t0, $fp, -1316
        sw    $t0, -416($fp)
        lw    $t0, -416($fp)
        lw    $t0, 0($t0)
        sw    $t0, -412($fp)
        li    $t0, 4
        lw    $t1, -412($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -408($fp)
        lw    $t0, -420($fp)
        lw    $t1, -408($fp)
        add   $t0, $t0, $t1
        sw    $t0, -404($fp)
        addiu $t0, $fp, -1320
        sw    $t0, -400($fp)
        lw    $t0, -400($fp)
        lw    $t0, 0($t0)
        sw    $t0, -396($fp)
        li    $t0, 5
        lw    $t1, -396($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -392($fp)
        lw    $t0, -404($fp)
        lw    $t1, -392($fp)
        add   $t0, $t0, $t1
        sw    $t0, -388($fp)
        addiu $t0, $fp, -1324
        sw    $t0, -384($fp)
        lw    $t0, -384($fp)
        lw    $t0, 0($t0)
        sw    $t0, -380($fp)
        li    $t0, 6
        lw    $t1, -380($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -376($fp)
        lw    $t0, -388($fp)
        lw    $t1, -376($fp)
        add   $t0, $t0, $t1
        sw    $t0, -372($fp)
        addiu $t0, $fp, -1328
        sw    $t0, -368($fp)
        lw    $t0, -368($fp)
        lw    $t0, 0($t0)
        sw    $t0, -364($fp)
        li    $t0, 7
        lw    $t1, -364($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -360($fp)
        lw    $t0, -372($fp)
        lw    $t1, -360($fp)
        add   $t0, $t0, $t1
        sw    $t0, -356($fp)
        addiu $t0, $fp, -1332
        sw    $t0, -352($fp)
        lw    $t0, -352($fp)
        lw    $t0, 0($t0)
        sw    $t0, -348($fp)
        li    $t0, 8
        lw    $t1, -348($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -344($fp)
        lw    $t0, -356($fp)
        lw    $t1, -344($fp)
        add   $t0, $t0, $t1
        sw    $t0, -340($fp)
        addiu $t0, $fp, -1336
        sw    $t0, -336($fp)
        lw    $t0, -336($fp)
        lw    $t0, 0($t0)
        sw    $t0, -332($fp)
        li    $t0, 9
        lw    $t1, -332($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -328($fp)
        lw    $t0, -340($fp)
        lw    $t1, -328($fp)
        add   $t0, $t0, $t1
        sw    $t0, -324($fp)
        addiu $t0, $fp, -1340
        sw    $t0, -320($fp)
        lw    $t0, -320($fp)
        lw    $t0, 0($t0)
        sw    $t0, -316($fp)
        li    $t0, 10
        lw    $t1, -316($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -312($fp)
        lw    $t0, -324($fp)
        lw    $t1, -312($fp)
        add   $t0, $t0, $t1
        sw    $t0, -308($fp)
        addiu $t0, $fp, -1344
        sw    $t0, -304($fp)
        lw    $t0, -304($fp)
        lw    $t0, 0($t0)
        sw    $t0, -300($fp)
        li    $t0, 11
        lw    $t1, -300($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -296($fp)
        lw    $t0, -308($fp)
        lw    $t1, -296($fp)
        add   $t0, $t0, $t1
        sw    $t0, -292($fp)
        addiu $t0, $fp, -1348
        sw    $t0, -288($fp)
        lw    $t0, -288($fp)
        lw    $t0, 0($t0)
        sw    $t0, -284($fp)
        li    $t0, 12
        lw    $t1, -284($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -280($fp)
        lw    $t0, -292($fp)
        lw    $t1, -280($fp)
        add   $t0, $t0, $t1
        sw    $t0, -276($fp)
        addiu $t0, $fp, -1352
        sw    $t0, -272($fp)
        lw    $t0, -272($fp)
        lw    $t0, 0($t0)
        sw    $t0, -268($fp)
        li    $t0, 13
        lw    $t1, -268($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -264($fp)
        lw    $t0, -276($fp)
        lw    $t1, -264($fp)
        add   $t0, $t0, $t1
        sw    $t0, -260($fp)
        addiu $t0, $fp, -1356
        sw    $t0, -256($fp)
        lw    $t0, -256($fp)
        lw    $t0, 0($t0)
        sw    $t0, -252($fp)
        li    $t0, 14
        lw    $t1, -252($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -248($fp)
        lw    $t0, -260($fp)
        lw    $t1, -248($fp)
        add   $t0, $t0, $t1
        sw    $t0, -244($fp)
        addiu $t0, $fp, -1360
        sw    $t0, -240($fp)
        lw    $t0, -240($fp)
        lw    $t0, 0($t0)
        sw    $t0, -236($fp)
        li    $t0, 15
        lw    $t1, -236($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -232($fp)
        lw    $t0, -244($fp)
        lw    $t1, -232($fp)
        add   $t0, $t0, $t1
        sw    $t0, -228($fp)
        addiu $t0, $fp, -1364
        sw    $t0, -224($fp)
        lw    $t0, -224($fp)
        lw    $t0, 0($t0)
        sw    $t0, -220($fp)
        li    $t0, 16
        lw    $t1, -220($fp)
        mul   $t0, $t0, $t1
        sw    $t0, -216($fp)
        lw    $t0, -228($fp)
        lw    $t1, -216($fp)
        add   $t0, $t0, $t1
        sw    $t0, -212($fp)
        addiu $t0, $fp, -1296
        sw    $t0, -208($fp)
        lw    $t0, -208($fp)
        lw    $t0, 0($t0)
        sw    $t0, -204($fp)
        lw    $t0, -212($fp)
        lw    $t1, -204($fp)
        add   $t0, $t0, $t1
        sw    $t0, -200($fp)
        addiu $t0, $fp, -1292
        sw    $t0, -196($fp)
        lw    $t0, -196($fp)
        lw    $t0, 0($t0)
        sw    $t0, -192($fp)
        lw    $t0, -200($fp)
        lw    $t1, -192($fp)
        add   $t0, $t0, $t1
        sw    $t0, -188($fp)
        addiu $t0, $fp, -1288
        sw    $t0, -184($fp)
        lw    $t2, -184($fp)
        lw    $t0, -188($fp)
        sw    $t0, 0($t2)
        la    $a0, _str2
        jal   putstr
        addiu $t0, $fp, -1364
        sw    $t0, -180($fp)
        lw    $t0, -180($fp)
        lw    $t0, 0($t0)
        sw    $t0, -176($fp)
        lw    $a0, -176($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1360
        sw    $t0, -172($fp)
        lw    $t0, -172($fp)
        lw    $t0, 0($t0)
        sw    $t0, -168($fp)
        lw    $a0, -168($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1356
        sw    $t0, -164($fp)
        lw    $t0, -164($fp)
        lw    $t0, 0($t0)
        sw    $t0, -160($fp)
        lw    $a0, -160($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1352
        sw    $t0, -156($fp)
        lw    $t0, -156($fp)
        lw    $t0, 0($t0)
        sw    $t0, -152($fp)
        lw    $a0, -152($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1348
        sw    $t0, -148($fp)
        lw    $t0, -148($fp)
        lw    $t0, 0($t0)
        sw    $t0, -144($fp)
        lw    $a0, -144($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1344
        sw    $t0, -140($fp)
        lw    $t0, -140($fp)
        lw    $t0, 0($t0)
        sw    $t0, -136($fp)
        lw    $a0, -136($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1340
        sw    $t0, -132($fp)
        lw    $t0, -132($fp)
        lw    $t0, 0($t0)
        sw    $t0, -128($fp)
        lw    $a0, -128($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1336
        sw    $t0, -124($fp)
        lw    $t0, -124($fp)
        lw    $t0, 0($t0)
        sw    $t0, -120($fp)
        lw    $a0, -120($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1332
        sw    $t0, -116($fp)
        lw    $t0, -116($fp)
        lw    $t0, 0($t0)
        sw    $t0, -112($fp)
        lw    $a0, -112($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1328
        sw    $t0, -108($fp)
        lw    $t0, -108($fp)
        lw    $t0, 0($t0)
        sw    $t0, -104($fp)
        lw    $a0, -104($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1324
        sw    $t0, -100($fp)
        lw    $t0, -100($fp)
        lw    $t0, 0($t0)
        sw    $t0, -96($fp)
        lw    $a0, -96($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1320
        sw    $t0, -92($fp)
        lw    $t0, -92($fp)
        lw    $t0, 0($t0)
        sw    $t0, -88($fp)
        lw    $a0, -88($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1316
        sw    $t0, -84($fp)
        lw    $t0, -84($fp)
        lw    $t0, 0($t0)
        sw    $t0, -80($fp)
        lw    $a0, -80($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1312
        sw    $t0, -76($fp)
        lw    $t0, -76($fp)
        lw    $t0, 0($t0)
        sw    $t0, -72($fp)
        lw    $a0, -72($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1308
        sw    $t0, -68($fp)
        lw    $t0, -68($fp)
        lw    $t0, 0($t0)
        sw    $t0, -64($fp)
        lw    $a0, -64($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1304
        sw    $t0, -60($fp)
        lw    $t0, -60($fp)
        lw    $t0, 0($t0)
        sw    $t0, -56($fp)
        lw    $a0, -56($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        la    $a0, _str3
        jal   putstr
        addiu $t0, $fp, -1368
        sw    $t0, -52($fp)
        lw    $t0, -52($fp)
        lw    $t0, 0($t0)
        sw    $t0, -48($fp)
        lw    $a0, -48($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1300
        sw    $t0, -44($fp)
        lw    $t0, -44($fp)
        lw    $t0, 0($t0)
        sw    $t0, -40($fp)
        lw    $a0, -40($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1296
        sw    $t0, -36($fp)
        lw    $t0, -36($fp)
        lw    $t0, 0($t0)
        sw    $t0, -32($fp)
        lw    $a0, -32($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1292
        sw    $t0, -28($fp)
        lw    $t0, -28($fp)
        lw    $t0, 0($t0)
        sw    $t0, -24($fp)
        lw    $a0, -24($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, -1288
        sw    $t0, -20($fp)
        lw    $t0, -20($fp)
        lw    $t0, 0($t0)
        sw    $t0, -16($fp)
        lw    $a0, -16($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        li    $v0, 0
        lw    $ra, -4($fp)
        lw    $fp, -8($fp)
        addiu $sp, $sp, 1376
        jr    $ra

# ---- I/O helpers ----
getchar:
        addiu $sp, $sp, -8
        sw    $ra, 4($sp)
        li    $v0, 14
        li    $a0, 0
        move  $a1, $sp
        li    $a2, 1
        syscall
        blez  $v0, getchar_eof
        lb    $v0, 0($sp)
        lw    $ra, 4($sp)
        addiu $sp, $sp, 8
        jr    $ra
getchar_eof:
        li    $v0, -1
        lw    $ra, 4($sp)
        addiu $sp, $sp, 8
        jr    $ra

getint:
        addiu $sp, $sp, -16
        sw    $ra, 12($sp)
        sw    $s0, 8($sp)
        sw    $s1, 4($sp)
getint_skip:
        li    $v0, 12
        syscall
        move  $t0, $v0
        li    $t1, ' '
        beq   $t0, $t1, getint_skip
        li    $t1, '\n'
        beq   $t0, $t1, getint_skip
        li    $t1, '\t'
        beq   $t0, $t1, getint_skip
        li    $t1, '\r'
        beq   $t0, $t1, getint_skip
        li    $s1, 0
        li    $s0, 1
        li    $t1, '-'
        bne   $t0, $t1, getint_digits
        li    $s0, -1
        li    $v0, 12
        syscall
        move  $t0, $v0
getint_digits:
        li    $t1, '0'
        blt   $t0, $t1, getint_done
        li    $t1, '9'
        bgt   $t0, $t1, getint_done
        li    $t2, 10
        mul   $s1, $s1, $t2
        li    $t2, '0'
        sub   $t0, $t0, $t2
        add   $s1, $s1, $t0
        li    $v0, 12
        syscall
        move  $t0, $v0
        j     getint_digits
getint_done:
        mul   $v0, $s1, $s0
        lw    $ra, 12($sp)
        lw    $s0, 8($sp)
        lw    $s1, 4($sp)
        addiu $sp, $sp, 16
        jr    $ra

getstr:
        addiu $sp, $sp, -16
        sw    $ra, 12($sp)
        sw    $s0, 8($sp)
        sw    $s1, 4($sp)
        move  $s0, $a0
        li    $s1, 0
getstr_loop:
        li    $v0, 14
        li    $a0, 0
        move  $a1, $sp
        li    $a2, 1
        syscall
        blez  $v0, getstr_done
        lb    $t0, 0($sp)
        li    $t1, 10
        beq   $t0, $t1, getstr_done
        sb    $t0, 0($s0)
        addiu $s0, $s0, 1
        addiu $s1, $s1, 1
        j     getstr_loop
getstr_done:
        sb    $zero, 0($s0)
        move  $v0, $s1
        lw    $ra, 12($sp)
        lw    $s0, 8($sp)
        lw    $s1, 4($sp)
        addiu $sp, $sp, 16
        jr    $ra

putint:
        li    $v0, 1
        syscall
        jr    $ra

putchar:
        li    $v0, 11
        syscall
        jr    $ra

putstr:
        li    $v0, 4
        syscall
        jr    $ra

# ---- Heap allocator (sbrk based, with free-list reuse) ----
        .data
        .align 2
__free_list:
        .word 0

        .text
# Search the free list for a block whose payload >= $a0 bytes.
# Returns the block base address in $v0 (header already set to $a0), or 0.
__malloc_free_search:
        la    $t0, __free_list
        move  $t1, $t0              # prev = &__free_list
__mfs_loop:
        lw    $t2, 0($t1)           # cur = *prev
        beqz  $t2, __mfs_fail
        lw    $t3, 0($t2)           # cur payload size
        blt   $t3, $a0, __mfs_next
        sub   $t4, $t3, $a0
        li    $t5, 8
        blt   $t4, $t5, __mfs_whole
        # split: allocate front, return remainder to free list
        sw    $a0, 0($t2)           # allocated header = requested payload
        addiu $t6, $t2, 4
        addu  $t6, $t6, $a0         # remainder base
        addiu $t4, $t4, -4          # remainder payload
        sw    $t4, 0($t6)           # remainder header
        lw    $t7, 4($t2)           # cur.next
        sw    $t7, 4($t6)           # remainder.next = cur.next
        sw    $t6, 0($t1)           # prev->next = remainder
        move  $v0, $t2
        jr    $ra
__mfs_whole:
        lw    $t7, 4($t2)           # cur.next
        sw    $t7, 0($t1)           # prev->next = cur.next
        move  $v0, $t2
        jr    $ra
__mfs_next:
        addiu $t1, $t2, 4
        j     __mfs_loop
__mfs_fail:
        li    $v0, 0
        jr    $ra

# Free a block: base=$a0, payload size=$a1. Inserts into free list and coalesces.
__free_block:
        la    $t0, __free_list
        lw    $t1, 0($t0)           # old head
        sw    $a1, 0($a0)           # write header
        sw    $t1, 4($a0)           # node.next = old head
        sw    $a0, 0($t0)           # head = base
        lw    $t2, 0($a0)           # block size
        addiu $t3, $a0, 4
        addu  $t3, $t3, $t2         # block end
        la    $t4, __free_list
        move  $t5, $t4              # prev = &__free_list
__fb_loop:
        lw    $t6, 0($t5)           # cur = *prev
        beqz  $t6, __fb_done
        beq   $t6, $a0, __fb_next
        lw    $t7, 0($t6)           # cur size
        addiu $t8, $t6, 4
        addu  $t8, $t8, $t7         # cur end
        beq   $t8, $a0, __fb_prev
        beq   $t3, $t6, __fb_next_adj
__fb_next:
        addiu $t5, $t6, 4
        j     __fb_loop
__fb_prev:
        addiu $t7, $t7, 4
        addu  $t7, $t7, $t2
        sw    $t7, 0($t6)           # cur size += 4 + block size
        lw    $t9, 4($a0)
        sw    $t9, 0($t5)           # remove block from list
        jr    $ra
__fb_next_adj:
        addiu $t2, $t2, 4
        addu  $t2, $t2, $t7
        sw    $t2, 0($a0)           # block size += 4 + cur size
        lw    $t9, 4($t6)
        sw    $t9, 0($t5)           # remove cur from list
        jr    $ra
__fb_done:
        jr    $ra

# $a0 = requested struct payload size
__malloc_struct:
        addiu $sp, $sp, -8
        sw    $ra, 4($sp)
        sw    $s0, 0($sp)
        addiu $t0, $a0, 3
        li    $t1, -4
        and   $s0, $t0, $t1         # aligned payload size
        li    $t0, 4
        bge   $s0, $t0, __ms_ok
        li    $s0, 4
__ms_ok:
        move  $a0, $s0
        jal   __malloc_free_search
        bnez  $v0, __ms_done
        addiu $a0, $s0, 4
        li    $v0, 9
        syscall
        sw    $s0, 0($v0)           # header = payload size
__ms_done:
        # return base address; caller stores size header and adds 4
        lw    $ra, 4($sp)
        lw    $s0, 0($sp)
        addiu $sp, $sp, 8
        jr    $ra

# $a0 = total array payload size (including the length word), $a1 = element size
__malloc_array:
        addiu $sp, $sp, -16
        sw    $ra, 12($sp)
        sw    $s0, 8($sp)
        sw    $s1, 4($sp)
        sw    $s2, 0($sp)
        move  $s0, $a0              # total payload
        move  $s1, $a1              # element size
        addiu $t0, $s0, 3
        li    $t1, -4
        and   $s0, $t0, $t1
        li    $t0, 4
        bge   $s0, $t0, __ma_ok
        li    $s0, 4
__ma_ok:
        move  $a0, $s0
        jal   __malloc_free_search
        bnez  $v0, __ma_done
        addiu $a0, $s0, 4
        li    $v0, 9
        syscall
__ma_done:
        # return base address; caller stores count header and adds 4
        lw    $ra, 12($sp)
        lw    $s0, 8($sp)
        lw    $s1, 4($sp)
        lw    $s2, 0($sp)
        addiu $sp, $sp, 16
        jr    $ra

# $a0 = user pointer to struct
__free_struct:
        addiu $a0, $a0, -4
        lw    $a1, 0($a0)
        j     __free_block

# $a0 = user pointer to array, $a1 = element size
__free_array:
        addiu $a0, $a0, -4
        lw    $t0, 0($a0)
        mul   $a1, $t0, $a1
        addiu $a1, $a1, 4
        j     __free_block
