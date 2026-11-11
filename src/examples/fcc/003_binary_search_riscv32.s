    .option nopic
    .option norelax

    .data
    .align 2
__fcc_global_MAX_N:
    .word 100

    .text
    .globl main

__fcc_func_binary_search:
    addi sp, sp, -224
    sw   ra, 220(sp)
    sw   fp, 216(sp)
    mv   fp, sp
    sw   a0, 0(fp)
    sw   a1, 4(fp)
    sw   a2, 8(fp)
_entry_0:
    addi t0, fp, 12
    sw   t0, 24(fp)
    lw   t2, 24(fp)
    li   t0, 0
    sw   t0, 0(t2)
    addi t0, fp, 4
    sw   t0, 28(fp)
    lw   t0, 28(fp)
    lw   t0, 0(t0)
    sw   t0, 32(fp)
    lw   t0, 32(fp)
    li   t1, 1
    sub  t0, t0, t1
    sw   t0, 36(fp)
    addi t0, fp, 16
    sw   t0, 40(fp)
    lw   t2, 40(fp)
    lw   t0, 36(fp)
    sw   t0, 0(t2)
    j    _while_start_1
_while_start_1:
    addi t0, fp, 12
    sw   t0, 44(fp)
    lw   t0, 44(fp)
    lw   t0, 0(t0)
    sw   t0, 48(fp)
    addi t0, fp, 16
    sw   t0, 52(fp)
    lw   t0, 52(fp)
    lw   t0, 0(t0)
    sw   t0, 56(fp)
    lw   t0, 48(fp)
    lw   t1, 56(fp)
    slt  t0, t1, t0
    xori t0, t0, 1
    sw   t0, 60(fp)
    lw   t0, 60(fp)
    beqz t0, _while_end_3
    j    _while_body_2
