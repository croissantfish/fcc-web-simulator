    .option nopic
    .option norelax

    .data
    .align 2
__fcc_global_MAX_N:
    .word 100

    .text
    .globl main

main:
    addi sp, sp, -608
    sw   ra, 604(sp)
    sw   fp, 600(sp)
    addi fp, sp, 608
_entry_0:
    call getint
    sw   a0, -192(fp)
    addi t0, fp, -208
    sw   t0, -188(fp)
    lw   t2, -188(fp)
    lw   t0, -192(fp)
    sw   t0, 0(t2)
    addi t0, fp, -204
    sw   t0, -184(fp)
    lw   t2, -184(fp)
    li   t0, 0
    sw   t0, 0(t2)
    j    _while_start_1
_while_start_1:
    addi t0, fp, -204
    sw   t0, -180(fp)
    lw   t0, -180(fp)
    lw   t0, 0(t0)
    sw   t0, -176(fp)
    addi t0, fp, -208
    sw   t0, -172(fp)
    lw   t0, -172(fp)
    lw   t0, 0(t0)
    sw   t0, -168(fp)
    lw   t0, -176(fp)
    lw   t1, -168(fp)
    slt  t0, t0, t1
    sw   t0, -164(fp)
    lw   t0, -164(fp)
    beqz t0, _while_end_3
    j    _while_body_2
_while_body_2:
    call getint
    sw   a0, -160(fp)
    addi t0, fp, -608
    sw   t0, -156(fp)
    addi t0, fp, -204
    sw   t0, -152(fp)
    lw   t0, -152(fp)
    lw   t0, 0(t0)
    sw   t0, -148(fp)
    lw   t0, -148(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, -144(fp)
    lw   t0, -156(fp)
    lw   t1, -144(fp)
    add  t0, t0, t1
    sw   t0, -140(fp)
    lw   t2, -140(fp)
    lw   t0, -160(fp)
    sw   t0, 0(t2)
    addi t0, fp, -204
    sw   t0, -136(fp)
    lw   t0, -136(fp)
    lw   t0, 0(t0)
    sw   t0, -132(fp)
    lw   t0, -132(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -128(fp)
    addi t0, fp, -204
    sw   t0, -124(fp)
    lw   t2, -124(fp)
    lw   t0, -128(fp)
    sw   t0, 0(t2)
    j    _while_start_1
_while_end_3:
    call getint
    sw   a0, -120(fp)
    addi t0, fp, -200
    sw   t0, -116(fp)
    lw   t2, -116(fp)
    lw   t0, -120(fp)
    sw   t0, 0(t2)
    li   t0, 1
    neg  t0, t0
    sw   t0, -112(fp)
    addi t0, fp, -196
    sw   t0, -108(fp)
    lw   t2, -108(fp)
    lw   t0, -112(fp)
    sw   t0, 0(t2)
    addi t0, fp, -204
    sw   t0, -104(fp)
    lw   t2, -104(fp)
    li   t0, 0
    sw   t0, 0(t2)
    j    _while_start_4
_while_start_4:
    addi t0, fp, -204
    sw   t0, -100(fp)
    lw   t0, -100(fp)
    lw   t0, 0(t0)
    sw   t0, -96(fp)
    addi t0, fp, -208
    sw   t0, -92(fp)
    lw   t0, -92(fp)
    lw   t0, 0(t0)
    sw   t0, -88(fp)
    lw   t0, -96(fp)
    lw   t1, -88(fp)
    slt  t0, t0, t1
    sw   t0, -84(fp)
    lw   t0, -84(fp)
    beqz t0, _while_end_6
    j    _while_body_5
_while_body_5:
    addi t0, fp, -608
    sw   t0, -80(fp)
    addi t0, fp, -204
    sw   t0, -76(fp)
    lw   t0, -76(fp)
    lw   t0, 0(t0)
    sw   t0, -72(fp)
    lw   t0, -72(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, -68(fp)
    lw   t0, -80(fp)
    lw   t1, -68(fp)
    add  t0, t0, t1
    sw   t0, -64(fp)
    lw   t0, -64(fp)
    lw   t0, 0(t0)
    sw   t0, -60(fp)
    addi t0, fp, -200
    sw   t0, -56(fp)
    lw   t0, -56(fp)
    lw   t0, 0(t0)
    sw   t0, -52(fp)
    lw   t0, -60(fp)
    lw   t1, -52(fp)
    sub  t0, t0, t1
    seqz t0, t0
    sw   t0, -48(fp)
    lw   t0, -48(fp)
    beqz t0, _if_else_8
    j    _if_then_7
_while_end_6:
    addi t0, fp, -196
    sw   t0, -16(fp)
    lw   t0, -16(fp)
    lw   t0, 0(t0)
    sw   t0, -12(fp)
    lw   a0, -12(fp)
    call putint
    li   a0, 10
    call putchar
    li   a0, 0
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 608
    ret
_if_then_7:
    addi t0, fp, -204
    sw   t0, -44(fp)
    lw   t0, -44(fp)
    lw   t0, 0(t0)
    sw   t0, -40(fp)
    addi t0, fp, -196
    sw   t0, -36(fp)
    lw   t2, -36(fp)
    lw   t0, -40(fp)
    sw   t0, 0(t2)
    j    _if_end_9
_if_else_8:
    j    _if_end_9
_if_end_9:
    addi t0, fp, -204
    sw   t0, -32(fp)
    lw   t0, -32(fp)
    lw   t0, 0(t0)
    sw   t0, -28(fp)
    lw   t0, -28(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -24(fp)
    addi t0, fp, -204
    sw   t0, -20(fp)
    lw   t2, -20(fp)
    lw   t0, -24(fp)
    sw   t0, 0(t2)
    j    _while_start_4

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
