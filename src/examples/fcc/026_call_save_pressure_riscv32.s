    .option nopic
    .option norelax

    .data
    .align 2
_str0:
    .string "P "
    .align 2
_str1:
    .string "M0 "
    .align 2
_str2:
    .string "M1 "
    .align 2
_str3:
    .string "S "

    .text
    .globl main

__fcc_func_leaf:
    addi sp, sp, -80
    sw   ra, 76(sp)
    sw   fp, 72(sp)
    addi fp, sp, 80
    sw   a0, -80(fp)
    sw   a1, -76(fp)
    sw   a2, -72(fp)
_entry_0:
    addi t0, fp, -80
    sw   t0, -68(fp)
    lw   t0, -68(fp)
    lw   t0, 0(t0)
    sw   t0, -64(fp)
    lw   t0, -64(fp)
    li   t1, 3
    mul  t0, t0, t1
    sw   t0, -60(fp)
    addi t0, fp, -76
    sw   t0, -56(fp)
    lw   t0, -56(fp)
    lw   t0, 0(t0)
    sw   t0, -52(fp)
    lw   t0, -52(fp)
    li   t1, 5
    mul  t0, t0, t1
    sw   t0, -48(fp)
    lw   t0, -60(fp)
    lw   t1, -48(fp)
    sub  t0, t0, t1
    sw   t0, -44(fp)
    addi t0, fp, -72
    sw   t0, -40(fp)
    lw   t0, -40(fp)
    lw   t0, 0(t0)
    sw   t0, -36(fp)
    lw   t0, -36(fp)
    li   t1, 7
    mul  t0, t0, t1
    sw   t0, -32(fp)
    lw   t0, -44(fp)
    lw   t1, -32(fp)
    add  t0, t0, t1
    sw   t0, -28(fp)
    lw   t0, -28(fp)
    li   t1, 11
    add  t0, t0, t1
    sw   t0, -24(fp)
    lw   a0, -24(fp)
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 80
    ret
__fcc_func_combine:
    addi sp, sp, -176
    sw   ra, 172(sp)
    sw   fp, 168(sp)
    addi fp, sp, 176
    sw   a0, -176(fp)
    sw   a1, -172(fp)
    sw   a2, -168(fp)
    sw   a3, -164(fp)
    sw   a4, -160(fp)
    sw   a5, -156(fp)
_entry_1:
    addi t0, fp, -176
    sw   t0, -152(fp)
    lw   t0, -152(fp)
    lw   t0, 0(t0)
    sw   t0, -148(fp)
    addi t0, fp, -172
    sw   t0, -144(fp)
    lw   t0, -144(fp)
    lw   t0, 0(t0)
    sw   t0, -140(fp)
    addi t0, fp, -168
    sw   t0, -136(fp)
    lw   t0, -136(fp)
    lw   t0, 0(t0)
    sw   t0, -132(fp)
    lw   a0, -148(fp)
    lw   a1, -140(fp)
    lw   a2, -132(fp)
    call __fcc_func_leaf
    sw   a0, -128(fp)
    addi t0, fp, -164
    sw   t0, -124(fp)
    lw   t0, -124(fp)
    lw   t0, 0(t0)
    sw   t0, -120(fp)
    addi t0, fp, -160
    sw   t0, -116(fp)
    lw   t0, -116(fp)
    lw   t0, 0(t0)
    sw   t0, -112(fp)
    addi t0, fp, -156
    sw   t0, -108(fp)
    lw   t0, -108(fp)
    lw   t0, 0(t0)
    sw   t0, -104(fp)
    lw   a0, -120(fp)
    lw   a1, -112(fp)
    lw   a2, -104(fp)
    call __fcc_func_leaf
    sw   a0, -100(fp)
    li   t0, 2
    lw   t1, -100(fp)
    mul  t0, t0, t1
    sw   t0, -96(fp)
    lw   t0, -128(fp)
    lw   t1, -96(fp)
    add  t0, t0, t1
    sw   t0, -92(fp)
    addi t0, fp, -176
    sw   t0, -88(fp)
    lw   t0, -88(fp)
    lw   t0, 0(t0)
    sw   t0, -84(fp)
    addi t0, fp, -168
    sw   t0, -80(fp)
    lw   t0, -80(fp)
    lw   t0, 0(t0)
    sw   t0, -76(fp)
    lw   t0, -84(fp)
    lw   t1, -76(fp)
    add  t0, t0, t1
    sw   t0, -72(fp)
    addi t0, fp, -172
    sw   t0, -68(fp)
    lw   t0, -68(fp)
    lw   t0, 0(t0)
    sw   t0, -64(fp)
    addi t0, fp, -164
    sw   t0, -60(fp)
    lw   t0, -60(fp)
    lw   t0, 0(t0)
    sw   t0, -56(fp)
    lw   t0, -64(fp)
    lw   t1, -56(fp)
    add  t0, t0, t1
    sw   t0, -52(fp)
    addi t0, fp, -160
    sw   t0, -48(fp)
    lw   t0, -48(fp)
    lw   t0, 0(t0)
    sw   t0, -44(fp)
    addi t0, fp, -156
    sw   t0, -40(fp)
    lw   t0, -40(fp)
    lw   t0, 0(t0)
    sw   t0, -36(fp)
    lw   t0, -44(fp)
    lw   t1, -36(fp)
    add  t0, t0, t1
    sw   t0, -32(fp)
    lw   a0, -72(fp)
    lw   a1, -52(fp)
    lw   a2, -32(fp)
    call __fcc_func_leaf
    sw   a0, -28(fp)
    lw   t0, -92(fp)
    lw   t1, -28(fp)
    sub  t0, t0, t1
    sw   t0, -24(fp)
    lw   a0, -24(fp)
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 176
    ret
__fcc_func_pressure:
    addi sp, sp, -1120
    sw   ra, 1116(sp)
    sw   fp, 1112(sp)
    addi fp, sp, 1120
    sw   a0, -1120(fp)
    sw   a1, -1116(fp)