_while_body_2:
    addi t0, fp, 12
    sw   t0, 64(fp)
    lw   t0, 64(fp)
    lw   t0, 0(t0)
    sw   t0, 68(fp)
    addi t0, fp, 16
    sw   t0, 72(fp)
    lw   t0, 72(fp)
    lw   t0, 0(t0)
    sw   t0, 76(fp)
    lw   t0, 68(fp)
    lw   t1, 76(fp)
    add  t0, t0, t1
    sw   t0, 80(fp)
    lw   t0, 80(fp)
    li   t1, 2
    div  t0, t0, t1
    sw   t0, 84(fp)
    addi t0, fp, 20
    sw   t0, 88(fp)
    lw   t2, 88(fp)
    lw   t0, 84(fp)
    sw   t0, 0(t2)
    addi t0, fp, 0
    sw   t0, 92(fp)
    lw   t0, 92(fp)
    lw   t0, 0(t0)
    sw   t0, 96(fp)
    addi t0, fp, 20
    sw   t0, 100(fp)
    lw   t0, 100(fp)
    lw   t0, 0(t0)
    sw   t0, 104(fp)
    lw   t0, 104(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, 108(fp)
    lw   t0, 96(fp)
    lw   t1, 108(fp)
    add  t0, t0, t1
    sw   t0, 112(fp)
    lw   t0, 112(fp)
    lw   t0, 0(t0)
    sw   t0, 116(fp)
    addi t0, fp, 8
    sw   t0, 120(fp)
    lw   t0, 120(fp)
    lw   t0, 0(t0)
    sw   t0, 124(fp)
    lw   t0, 116(fp)
    lw   t1, 124(fp)
    sub  t0, t0, t1
    seqz t0, t0
    sw   t0, 128(fp)
    lw   t0, 128(fp)
    beqz t0, _if_else_5
    j    _if_then_4
_while_end_3:
    li   t0, 1
    neg  t0, t0
    sw   t0, 212(fp)
    lw   a0, 212(fp)
    lw   ra, 220(sp)
    lw   fp, 216(sp)
    addi sp, sp, 224
    ret
_if_then_4:
    addi t0, fp, 20
    sw   t0, 132(fp)
    lw   t0, 132(fp)
    lw   t0, 0(t0)
    sw   t0, 136(fp)
    lw   a0, 136(fp)
    lw   ra, 220(sp)
    lw   fp, 216(sp)
    addi sp, sp, 224
    ret
_if_else_5:
    j    _if_end_6
_if_end_6:
    addi t0, fp, 0
    sw   t0, 140(fp)
    lw   t0, 140(fp)
    lw   t0, 0(t0)
    sw   t0, 144(fp)
    addi t0, fp, 20
    sw   t0, 148(fp)
    lw   t0, 148(fp)
    lw   t0, 0(t0)
    sw   t0, 152(fp)
    lw   t0, 152(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, 156(fp)
    lw   t0, 144(fp)
    lw   t1, 156(fp)
    add  t0, t0, t1
    sw   t0, 160(fp)
    lw   t0, 160(fp)
    lw   t0, 0(t0)
    sw   t0, 164(fp)
    addi t0, fp, 8
    sw   t0, 168(fp)
    lw   t0, 168(fp)
    lw   t0, 0(t0)
    sw   t0, 172(fp)
    lw   t0, 164(fp)
    lw   t1, 172(fp)
    slt  t0, t0, t1
    sw   t0, 176(fp)
    lw   t0, 176(fp)
    beqz t0, _if_else_8
    j    _if_then_7
_if_then_7:
    addi t0, fp, 20
    sw   t0, 180(fp)
    lw   t0, 180(fp)
    lw   t0, 0(t0)
    sw   t0, 184(fp)
    lw   t0, 184(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, 188(fp)
    addi t0, fp, 12
    sw   t0, 192(fp)
    lw   t2, 192(fp)
    lw   t0, 188(fp)
    sw   t0, 0(t2)
    j    _if_end_9
_if_else_8:
    addi t0, fp, 20
    sw   t0, 196(fp)
    lw   t0, 196(fp)
    lw   t0, 0(t0)
    sw   t0, 200(fp)
    lw   t0, 200(fp)
    li   t1, 1
    sub  t0, t0, t1
    sw   t0, 204(fp)
    addi t0, fp, 16
    sw   t0, 208(fp)
    lw   t2, 208(fp)
    lw   t0, 204(fp)
    sw   t0, 0(t2)
    j    _if_end_9
_if_end_9:
    j    _while_start_1
main:
    addi sp, sp, -528
    sw   ra, 524(sp)
    sw   fp, 520(sp)
    mv   fp, sp
_entry_10:
    call getint
    sw   a0, 412(fp)
    addi t0, fp, 400
    sw   t0, 416(fp)
    lw   t2, 416(fp)
    lw   t0, 412(fp)
    sw   t0, 0(t2)
    addi t0, fp, 404
    sw   t0, 420(fp)
    lw   t2, 420(fp)
    li   t0, 0
    sw   t0, 0(t2)
    j    _while_start_11
_while_start_11:
    addi t0, fp, 404
    sw   t0, 424(fp)
    lw   t0, 424(fp)
    lw   t0, 0(t0)
    sw   t0, 428(fp)
    addi t0, fp, 400
    sw   t0, 432(fp)
    lw   t0, 432(fp)
    lw   t0, 0(t0)
    sw   t0, 436(fp)
    lw   t0, 428(fp)
    lw   t1, 436(fp)
    slt  t0, t0, t1
    sw   t0, 440(fp)
    lw   t0, 440(fp)
    beqz t0, _while_end_13
    j    _while_body_12
_while_body_12:
    call getint
    sw   a0, 444(fp)
    addi t0, fp, 0
    sw   t0, 448(fp)
    addi t0, fp, 404
    sw   t0, 452(fp)
    lw   t0, 452(fp)
    lw   t0, 0(t0)
    sw   t0, 456(fp)
    lw   t0, 456(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, 460(fp)
    lw   t0, 448(fp)
    lw   t1, 460(fp)
    add  t0, t0, t1
    sw   t0, 464(fp)
    lw   t2, 464(fp)
    lw   t0, 444(fp)
    sw   t0, 0(t2)
    addi t0, fp, 404
    sw   t0, 468(fp)
    lw   t0, 468(fp)
    lw   t0, 0(t0)
    sw   t0, 472(fp)
    lw   t0, 472(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, 476(fp)
    addi t0, fp, 404
    sw   t0, 480(fp)
    lw   t2, 480(fp)
    lw   t0, 476(fp)
    sw   t0, 0(t2)
    j    _while_start_11
_while_end_13:
    call getint
    sw   a0, 484(fp)
    addi t0, fp, 408
    sw   t0, 488(fp)
    lw   t2, 488(fp)
    lw   t0, 484(fp)
    sw   t0, 0(t2)
    addi t0, fp, 0
    sw   t0, 492(fp)
    addi t0, fp, 400
    sw   t0, 496(fp)
    lw   t0, 496(fp)
    lw   t0, 0(t0)
    sw   t0, 500(fp)
    addi t0, fp, 408
    sw   t0, 504(fp)
    lw   t0, 504(fp)
    lw   t0, 0(t0)
    sw   t0, 508(fp)
    lw   a0, 492(fp)
    lw   a1, 500(fp)
    lw   a2, 508(fp)
    call __fcc_func_binary_search
    sw   a0, 512(fp)
    lw   a0, 512(fp)
    call putint
    li   a0, 10
    call putchar
    li   a0, 0
    lw   ra, 524(sp)
    lw   fp, 520(sp)
    addi sp, sp, 528
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