_entry_2:
    addi t0, fp, -1116
    sw   t0, -1044(fp)
    lw   t0, -1044(fp)
    lw   t0, 0(t0)
    sw   t0, -1040(fp)
    lw   t0, -1040(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -1036(fp)
    addi t0, fp, -1112
    sw   t0, -1032(fp)
    lw   t2, -1032(fp)
    lw   t0, -1036(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -1028(fp)
    lw   t0, -1028(fp)
    lw   t0, 0(t0)
    sw   t0, -1024(fp)
    lw   t0, -1024(fp)
    li   t1, 2
    add  t0, t0, t1
    sw   t0, -1020(fp)
    addi t0, fp, -1120
    sw   t0, -1016(fp)
    lw   t0, -1016(fp)
    lw   t0, 0(t0)
    sw   t0, -1012(fp)
    lw   t0, -1020(fp)
    lw   t1, -1012(fp)
    add  t0, t0, t1
    sw   t0, -1008(fp)
    addi t0, fp, -1108
    sw   t0, -1004(fp)
    lw   t2, -1004(fp)
    lw   t0, -1008(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -1000(fp)
    lw   t0, -1000(fp)
    lw   t0, 0(t0)
    sw   t0, -996(fp)
    lw   t0, -996(fp)
    li   t1, 3
    add  t0, t0, t1
    sw   t0, -992(fp)
    addi t0, fp, -1104
    sw   t0, -988(fp)
    lw   t2, -988(fp)
    lw   t0, -992(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -984(fp)
    lw   t0, -984(fp)
    lw   t0, 0(t0)
    sw   t0, -980(fp)
    lw   t0, -980(fp)
    li   t1, 4
    add  t0, t0, t1
    sw   t0, -976(fp)
    addi t0, fp, -1120
    sw   t0, -972(fp)
    lw   t0, -972(fp)
    lw   t0, 0(t0)
    sw   t0, -968(fp)
    lw   t0, -976(fp)
    lw   t1, -968(fp)
    add  t0, t0, t1
    sw   t0, -964(fp)
    addi t0, fp, -1100
    sw   t0, -960(fp)
    lw   t2, -960(fp)
    lw   t0, -964(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -956(fp)
    lw   t0, -956(fp)
    lw   t0, 0(t0)
    sw   t0, -952(fp)
    lw   t0, -952(fp)
    li   t1, 5
    add  t0, t0, t1
    sw   t0, -948(fp)
    addi t0, fp, -1096
    sw   t0, -944(fp)
    lw   t2, -944(fp)
    lw   t0, -948(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -940(fp)
    lw   t0, -940(fp)
    lw   t0, 0(t0)
    sw   t0, -936(fp)
    lw   t0, -936(fp)
    li   t1, 6
    add  t0, t0, t1
    sw   t0, -932(fp)
    addi t0, fp, -1120
    sw   t0, -928(fp)
    lw   t0, -928(fp)
    lw   t0, 0(t0)
    sw   t0, -924(fp)
    lw   t0, -932(fp)
    lw   t1, -924(fp)
    add  t0, t0, t1
    sw   t0, -920(fp)
    addi t0, fp, -1092
    sw   t0, -916(fp)
    lw   t2, -916(fp)
    lw   t0, -920(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -912(fp)
    lw   t0, -912(fp)
    lw   t0, 0(t0)
    sw   t0, -908(fp)
    lw   t0, -908(fp)
    li   t1, 7
    add  t0, t0, t1
    sw   t0, -904(fp)
    addi t0, fp, -1088
    sw   t0, -900(fp)
    lw   t2, -900(fp)
    lw   t0, -904(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -896(fp)
    lw   t0, -896(fp)
    lw   t0, 0(t0)
    sw   t0, -892(fp)
    lw   t0, -892(fp)
    li   t1, 8
    add  t0, t0, t1
    sw   t0, -888(fp)
    addi t0, fp, -1120
    sw   t0, -884(fp)
    lw   t0, -884(fp)
    lw   t0, 0(t0)
    sw   t0, -880(fp)
    lw   t0, -888(fp)
    lw   t1, -880(fp)
    add  t0, t0, t1
    sw   t0, -876(fp)
    addi t0, fp, -1084
    sw   t0, -872(fp)
    lw   t2, -872(fp)
    lw   t0, -876(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -868(fp)
    lw   t0, -868(fp)
    lw   t0, 0(t0)
    sw   t0, -864(fp)
    lw   t0, -864(fp)
    li   t1, 9
    add  t0, t0, t1
    sw   t0, -860(fp)
    addi t0, fp, -1080
    sw   t0, -856(fp)
    lw   t2, -856(fp)
    lw   t0, -860(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -852(fp)
    lw   t0, -852(fp)
    lw   t0, 0(t0)
    sw   t0, -848(fp)
    lw   t0, -848(fp)
    li   t1, 10
    add  t0, t0, t1
    sw   t0, -844(fp)
    addi t0, fp, -1120
    sw   t0, -840(fp)
    lw   t0, -840(fp)
    lw   t0, 0(t0)
    sw   t0, -836(fp)
    lw   t0, -844(fp)
    lw   t1, -836(fp)
    add  t0, t0, t1
    sw   t0, -832(fp)
    addi t0, fp, -1076
    sw   t0, -828(fp)
    lw   t2, -828(fp)
    lw   t0, -832(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -824(fp)
    lw   t0, -824(fp)
    lw   t0, 0(t0)
    sw   t0, -820(fp)
    lw   t0, -820(fp)
    li   t1, 11
    add  t0, t0, t1
    sw   t0, -816(fp)
    addi t0, fp, -1072
    sw   t0, -812(fp)
    lw   t2, -812(fp)
    lw   t0, -816(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1116
    sw   t0, -808(fp)
    lw   t0, -808(fp)
    lw   t0, 0(t0)
    sw   t0, -804(fp)
    lw   t0, -804(fp)
    li   t1, 12
    add  t0, t0, t1
    sw   t0, -800(fp)
    addi t0, fp, -1120
    sw   t0, -796(fp)
    lw   t0, -796(fp)
    lw   t0, 0(t0)
    sw   t0, -792(fp)
    lw   t0, -800(fp)
    lw   t1, -792(fp)
    add  t0, t0, t1
    sw   t0, -788(fp)
    addi t0, fp, -1068
    sw   t0, -784(fp)
    lw   t2, -784(fp)
    lw   t0, -788(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1112
    sw   t0, -780(fp)
    lw   t0, -780(fp)
    lw   t0, 0(t0)
    sw   t0, -776(fp)
    addi t0, fp, -1108
    sw   t0, -772(fp)
    lw   t0, -772(fp)
    lw   t0, 0(t0)
    sw   t0, -768(fp)
    li   t0, 2
    lw   t1, -768(fp)
    mul  t0, t0, t1
    sw   t0, -764(fp)
    lw   t0, -776(fp)
    lw   t1, -764(fp)
    add  t0, t0, t1
    sw   t0, -760(fp)
    addi t0, fp, -1104
    sw   t0, -756(fp)
    lw   t0, -756(fp)
    lw   t0, 0(t0)
    sw   t0, -752(fp)
    li   t0, 3
    lw   t1, -752(fp)
    mul  t0, t0, t1
    sw   t0, -748(fp)
    lw   t0, -760(fp)
    lw   t1, -748(fp)
    add  t0, t0, t1
    sw   t0, -744(fp)
    addi t0, fp, -1100
    sw   t0, -740(fp)
    lw   t0, -740(fp)
    lw   t0, 0(t0)
    sw   t0, -736(fp)
    li   t0, 4
    lw   t1, -736(fp)
    mul  t0, t0, t1
    sw   t0, -732(fp)
    lw   t0, -744(fp)
    lw   t1, -732(fp)
    add  t0, t0, t1
    sw   t0, -728(fp)
    addi t0, fp, -1096
    sw   t0, -724(fp)
    lw   t0, -724(fp)
    lw   t0, 0(t0)
    sw   t0, -720(fp)
    li   t0, 5
    lw   t1, -720(fp)
    mul  t0, t0, t1
    sw   t0, -716(fp)
    lw   t0, -728(fp)
    lw   t1, -716(fp)
    add  t0, t0, t1
    sw   t0, -712(fp)
    addi t0, fp, -1092
    sw   t0, -708(fp)
    lw   t0, -708(fp)
    lw   t0, 0(t0)
    sw   t0, -704(fp)
    li   t0, 6
    lw   t1, -704(fp)
    mul  t0, t0, t1
    sw   t0, -700(fp)
    lw   t0, -712(fp)
    lw   t1, -700(fp)
    add  t0, t0, t1
    sw   t0, -696(fp)
    addi t0, fp, -1088
    sw   t0, -692(fp)
    lw   t0, -692(fp)
    lw   t0, 0(t0)
    sw   t0, -688(fp)
    li   t0, 7
    lw   t1, -688(fp)
    mul  t0, t0, t1
    sw   t0, -684(fp)
    lw   t0, -696(fp)
    lw   t1, -684(fp)
    add  t0, t0, t1
    sw   t0, -680(fp)
    addi t0, fp, -1084
    sw   t0, -676(fp)
    lw   t0, -676(fp)
    lw   t0, 0(t0)
    sw   t0, -672(fp)
    li   t0, 8
    lw   t1, -672(fp)
    mul  t0, t0, t1
    sw   t0, -668(fp)
    lw   t0, -680(fp)
    lw   t1, -668(fp)
    add  t0, t0, t1
    sw   t0, -664(fp)
    addi t0, fp, -1080
    sw   t0, -660(fp)
    lw   t0, -660(fp)
    lw   t0, 0(t0)
    sw   t0, -656(fp)
    li   t0, 9
    lw   t1, -656(fp)
    mul  t0, t0, t1
    sw   t0, -652(fp)
    lw   t0, -664(fp)
    lw   t1, -652(fp)
    add  t0, t0, t1
    sw   t0, -648(fp)
    addi t0, fp, -1076
    sw   t0, -644(fp)
    lw   t0, -644(fp)
    lw   t0, 0(t0)
    sw   t0, -640(fp)
    li   t0, 10
    lw   t1, -640(fp)
    mul  t0, t0, t1
    sw   t0, -636(fp)
    lw   t0, -648(fp)
    lw   t1, -636(fp)
    add  t0, t0, t1
    sw   t0, -632(fp)
    addi t0, fp, -1072
    sw   t0, -628(fp)
    lw   t0, -628(fp)
    lw   t0, 0(t0)
    sw   t0, -624(fp)
    li   t0, 11
    lw   t1, -624(fp)
    mul  t0, t0, t1
    sw   t0, -620(fp)
    lw   t0, -632(fp)
    lw   t1, -620(fp)
    add  t0, t0, t1
    sw   t0, -616(fp)
    addi t0, fp, -1068
    sw   t0, -612(fp)
    lw   t0, -612(fp)
    lw   t0, 0(t0)
    sw   t0, -608(fp)
    li   t0, 12
    lw   t1, -608(fp)
    mul  t0, t0, t1
    sw   t0, -604(fp)
    lw   t0, -616(fp)
    lw   t1, -604(fp)
    add  t0, t0, t1
    sw   t0, -600(fp)
    addi t0, fp, -1064
    sw   t0, -596(fp)
    lw   t2, -596(fp)
    lw   t0, -600(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1060
    sw   t0, -592(fp)
    lw   t2, -592(fp)
    li   t0, 0
    sw   t0, 0(t2)
    addi t0, fp, -1056
    sw   t0, -588(fp)
    lw   t2, -588(fp)
    li   t0, 0
    sw   t0, 0(t2)
    addi t0, fp, -1052
    sw   t0, -584(fp)
    lw   t2, -584(fp)
    li   t0, 0
    sw   t0, 0(t2)
    addi t0, fp, -1120
    sw   t0, -580(fp)
    lw   t0, -580(fp)
    lw   t0, 0(t0)
    sw   t0, -576(fp)
    lw   t0, -576(fp)
    li   t1, 0
    sub  t0, t0, t1
    seqz t0, t0
    sw   t0, -572(fp)
    lw   t0, -572(fp)
    beqz t0, _if_else_4
    j    _if_then_3
_if_then_3:
    addi t0, fp, -1112
    sw   t0, -568(fp)
    lw   t0, -568(fp)
    lw   t0, 0(t0)
    sw   t0, -564(fp)
    addi t0, fp, -1108
    sw   t0, -560(fp)
    lw   t0, -560(fp)
    lw   t0, 0(t0)
    sw   t0, -556(fp)
    addi t0, fp, -1104
    sw   t0, -552(fp)
    lw   t0, -552(fp)
    lw   t0, 0(t0)
    sw   t0, -548(fp)
    addi t0, fp, -1100
    sw   t0, -544(fp)
    lw   t0, -544(fp)
    lw   t0, 0(t0)
    sw   t0, -540(fp)
    addi t0, fp, -1096
    sw   t0, -536(fp)
    lw   t0, -536(fp)
    lw   t0, 0(t0)
    sw   t0, -532(fp)
    addi t0, fp, -1092
    sw   t0, -528(fp)
    lw   t0, -528(fp)
    lw   t0, 0(t0)
    sw   t0, -524(fp)
    lw   a0, -564(fp)
    lw   a1, -556(fp)
    lw   a2, -548(fp)
    lw   a3, -540(fp)
    lw   a4, -532(fp)
    lw   a5, -524(fp)
    call __fcc_func_combine
    sw   a0, -520(fp)
    addi t0, fp, -1088
    sw   t0, -516(fp)
    lw   t0, -516(fp)
    lw   t0, 0(t0)
    sw   t0, -512(fp)
    addi t0, fp, -1084
    sw   t0, -508(fp)
    lw   t0, -508(fp)
    lw   t0, 0(t0)
    sw   t0, -504(fp)
    addi t0, fp, -1080
    sw   t0, -500(fp)
    lw   t0, -500(fp)
    lw   t0, 0(t0)
    sw   t0, -496(fp)
    addi t0, fp, -1076
    sw   t0, -492(fp)
    lw   t0, -492(fp)
    lw   t0, 0(t0)
    sw   t0, -488(fp)
    addi t0, fp, -1072
    sw   t0, -484(fp)
    lw   t0, -484(fp)
    lw   t0, 0(t0)
    sw   t0, -480(fp)
    addi t0, fp, -1068
    sw   t0, -476(fp)
    lw   t0, -476(fp)
    lw   t0, 0(t0)
    sw   t0, -472(fp)
    lw   a0, -512(fp)
    lw   a1, -504(fp)
    lw   a2, -496(fp)
    lw   a3, -488(fp)
    lw   a4, -480(fp)
    lw   a5, -472(fp)
    call __fcc_func_combine
    sw   a0, -468(fp)
    lw   t0, -520(fp)
    lw   t1, -468(fp)
    add  t0, t0, t1
    sw   t0, -464(fp)
    addi t0, fp, -1052
    sw   t0, -460(fp)
    lw   t2, -460(fp)
    lw   t0, -464(fp)
    sw   t0, 0(t2)
    j    _if_end_5
_if_else_4:
    addi t0, fp, -1120
    sw   t0, -456(fp)
    lw   t0, -456(fp)
    lw   t0, 0(t0)
    sw   t0, -452(fp)
    lw   t0, -452(fp)
    li   t1, 1
    sub  t0, t0, t1
    sw   t0, -448(fp)
    addi t0, fp, -1116
    sw   t0, -444(fp)
    lw   t0, -444(fp)
    lw   t0, 0(t0)
    sw   t0, -440(fp)
    lw   t0, -440(fp)
    li   t1, 2
    add  t0, t0, t1
    sw   t0, -436(fp)
    lw   a0, -448(fp)
    lw   a1, -436(fp)
    call __fcc_func_pressure
    sw   a0, -432(fp)
    addi t0, fp, -1060
    sw   t0, -428(fp)
    lw   t2, -428(fp)
    lw   t0, -432(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1112
    sw   t0, -424(fp)
    lw   t0, -424(fp)
    lw   t0, 0(t0)
    sw   t0, -420(fp)
    addi t0, fp, -1108
    sw   t0, -416(fp)
    lw   t0, -416(fp)
    lw   t0, 0(t0)
    sw   t0, -412(fp)
    addi t0, fp, -1104
    sw   t0, -408(fp)
    lw   t0, -408(fp)
    lw   t0, 0(t0)
    sw   t0, -404(fp)
    lw   a0, -420(fp)
    lw   a1, -412(fp)
    lw   a2, -404(fp)
    call __fcc_func_leaf
    sw   a0, -400(fp)
    addi t0, fp, -1100
    sw   t0, -396(fp)
    lw   t0, -396(fp)
    lw   t0, 0(t0)
    sw   t0, -392(fp)
    addi t0, fp, -1096
    sw   t0, -388(fp)
    lw   t0, -388(fp)
    lw   t0, 0(t0)
    sw   t0, -384(fp)
    addi t0, fp, -1092
    sw   t0, -380(fp)
    lw   t0, -380(fp)
    lw   t0, 0(t0)
    sw   t0, -376(fp)
    lw   a0, -392(fp)
    lw   a1, -384(fp)
    lw   a2, -376(fp)
    call __fcc_func_leaf
    sw   a0, -372(fp)
    addi t0, fp, -1088
    sw   t0, -368(fp)
    lw   t0, -368(fp)
    lw   t0, 0(t0)
    sw   t0, -364(fp)
    addi t0, fp, -1084
    sw   t0, -360(fp)
    lw   t0, -360(fp)
    lw   t0, 0(t0)
    sw   t0, -356(fp)
    addi t0, fp, -1080
    sw   t0, -352(fp)
    lw   t0, -352(fp)
    lw   t0, 0(t0)
    sw   t0, -348(fp)
    lw   a0, -364(fp)
    lw   a1, -356(fp)
    lw   a2, -348(fp)
    call __fcc_func_leaf
    sw   a0, -344(fp)
    addi t0, fp, -1076
    sw   t0, -340(fp)
    lw   t0, -340(fp)
    lw   t0, 0(t0)
    sw   t0, -336(fp)
    addi t0, fp, -1072
    sw   t0, -332(fp)
    lw   t0, -332(fp)
    lw   t0, 0(t0)
    sw   t0, -328(fp)
    addi t0, fp, -1068
    sw   t0, -324(fp)
    lw   t0, -324(fp)
    lw   t0, 0(t0)
    sw   t0, -320(fp)
    lw   a0, -400(fp)
    lw   a1, -372(fp)
    lw   a2, -344(fp)
    lw   a3, -336(fp)
    lw   a4, -328(fp)
    lw   a5, -320(fp)
    call __fcc_func_combine
    sw   a0, -316(fp)
    addi t0, fp, -1056
    sw   t0, -312(fp)
    lw   t2, -312(fp)
    lw   t0, -316(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1064
    sw   t0, -308(fp)
    lw   t0, -308(fp)
    lw   t0, 0(t0)
    sw   t0, -304(fp)
    addi t0, fp, -1060
    sw   t0, -300(fp)
    lw   t0, -300(fp)
    lw   t0, 0(t0)
    sw   t0, -296(fp)
    lw   t0, -304(fp)
    lw   t1, -296(fp)
    add  t0, t0, t1
    sw   t0, -292(fp)
    addi t0, fp, -1056
    sw   t0, -288(fp)
    lw   t0, -288(fp)
    lw   t0, 0(t0)
    sw   t0, -284(fp)
    lw   t0, -292(fp)
    lw   t1, -284(fp)
    add  t0, t0, t1
    sw   t0, -280(fp)
    addi t0, fp, -1052
    sw   t0, -276(fp)
    lw   t2, -276(fp)
    lw   t0, -280(fp)
    sw   t0, 0(t2)
    j    _if_end_5
_if_end_5:
    addi t0, fp, -1068
    sw   t0, -272(fp)
    lw   t0, -272(fp)
    lw   t0, 0(t0)
    sw   t0, -268(fp)
    addi t0, fp, -1072
    sw   t0, -264(fp)
    lw   t0, -264(fp)
    lw   t0, 0(t0)
    sw   t0, -260(fp)
    li   t0, 2
    lw   t1, -260(fp)
    mul  t0, t0, t1
    sw   t0, -256(fp)
    lw   t0, -268(fp)
    lw   t1, -256(fp)
    add  t0, t0, t1
    sw   t0, -252(fp)
    addi t0, fp, -1076
    sw   t0, -248(fp)
    lw   t0, -248(fp)
    lw   t0, 0(t0)
    sw   t0, -244(fp)
    li   t0, 3
    lw   t1, -244(fp)
    mul  t0, t0, t1
    sw   t0, -240(fp)
    lw   t0, -252(fp)
    lw   t1, -240(fp)
    add  t0, t0, t1
    sw   t0, -236(fp)
    addi t0, fp, -1080
    sw   t0, -232(fp)
    lw   t0, -232(fp)
    lw   t0, 0(t0)
    sw   t0, -228(fp)
    li   t0, 4
    lw   t1, -228(fp)
    mul  t0, t0, t1
    sw   t0, -224(fp)
    lw   t0, -236(fp)
    lw   t1, -224(fp)
    add  t0, t0, t1
    sw   t0, -220(fp)
    addi t0, fp, -1084
    sw   t0, -216(fp)
    lw   t0, -216(fp)
    lw   t0, 0(t0)
    sw   t0, -212(fp)
    li   t0, 5
    lw   t1, -212(fp)
    mul  t0, t0, t1
    sw   t0, -208(fp)
    lw   t0, -220(fp)
    lw   t1, -208(fp)
    add  t0, t0, t1
    sw   t0, -204(fp)
    addi t0, fp, -1088
    sw   t0, -200(fp)
    lw   t0, -200(fp)
    lw   t0, 0(t0)
    sw   t0, -196(fp)
    li   t0, 6
    lw   t1, -196(fp)
    mul  t0, t0, t1
    sw   t0, -192(fp)
    lw   t0, -204(fp)
    lw   t1, -192(fp)
    add  t0, t0, t1
    sw   t0, -188(fp)
    addi t0, fp, -1092
    sw   t0, -184(fp)
    lw   t0, -184(fp)
    lw   t0, 0(t0)
    sw   t0, -180(fp)
    li   t0, 7
    lw   t1, -180(fp)
    mul  t0, t0, t1
    sw   t0, -176(fp)
    lw   t0, -188(fp)
    lw   t1, -176(fp)
    add  t0, t0, t1
    sw   t0, -172(fp)
    addi t0, fp, -1096
    sw   t0, -168(fp)
    lw   t0, -168(fp)
    lw   t0, 0(t0)
    sw   t0, -164(fp)
    li   t0, 8
    lw   t1, -164(fp)
    mul  t0, t0, t1
    sw   t0, -160(fp)
    lw   t0, -172(fp)
    lw   t1, -160(fp)
    add  t0, t0, t1
    sw   t0, -156(fp)
    addi t0, fp, -1100
    sw   t0, -152(fp)
    lw   t0, -152(fp)
    lw   t0, 0(t0)
    sw   t0, -148(fp)
    li   t0, 9
    lw   t1, -148(fp)
    mul  t0, t0, t1
    sw   t0, -144(fp)
    lw   t0, -156(fp)
    lw   t1, -144(fp)
    add  t0, t0, t1
    sw   t0, -140(fp)
    addi t0, fp, -1104
    sw   t0, -136(fp)
    lw   t0, -136(fp)
    lw   t0, 0(t0)
    sw   t0, -132(fp)
    li   t0, 10
    lw   t1, -132(fp)
    mul  t0, t0, t1
    sw   t0, -128(fp)
    lw   t0, -140(fp)
    lw   t1, -128(fp)
    add  t0, t0, t1
    sw   t0, -124(fp)
    addi t0, fp, -1108
    sw   t0, -120(fp)
    lw   t0, -120(fp)
    lw   t0, 0(t0)
    sw   t0, -116(fp)
    li   t0, 11
    lw   t1, -116(fp)
    mul  t0, t0, t1
    sw   t0, -112(fp)
    lw   t0, -124(fp)
    lw   t1, -112(fp)
    add  t0, t0, t1
    sw   t0, -108(fp)
    addi t0, fp, -1112
    sw   t0, -104(fp)
    lw   t0, -104(fp)
    lw   t0, 0(t0)
    sw   t0, -100(fp)
    li   t0, 12
    lw   t1, -100(fp)
    mul  t0, t0, t1
    sw   t0, -96(fp)
    lw   t0, -108(fp)
    lw   t1, -96(fp)
    add  t0, t0, t1
    sw   t0, -92(fp)
    addi t0, fp, -1048
    sw   t0, -88(fp)
    lw   t2, -88(fp)
    lw   t0, -92(fp)
    sw   t0, 0(t2)
    la   a0, _str0
    call putstr
    addi t0, fp, -1120
    sw   t0, -84(fp)
    lw   t0, -84(fp)
    lw   t0, 0(t0)
    sw   t0, -80(fp)
    lw   a0, -80(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1116
    sw   t0, -76(fp)
    lw   t0, -76(fp)
    lw   t0, 0(t0)
    sw   t0, -72(fp)
    lw   a0, -72(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1064
    sw   t0, -68(fp)
    lw   t0, -68(fp)
    lw   t0, 0(t0)
    sw   t0, -64(fp)
    lw   a0, -64(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1048
    sw   t0, -60(fp)
    lw   t0, -60(fp)
    lw   t0, 0(t0)
    sw   t0, -56(fp)
    lw   a0, -56(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1060
    sw   t0, -52(fp)
    lw   t0, -52(fp)
    lw   t0, 0(t0)
    sw   t0, -48(fp)
    lw   a0, -48(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1056
    sw   t0, -44(fp)
    lw   t0, -44(fp)
    lw   t0, 0(t0)
    sw   t0, -40(fp)
    lw   a0, -40(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1052
    sw   t0, -36(fp)
    lw   t0, -36(fp)
    lw   t0, 0(t0)
    sw   t0, -32(fp)
    lw   a0, -32(fp)
    call putint
    li   a0, 10
    call putchar
    addi t0, fp, -1052
    sw   t0, -28(fp)
    lw   t0, -28(fp)
    lw   t0, 0(t0)
    sw   t0, -24(fp)
    lw   a0, -24(fp)
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 1120
    ret
main:
    addi sp, sp, -1376
    sw   ra, 1372(sp)
    sw   fp, 1368(sp)
    addi fp, sp, 1376
_entry_6:
    call getint
    sw   a0, -1292(fp)
    addi t0, fp, -1376
    sw   t0, -1288(fp)
    lw   t2, -1288(fp)
    lw   t0, -1292(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1284(fp)
    lw   t0, -1284(fp)
    lw   t0, 0(t0)
    sw   t0, -1280(fp)
    lw   t0, -1280(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -1276(fp)
    addi t0, fp, -1372
    sw   t0, -1272(fp)
    lw   t2, -1272(fp)
    lw   t0, -1276(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1268(fp)
    lw   t0, -1268(fp)
    lw   t0, 0(t0)
    sw   t0, -1264(fp)
    lw   t0, -1264(fp)
    li   t1, 2
    add  t0, t0, t1
    sw   t0, -1260(fp)
    addi t0, fp, -1368
    sw   t0, -1256(fp)
    lw   t2, -1256(fp)
    lw   t0, -1260(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1252(fp)
    lw   t0, -1252(fp)
    lw   t0, 0(t0)
    sw   t0, -1248(fp)
    lw   t0, -1248(fp)
    li   t1, 3
    add  t0, t0, t1
    sw   t0, -1244(fp)
    addi t0, fp, -1364
    sw   t0, -1240(fp)
    lw   t2, -1240(fp)
    lw   t0, -1244(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1236(fp)
    lw   t0, -1236(fp)
    lw   t0, 0(t0)
    sw   t0, -1232(fp)
    lw   t0, -1232(fp)
    li   t1, 4
    add  t0, t0, t1
    sw   t0, -1228(fp)
    addi t0, fp, -1360
    sw   t0, -1224(fp)
    lw   t2, -1224(fp)
    lw   t0, -1228(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1220(fp)
    lw   t0, -1220(fp)
    lw   t0, 0(t0)
    sw   t0, -1216(fp)
    lw   t0, -1216(fp)
    li   t1, 5
    add  t0, t0, t1
    sw   t0, -1212(fp)
    addi t0, fp, -1356
    sw   t0, -1208(fp)
    lw   t2, -1208(fp)
    lw   t0, -1212(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1204(fp)
    lw   t0, -1204(fp)
    lw   t0, 0(t0)
    sw   t0, -1200(fp)
    lw   t0, -1200(fp)
    li   t1, 6
    add  t0, t0, t1
    sw   t0, -1196(fp)
    addi t0, fp, -1352
    sw   t0, -1192(fp)
    lw   t2, -1192(fp)
    lw   t0, -1196(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1188(fp)
    lw   t0, -1188(fp)
    lw   t0, 0(t0)
    sw   t0, -1184(fp)
    lw   t0, -1184(fp)
    li   t1, 7
    add  t0, t0, t1
    sw   t0, -1180(fp)
    addi t0, fp, -1348
    sw   t0, -1176(fp)
    lw   t2, -1176(fp)
    lw   t0, -1180(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1172(fp)
    lw   t0, -1172(fp)
    lw   t0, 0(t0)
    sw   t0, -1168(fp)
    lw   t0, -1168(fp)
    li   t1, 8
    add  t0, t0, t1
    sw   t0, -1164(fp)
    addi t0, fp, -1344
    sw   t0, -1160(fp)
    lw   t2, -1160(fp)
    lw   t0, -1164(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1156(fp)
    lw   t0, -1156(fp)
    lw   t0, 0(t0)
    sw   t0, -1152(fp)
    lw   t0, -1152(fp)
    li   t1, 9
    add  t0, t0, t1
    sw   t0, -1148(fp)
    addi t0, fp, -1340
    sw   t0, -1144(fp)
    lw   t2, -1144(fp)
    lw   t0, -1148(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1140(fp)
    lw   t0, -1140(fp)
    lw   t0, 0(t0)
    sw   t0, -1136(fp)
    lw   t0, -1136(fp)
    li   t1, 10
    add  t0, t0, t1
    sw   t0, -1132(fp)
    addi t0, fp, -1336
    sw   t0, -1128(fp)
    lw   t2, -1128(fp)
    lw   t0, -1132(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1124(fp)
    lw   t0, -1124(fp)
    lw   t0, 0(t0)
    sw   t0, -1120(fp)
    lw   t0, -1120(fp)
    li   t1, 11
    add  t0, t0, t1
    sw   t0, -1116(fp)
    addi t0, fp, -1332
    sw   t0, -1112(fp)
    lw   t2, -1112(fp)
    lw   t0, -1116(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1108(fp)
    lw   t0, -1108(fp)
    lw   t0, 0(t0)
    sw   t0, -1104(fp)
    lw   t0, -1104(fp)
    li   t1, 12
    add  t0, t0, t1
    sw   t0, -1100(fp)
    addi t0, fp, -1328
    sw   t0, -1096(fp)
    lw   t2, -1096(fp)
    lw   t0, -1100(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1092(fp)
    lw   t0, -1092(fp)
    lw   t0, 0(t0)
    sw   t0, -1088(fp)
    lw   t0, -1088(fp)
    li   t1, 13
    add  t0, t0, t1
    sw   t0, -1084(fp)
    addi t0, fp, -1324
    sw   t0, -1080(fp)
    lw   t2, -1080(fp)
    lw   t0, -1084(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1076(fp)
    lw   t0, -1076(fp)
    lw   t0, 0(t0)
    sw   t0, -1072(fp)
    lw   t0, -1072(fp)
    li   t1, 14
    add  t0, t0, t1
    sw   t0, -1068(fp)
    addi t0, fp, -1320
    sw   t0, -1064(fp)
    lw   t2, -1064(fp)
    lw   t0, -1068(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1060(fp)
    lw   t0, -1060(fp)
    lw   t0, 0(t0)
    sw   t0, -1056(fp)
    lw   t0, -1056(fp)
    li   t1, 15
    add  t0, t0, t1
    sw   t0, -1052(fp)
    addi t0, fp, -1316
    sw   t0, -1048(fp)
    lw   t2, -1048(fp)
    lw   t0, -1052(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1376
    sw   t0, -1044(fp)
    lw   t0, -1044(fp)
    lw   t0, 0(t0)
    sw   t0, -1040(fp)
    lw   t0, -1040(fp)
    li   t1, 16
    add  t0, t0, t1
    sw   t0, -1036(fp)
    addi t0, fp, -1312
    sw   t0, -1032(fp)
    lw   t2, -1032(fp)
    lw   t0, -1036(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1372
    sw   t0, -1028(fp)
    lw   t0, -1028(fp)
    lw   t0, 0(t0)
    sw   t0, -1024(fp)
    addi t0, fp, -1368
    sw   t0, -1020(fp)
    lw   t0, -1020(fp)
    lw   t0, 0(t0)
    sw   t0, -1016(fp)
    li   t0, 2
    lw   t1, -1016(fp)
    mul  t0, t0, t1
    sw   t0, -1012(fp)
    lw   t0, -1024(fp)
    lw   t1, -1012(fp)
    add  t0, t0, t1
    sw   t0, -1008(fp)
    addi t0, fp, -1364
    sw   t0, -1004(fp)
    lw   t0, -1004(fp)
    lw   t0, 0(t0)
    sw   t0, -1000(fp)
    li   t0, 3
    lw   t1, -1000(fp)
    mul  t0, t0, t1
    sw   t0, -996(fp)
    lw   t0, -1008(fp)
    lw   t1, -996(fp)
    add  t0, t0, t1
    sw   t0, -992(fp)
    addi t0, fp, -1360
    sw   t0, -988(fp)
    lw   t0, -988(fp)
    lw   t0, 0(t0)
    sw   t0, -984(fp)
    li   t0, 4
    lw   t1, -984(fp)
    mul  t0, t0, t1
    sw   t0, -980(fp)
    lw   t0, -992(fp)
    lw   t1, -980(fp)
    add  t0, t0, t1
    sw   t0, -976(fp)
    addi t0, fp, -1356
    sw   t0, -972(fp)
    lw   t0, -972(fp)
    lw   t0, 0(t0)
    sw   t0, -968(fp)
    li   t0, 5
    lw   t1, -968(fp)
    mul  t0, t0, t1
    sw   t0, -964(fp)
    lw   t0, -976(fp)
    lw   t1, -964(fp)
    add  t0, t0, t1
    sw   t0, -960(fp)
    addi t0, fp, -1352
    sw   t0, -956(fp)
    lw   t0, -956(fp)
    lw   t0, 0(t0)
    sw   t0, -952(fp)
    li   t0, 6
    lw   t1, -952(fp)
    mul  t0, t0, t1
    sw   t0, -948(fp)
    lw   t0, -960(fp)
    lw   t1, -948(fp)
    add  t0, t0, t1
    sw   t0, -944(fp)
    addi t0, fp, -1348
    sw   t0, -940(fp)
    lw   t0, -940(fp)
    lw   t0, 0(t0)
    sw   t0, -936(fp)
    li   t0, 7
    lw   t1, -936(fp)
    mul  t0, t0, t1
    sw   t0, -932(fp)
    lw   t0, -944(fp)
    lw   t1, -932(fp)
    add  t0, t0, t1
    sw   t0, -928(fp)
    addi t0, fp, -1344
    sw   t0, -924(fp)
    lw   t0, -924(fp)
    lw   t0, 0(t0)
    sw   t0, -920(fp)
    li   t0, 8
    lw   t1, -920(fp)
    mul  t0, t0, t1
    sw   t0, -916(fp)
    lw   t0, -928(fp)
    lw   t1, -916(fp)
    add  t0, t0, t1
    sw   t0, -912(fp)
    addi t0, fp, -1340
    sw   t0, -908(fp)
    lw   t0, -908(fp)
    lw   t0, 0(t0)
    sw   t0, -904(fp)
    li   t0, 9
    lw   t1, -904(fp)
    mul  t0, t0, t1
    sw   t0, -900(fp)
    lw   t0, -912(fp)
    lw   t1, -900(fp)
    add  t0, t0, t1
    sw   t0, -896(fp)
    addi t0, fp, -1336
    sw   t0, -892(fp)
    lw   t0, -892(fp)
    lw   t0, 0(t0)
    sw   t0, -888(fp)
    li   t0, 10
    lw   t1, -888(fp)
    mul  t0, t0, t1
    sw   t0, -884(fp)
    lw   t0, -896(fp)
    lw   t1, -884(fp)
    add  t0, t0, t1
    sw   t0, -880(fp)
    addi t0, fp, -1332
    sw   t0, -876(fp)
    lw   t0, -876(fp)
    lw   t0, 0(t0)
    sw   t0, -872(fp)
    li   t0, 11
    lw   t1, -872(fp)
    mul  t0, t0, t1
    sw   t0, -868(fp)
    lw   t0, -880(fp)
    lw   t1, -868(fp)
    add  t0, t0, t1
    sw   t0, -864(fp)
    addi t0, fp, -1328
    sw   t0, -860(fp)
    lw   t0, -860(fp)
    lw   t0, 0(t0)
    sw   t0, -856(fp)
    li   t0, 12
    lw   t1, -856(fp)
    mul  t0, t0, t1
    sw   t0, -852(fp)
    lw   t0, -864(fp)
    lw   t1, -852(fp)
    add  t0, t0, t1
    sw   t0, -848(fp)
    addi t0, fp, -1324
    sw   t0, -844(fp)
    lw   t0, -844(fp)
    lw   t0, 0(t0)
    sw   t0, -840(fp)
    li   t0, 13
    lw   t1, -840(fp)
    mul  t0, t0, t1
    sw   t0, -836(fp)
    lw   t0, -848(fp)
    lw   t1, -836(fp)
    add  t0, t0, t1
    sw   t0, -832(fp)
    addi t0, fp, -1320
    sw   t0, -828(fp)
    lw   t0, -828(fp)
    lw   t0, 0(t0)
    sw   t0, -824(fp)
    li   t0, 14
    lw   t1, -824(fp)
    mul  t0, t0, t1
    sw   t0, -820(fp)
    lw   t0, -832(fp)
    lw   t1, -820(fp)
    add  t0, t0, t1
    sw   t0, -816(fp)
    addi t0, fp, -1316
    sw   t0, -812(fp)
    lw   t0, -812(fp)
    lw   t0, 0(t0)
    sw   t0, -808(fp)
    li   t0, 15
    lw   t1, -808(fp)
    mul  t0, t0, t1
    sw   t0, -804(fp)
    lw   t0, -816(fp)
    lw   t1, -804(fp)
    add  t0, t0, t1
    sw   t0, -800(fp)
    addi t0, fp, -1312
    sw   t0, -796(fp)
    lw   t0, -796(fp)
    lw   t0, 0(t0)
    sw   t0, -792(fp)
    li   t0, 16
    lw   t1, -792(fp)
    mul  t0, t0, t1
    sw   t0, -788(fp)
    lw   t0, -800(fp)
    lw   t1, -788(fp)
    add  t0, t0, t1
    sw   t0, -784(fp)
    addi t0, fp, -1308
    sw   t0, -780(fp)
    lw   t2, -780(fp)
    lw   t0, -784(fp)
    sw   t0, 0(t2)
    la   a0, _str1
    call putstr
    addi t0, fp, -1372
    sw   t0, -776(fp)
    lw   t0, -776(fp)
    lw   t0, 0(t0)
    sw   t0, -772(fp)
    lw   a0, -772(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1368
    sw   t0, -768(fp)
    lw   t0, -768(fp)
    lw   t0, 0(t0)
    sw   t0, -764(fp)
    lw   a0, -764(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1364
    sw   t0, -760(fp)
    lw   t0, -760(fp)
    lw   t0, 0(t0)
    sw   t0, -756(fp)
    lw   a0, -756(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1360
    sw   t0, -752(fp)
    lw   t0, -752(fp)
    lw   t0, 0(t0)
    sw   t0, -748(fp)
    lw   a0, -748(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1356
    sw   t0, -744(fp)
    lw   t0, -744(fp)
    lw   t0, 0(t0)
    sw   t0, -740(fp)
    lw   a0, -740(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1352
    sw   t0, -736(fp)
    lw   t0, -736(fp)
    lw   t0, 0(t0)
    sw   t0, -732(fp)
    lw   a0, -732(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1348
    sw   t0, -728(fp)
    lw   t0, -728(fp)
    lw   t0, 0(t0)
    sw   t0, -724(fp)
    lw   a0, -724(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1344
    sw   t0, -720(fp)
    lw   t0, -720(fp)
    lw   t0, 0(t0)
    sw   t0, -716(fp)
    lw   a0, -716(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1340
    sw   t0, -712(fp)
    lw   t0, -712(fp)
    lw   t0, 0(t0)
    sw   t0, -708(fp)
    lw   a0, -708(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1336
    sw   t0, -704(fp)
    lw   t0, -704(fp)
    lw   t0, 0(t0)
    sw   t0, -700(fp)
    lw   a0, -700(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1332
    sw   t0, -696(fp)
    lw   t0, -696(fp)
    lw   t0, 0(t0)
    sw   t0, -692(fp)
    lw   a0, -692(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1328
    sw   t0, -688(fp)
    lw   t0, -688(fp)
    lw   t0, 0(t0)
    sw   t0, -684(fp)
    lw   a0, -684(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1324
    sw   t0, -680(fp)
    lw   t0, -680(fp)
    lw   t0, 0(t0)
    sw   t0, -676(fp)
    lw   a0, -676(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1320
    sw   t0, -672(fp)
    lw   t0, -672(fp)
    lw   t0, 0(t0)
    sw   t0, -668(fp)
    lw   a0, -668(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1316
    sw   t0, -664(fp)
    lw   t0, -664(fp)
    lw   t0, 0(t0)
    sw   t0, -660(fp)
    lw   a0, -660(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1312
    sw   t0, -656(fp)
    lw   t0, -656(fp)
    lw   t0, 0(t0)
    sw   t0, -652(fp)
    lw   a0, -652(fp)
    call putint
    li   a0, 10
    call putchar
    addi t0, fp, -1376
    sw   t0, -648(fp)
    lw   t0, -648(fp)
    lw   t0, 0(t0)
    sw   t0, -644(fp)
    li   a0, 4
    lw   a1, -644(fp)
    call __fcc_func_pressure
    sw   a0, -640(fp)
    addi t0, fp, -1304
    sw   t0, -636(fp)
    lw   t2, -636(fp)
    lw   t0, -640(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1372
    sw   t0, -632(fp)
    lw   t0, -632(fp)
    lw   t0, 0(t0)
    sw   t0, -628(fp)
    addi t0, fp, -1368
    sw   t0, -624(fp)
    lw   t0, -624(fp)
    lw   t0, 0(t0)
    sw   t0, -620(fp)
    addi t0, fp, -1364
    sw   t0, -616(fp)
    lw   t0, -616(fp)
    lw   t0, 0(t0)
    sw   t0, -612(fp)
    addi t0, fp, -1360
    sw   t0, -608(fp)
    lw   t0, -608(fp)
    lw   t0, 0(t0)
    sw   t0, -604(fp)
    addi t0, fp, -1356
    sw   t0, -600(fp)
    lw   t0, -600(fp)
    lw   t0, 0(t0)
    sw   t0, -596(fp)
    addi t0, fp, -1352
    sw   t0, -592(fp)
    lw   t0, -592(fp)
    lw   t0, 0(t0)
    sw   t0, -588(fp)
    lw   a0, -628(fp)
    lw   a1, -620(fp)
    lw   a2, -612(fp)
    lw   a3, -604(fp)
    lw   a4, -596(fp)
    lw   a5, -588(fp)
    call __fcc_func_combine
    sw   a0, -584(fp)
    addi t0, fp, -1348
    sw   t0, -580(fp)
    lw   t0, -580(fp)
    lw   t0, 0(t0)
    sw   t0, -576(fp)
    addi t0, fp, -1344
    sw   t0, -572(fp)
    lw   t0, -572(fp)
    lw   t0, 0(t0)
    sw   t0, -568(fp)
    addi t0, fp, -1340
    sw   t0, -564(fp)
    lw   t0, -564(fp)
    lw   t0, 0(t0)
    sw   t0, -560(fp)
    addi t0, fp, -1336
    sw   t0, -556(fp)
    lw   t0, -556(fp)
    lw   t0, 0(t0)
    sw   t0, -552(fp)
    addi t0, fp, -1332
    sw   t0, -548(fp)
    lw   t0, -548(fp)
    lw   t0, 0(t0)
    sw   t0, -544(fp)
    addi t0, fp, -1328
    sw   t0, -540(fp)
    lw   t0, -540(fp)
    lw   t0, 0(t0)
    sw   t0, -536(fp)
    lw   a0, -576(fp)
    lw   a1, -568(fp)
    lw   a2, -560(fp)
    lw   a3, -552(fp)
    lw   a4, -544(fp)
    lw   a5, -536(fp)
    call __fcc_func_combine
    sw   a0, -532(fp)
    lw   t0, -584(fp)
    lw   t1, -532(fp)
    add  t0, t0, t1
    sw   t0, -528(fp)
    addi t0, fp, -1324
    sw   t0, -524(fp)
    lw   t0, -524(fp)
    lw   t0, 0(t0)
    sw   t0, -520(fp)
    addi t0, fp, -1320
    sw   t0, -516(fp)
    lw   t0, -516(fp)
    lw   t0, 0(t0)
    sw   t0, -512(fp)
    addi t0, fp, -1316
    sw   t0, -508(fp)
    lw   t0, -508(fp)
    lw   t0, 0(t0)
    sw   t0, -504(fp)
    addi t0, fp, -1312
    sw   t0, -500(fp)
    lw   t0, -500(fp)
    lw   t0, 0(t0)
    sw   t0, -496(fp)
    addi t0, fp, -1372
    sw   t0, -492(fp)
    lw   t0, -492(fp)
    lw   t0, 0(t0)
    sw   t0, -488(fp)
    addi t0, fp, -1368
    sw   t0, -484(fp)
    lw   t0, -484(fp)
    lw   t0, 0(t0)
    sw   t0, -480(fp)
    lw   a0, -520(fp)
    lw   a1, -512(fp)
    lw   a2, -504(fp)
    lw   a3, -496(fp)
    lw   a4, -488(fp)
    lw   a5, -480(fp)
    call __fcc_func_combine
    sw   a0, -476(fp)
    lw   t0, -528(fp)
    lw   t1, -476(fp)
    add  t0, t0, t1
    sw   t0, -472(fp)
    addi t0, fp, -1300
    sw   t0, -468(fp)
    lw   t2, -468(fp)
    lw   t0, -472(fp)
    sw   t0, 0(t2)
    addi t0, fp, -1312
    sw   t0, -464(fp)
    lw   t0, -464(fp)
    lw   t0, 0(t0)
    sw   t0, -460(fp)
    addi t0, fp, -1316
    sw   t0, -456(fp)
    lw   t0, -456(fp)
    lw   t0, 0(t0)
    sw   t0, -452(fp)
    li   t0, 2
    lw   t1, -452(fp)
    mul  t0, t0, t1
    sw   t0, -448(fp)
    lw   t0, -460(fp)
    lw   t1, -448(fp)
    add  t0, t0, t1
    sw   t0, -444(fp)
    addi t0, fp, -1320
    sw   t0, -440(fp)
    lw   t0, -440(fp)
    lw   t0, 0(t0)
    sw   t0, -436(fp)
    li   t0, 3
    lw   t1, -436(fp)
    mul  t0, t0, t1
    sw   t0, -432(fp)
    lw   t0, -444(fp)
    lw   t1, -432(fp)
    add  t0, t0, t1
    sw   t0, -428(fp)
    addi t0, fp, -1324
    sw   t0, -424(fp)
    lw   t0, -424(fp)
    lw   t0, 0(t0)
    sw   t0, -420(fp)
    li   t0, 4
    lw   t1, -420(fp)
    mul  t0, t0, t1
    sw   t0, -416(fp)
    lw   t0, -428(fp)
    lw   t1, -416(fp)
    add  t0, t0, t1
    sw   t0, -412(fp)
    addi t0, fp, -1328
    sw   t0, -408(fp)
    lw   t0, -408(fp)
    lw   t0, 0(t0)
    sw   t0, -404(fp)
    li   t0, 5
    lw   t1, -404(fp)
    mul  t0, t0, t1
    sw   t0, -400(fp)
    lw   t0, -412(fp)
    lw   t1, -400(fp)
    add  t0, t0, t1
    sw   t0, -396(fp)
    addi t0, fp, -1332
    sw   t0, -392(fp)
    lw   t0, -392(fp)
    lw   t0, 0(t0)
    sw   t0, -388(fp)
    li   t0, 6
    lw   t1, -388(fp)
    mul  t0, t0, t1
    sw   t0, -384(fp)
    lw   t0, -396(fp)
    lw   t1, -384(fp)
    add  t0, t0, t1
    sw   t0, -380(fp)
    addi t0, fp, -1336
    sw   t0, -376(fp)
    lw   t0, -376(fp)
    lw   t0, 0(t0)
    sw   t0, -372(fp)
    li   t0, 7
    lw   t1, -372(fp)
    mul  t0, t0, t1
    sw   t0, -368(fp)
    lw   t0, -380(fp)
    lw   t1, -368(fp)
    add  t0, t0, t1
    sw   t0, -364(fp)
    addi t0, fp, -1340
    sw   t0, -360(fp)
    lw   t0, -360(fp)
    lw   t0, 0(t0)
    sw   t0, -356(fp)
    li   t0, 8
    lw   t1, -356(fp)
    mul  t0, t0, t1
    sw   t0, -352(fp)
    lw   t0, -364(fp)
    lw   t1, -352(fp)
    add  t0, t0, t1
    sw   t0, -348(fp)
    addi t0, fp, -1344
    sw   t0, -344(fp)
    lw   t0, -344(fp)
    lw   t0, 0(t0)
    sw   t0, -340(fp)
    li   t0, 9
    lw   t1, -340(fp)
    mul  t0, t0, t1
    sw   t0, -336(fp)
    lw   t0, -348(fp)
    lw   t1, -336(fp)
    add  t0, t0, t1
    sw   t0, -332(fp)
    addi t0, fp, -1348
    sw   t0, -328(fp)
    lw   t0, -328(fp)
    lw   t0, 0(t0)
    sw   t0, -324(fp)
    li   t0, 10
    lw   t1, -324(fp)
    mul  t0, t0, t1
    sw   t0, -320(fp)
    lw   t0, -332(fp)
    lw   t1, -320(fp)
    add  t0, t0, t1
    sw   t0, -316(fp)
    addi t0, fp, -1352
    sw   t0, -312(fp)
    lw   t0, -312(fp)
    lw   t0, 0(t0)
    sw   t0, -308(fp)
    li   t0, 11
    lw   t1, -308(fp)
    mul  t0, t0, t1
    sw   t0, -304(fp)
    lw   t0, -316(fp)
    lw   t1, -304(fp)
    add  t0, t0, t1
    sw   t0, -300(fp)
    addi t0, fp, -1356
    sw   t0, -296(fp)
    lw   t0, -296(fp)
    lw   t0, 0(t0)
    sw   t0, -292(fp)
    li   t0, 12
    lw   t1, -292(fp)
    mul  t0, t0, t1
    sw   t0, -288(fp)
    lw   t0, -300(fp)
    lw   t1, -288(fp)
    add  t0, t0, t1
    sw   t0, -284(fp)
    addi t0, fp, -1360
    sw   t0, -280(fp)
    lw   t0, -280(fp)
    lw   t0, 0(t0)
    sw   t0, -276(fp)
    li   t0, 13
    lw   t1, -276(fp)
    mul  t0, t0, t1
    sw   t0, -272(fp)
    lw   t0, -284(fp)
    lw   t1, -272(fp)
    add  t0, t0, t1
    sw   t0, -268(fp)
    addi t0, fp, -1364
    sw   t0, -264(fp)
    lw   t0, -264(fp)
    lw   t0, 0(t0)
    sw   t0, -260(fp)
    li   t0, 14
    lw   t1, -260(fp)
    mul  t0, t0, t1
    sw   t0, -256(fp)
    lw   t0, -268(fp)
    lw   t1, -256(fp)
    add  t0, t0, t1
    sw   t0, -252(fp)
    addi t0, fp, -1368
    sw   t0, -248(fp)
    lw   t0, -248(fp)
    lw   t0, 0(t0)
    sw   t0, -244(fp)
    li   t0, 15
    lw   t1, -244(fp)
    mul  t0, t0, t1
    sw   t0, -240(fp)
    lw   t0, -252(fp)
    lw   t1, -240(fp)
    add  t0, t0, t1
    sw   t0, -236(fp)
    addi t0, fp, -1372
    sw   t0, -232(fp)
    lw   t0, -232(fp)
    lw   t0, 0(t0)
    sw   t0, -228(fp)
    li   t0, 16
    lw   t1, -228(fp)
    mul  t0, t0, t1
    sw   t0, -224(fp)
    lw   t0, -236(fp)
    lw   t1, -224(fp)
    add  t0, t0, t1
    sw   t0, -220(fp)
    addi t0, fp, -1304
    sw   t0, -216(fp)
    lw   t0, -216(fp)
    lw   t0, 0(t0)
    sw   t0, -212(fp)
    lw   t0, -220(fp)
    lw   t1, -212(fp)
    add  t0, t0, t1
    sw   t0, -208(fp)
    addi t0, fp, -1300
    sw   t0, -204(fp)
    lw   t0, -204(fp)
    lw   t0, 0(t0)
    sw   t0, -200(fp)
    lw   t0, -208(fp)
    lw   t1, -200(fp)
    add  t0, t0, t1
    sw   t0, -196(fp)
    addi t0, fp, -1296
    sw   t0, -192(fp)
    lw   t2, -192(fp)
    lw   t0, -196(fp)
    sw   t0, 0(t2)
    la   a0, _str2
    call putstr
    addi t0, fp, -1372
    sw   t0, -188(fp)
    lw   t0, -188(fp)
    lw   t0, 0(t0)
    sw   t0, -184(fp)
    lw   a0, -184(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1368
    sw   t0, -180(fp)
    lw   t0, -180(fp)
    lw   t0, 0(t0)
    sw   t0, -176(fp)
    lw   a0, -176(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1364
    sw   t0, -172(fp)
    lw   t0, -172(fp)
    lw   t0, 0(t0)
    sw   t0, -168(fp)
    lw   a0, -168(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1360
    sw   t0, -164(fp)
    lw   t0, -164(fp)
    lw   t0, 0(t0)
    sw   t0, -160(fp)
    lw   a0, -160(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1356
    sw   t0, -156(fp)
    lw   t0, -156(fp)
    lw   t0, 0(t0)
    sw   t0, -152(fp)
    lw   a0, -152(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1352
    sw   t0, -148(fp)
    lw   t0, -148(fp)
    lw   t0, 0(t0)
    sw   t0, -144(fp)
    lw   a0, -144(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1348
    sw   t0, -140(fp)
    lw   t0, -140(fp)
    lw   t0, 0(t0)
    sw   t0, -136(fp)
    lw   a0, -136(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1344
    sw   t0, -132(fp)
    lw   t0, -132(fp)
    lw   t0, 0(t0)
    sw   t0, -128(fp)
    lw   a0, -128(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1340
    sw   t0, -124(fp)
    lw   t0, -124(fp)
    lw   t0, 0(t0)
    sw   t0, -120(fp)
    lw   a0, -120(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1336
    sw   t0, -116(fp)
    lw   t0, -116(fp)
    lw   t0, 0(t0)
    sw   t0, -112(fp)
    lw   a0, -112(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1332
    sw   t0, -108(fp)
    lw   t0, -108(fp)
    lw   t0, 0(t0)
    sw   t0, -104(fp)
    lw   a0, -104(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1328
    sw   t0, -100(fp)
    lw   t0, -100(fp)
    lw   t0, 0(t0)
    sw   t0, -96(fp)
    lw   a0, -96(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1324
    sw   t0, -92(fp)
    lw   t0, -92(fp)
    lw   t0, 0(t0)
    sw   t0, -88(fp)
    lw   a0, -88(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1320
    sw   t0, -84(fp)
    lw   t0, -84(fp)
    lw   t0, 0(t0)
    sw   t0, -80(fp)
    lw   a0, -80(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1316
    sw   t0, -76(fp)
    lw   t0, -76(fp)
    lw   t0, 0(t0)
    sw   t0, -72(fp)
    lw   a0, -72(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1312
    sw   t0, -68(fp)
    lw   t0, -68(fp)
    lw   t0, 0(t0)
    sw   t0, -64(fp)
    lw   a0, -64(fp)
    call putint
    li   a0, 10
    call putchar
    la   a0, _str3
    call putstr
    addi t0, fp, -1376
    sw   t0, -60(fp)
    lw   t0, -60(fp)
    lw   t0, 0(t0)
    sw   t0, -56(fp)
    lw   a0, -56(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1308
    sw   t0, -52(fp)
    lw   t0, -52(fp)
    lw   t0, 0(t0)
    sw   t0, -48(fp)
    lw   a0, -48(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1304
    sw   t0, -44(fp)
    lw   t0, -44(fp)
    lw   t0, 0(t0)
    sw   t0, -40(fp)
    lw   a0, -40(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1300
    sw   t0, -36(fp)
    lw   t0, -36(fp)
    lw   t0, 0(t0)
    sw   t0, -32(fp)
    lw   a0, -32(fp)
    call putint
    li   a0, 32
    call putchar
    addi t0, fp, -1296
    sw   t0, -28(fp)
    lw   t0, -28(fp)
    lw   t0, 0(t0)
    sw   t0, -24(fp)
    lw   a0, -24(fp)
    call putint
    li   a0, 10
    call putchar
    li   a0, 0
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 1376
    ret

    .data
    .align 2
__free_list:
    .word 0

    .text
__malloc_free_search:
    la   t0, __free_list
    mv   t1, t0
__mfs_loop:
    lw   t2, 0(t1)
    beqz t2, __mfs_fail
    lw   t3, 0(t2)
    blt  t3, a0, __mfs_next
    sub  t4, t3, a0
    li   t5, 8
    blt  t4, t5, __mfs_whole
    sw   a0, 0(t2)
    addi t5, t2, 4
    add  t5, t5, a0
    addi t4, t4, -4
    sw   t4, 0(t5)
    lw   t4, 4(t2)
    sw   t4, 4(t5)
    sw   t5, 0(t1)
    mv   a0, t2
    ret
__mfs_whole:
    lw   t4, 4(t2)
    sw   t4, 0(t1)
    mv   a0, t2
    ret
__mfs_next:
    addi t1, t2, 4
    j    __mfs_loop
__mfs_fail:
    li   a0, 0
    ret

__free_block:
    la   t0, __free_list
    lw   t1, 0(t0)
    sw   a1, 0(a0)
    sw   t1, 4(a0)
    sw   a0, 0(t0)
    lw   t2, 0(a0)
    addi t3, a0, 4
    add  t3, t3, t2
    mv   t4, t0
__fb_loop:
    lw   t6, 0(t4)
    beqz t6, __fb_done
    beq  t6, a0, __fb_next
    lw   t1, 0(t6)
    addi t5, t6, 4
    add  t5, t5, t1
    beq  t5, a0, __fb_prev
    beq  t3, t6, __fb_next_adj
__fb_next:
    addi t4, t6, 4
    j    __fb_loop
__fb_prev:
    addi t1, t1, 4
    add  t1, t1, t2
    sw   t1, 0(t6)
    lw   t5, 4(a0)
    sw   t5, 0(t4)
    ret
__fb_next_adj:
    addi t2, t2, 4
    add  t2, t2, t1
    sw   t2, 0(a0)
    lw   t5, 4(t6)
    sw   t5, 0(t4)
    ret
__fb_done:
    ret

__malloc_struct:
    addi sp, sp, -16
    sw   ra, 12(sp)
    sw   s0, 8(sp)
    sw   s1, 4(sp)
    sw   s2, 0(sp)
    addi t0, a0, 3
    li   t1, -4
    and  s0, t0, t1
    li   t0, 4
    bge  s0, t0, __ms_ok
    li   s0, 4
__ms_ok:
    mv   a0, s0
    call __malloc_free_search
    bnez a0, __ms_done
    li   a7, 214
    li   a0, 0
    ecall
    mv   s1, a0
    add  a0, s1, s0
    addi a0, a0, 4
    li   a7, 214
    ecall
    sw   s0, 0(s1)
    mv   a0, s1
__ms_done:
    lw   ra, 12(sp)
    lw   s0, 8(sp)
    lw   s1, 4(sp)
    lw   s2, 0(sp)
    addi sp, sp, 16
    ret

__malloc_array:
    addi sp, sp, -16
    sw   ra, 12(sp)
    sw   s0, 8(sp)
    sw   s1, 4(sp)
    sw   s2, 0(sp)
    mv   s0, a0
    mv   s1, a1
    addi t0, s0, 3
    li   t1, -4
    and  s0, t0, t1
    li   t0, 4
    bge  s0, t0, __ma_ok
    li   s0, 4
__ma_ok:
    mv   a0, s0
    call __malloc_free_search
    bnez a0, __ma_set_count
    li   a7, 214
    li   a0, 0
    ecall
    mv   s2, a0
    add  a0, s2, s0
    addi a0, a0, 4
    li   a7, 214
    ecall
    mv   a0, s2
__ma_set_count:
    addi t0, s0, -4
    div  t0, t0, s1
    sw   t0, 0(a0)
    lw   ra, 12(sp)
    lw   s0, 8(sp)
    lw   s1, 4(sp)
    lw   s2, 0(sp)
    addi sp, sp, 16
    ret

__free_struct:
    addi a0, a0, -4
    lw   a1, 0(a0)
    j    __free_block

__free_array:
    addi a0, a0, -4
    lw   t0, 0(a0)
    mul  a1, t0, a1
    addi a1, a1, 4
    j    __free_block
