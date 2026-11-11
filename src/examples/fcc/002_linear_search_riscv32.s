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
    mv   fp, sp
_entry_0:
    call getint
    sw   a0, 416(fp)
    addi t0, fp, 400
    sw   t0, 420(fp)
    lw   t2, 420(fp)
    lw   t0, 416(fp)
    sw   t0, 0(t2)
    addi t0, fp, 404
    sw   t0, 424(fp)
    lw   t2, 424(fp)
    li   t0, 0
    sw   t0, 0(t2)
    j    _while_start_1
_while_start_1:
    addi t0, fp, 404
    sw   t0, 428(fp)
    lw   t0, 428(fp)
    lw   t0, 0(t0)
    sw   t0, 432(fp)
    addi t0, fp, 400
    sw   t0, 436(fp)
    lw   t0, 436(fp)
    lw   t0, 0(t0)
    sw   t0, 440(fp)
    lw   t0, 432(fp)
    lw   t1, 440(fp)
    slt  t0, t0, t1
    sw   t0, 444(fp)
    lw   t0, 444(fp)
    beqz t0, _while_end_3
    j    _while_body_2
_while_body_2:
    call getint
    sw   a0, 448(fp)
    addi t0, fp, 0
    sw   t0, 452(fp)
    addi t0, fp, 404
    sw   t0, 456(fp)
    lw   t0, 456(fp)
    lw   t0, 0(t0)
    sw   t0, 460(fp)
    lw   t0, 460(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, 464(fp)
    lw   t0, 452(fp)
    lw   t1, 464(fp)
    add  t0, t0, t1
    sw   t0, 468(fp)
    lw   t2, 468(fp)
    lw   t0, 448(fp)
    sw   t0, 0(t2)
    addi t0, fp, 404
    sw   t0, 472(fp)
    lw   t0, 472(fp)
    lw   t0, 0(t0)
    sw   t0, 476(fp)
    lw   t0, 476(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, 480(fp)
    addi t0, fp, 404
    sw   t0, 484(fp)
    lw   t2, 484(fp)
    lw   t0, 480(fp)
    sw   t0, 0(t2)
    j    _while_start_1
_while_end_3:
    call getint
    sw   a0, 488(fp)
    addi t0, fp, 408
    sw   t0, 492(fp)
    lw   t2, 492(fp)
    lw   t0, 488(fp)
    sw   t0, 0(t2)
    li   t0, 1
    neg  t0, t0
    sw   t0, 496(fp)
    addi t0, fp, 412
    sw   t0, 500(fp)
    lw   t2, 500(fp)
    lw   t0, 496(fp)
    sw   t0, 0(t2)
    addi t0, fp, 404
    sw   t0, 504(fp)
    lw   t2, 504(fp)
    li   t0, 0
    sw   t0, 0(t2)
    j    _while_start_4
_while_start_4:
    addi t0, fp, 404
    sw   t0, 508(fp)
    lw   t0, 508(fp)
    lw   t0, 0(t0)
    sw   t0, 512(fp)
    addi t0, fp, 400
    sw   t0, 516(fp)
    lw   t0, 516(fp)
    lw   t0, 0(t0)
    sw   t0, 520(fp)
    lw   t0, 512(fp)
    lw   t1, 520(fp)
    slt  t0, t0, t1
    sw   t0, 524(fp)
    lw   t0, 524(fp)
    beqz t0, _while_end_6
    j    _while_body_5
_while_body_5:
    addi t0, fp, 0
    sw   t0, 528(fp)
    addi t0, fp, 404
    sw   t0, 532(fp)
    lw   t0, 532(fp)
    lw   t0, 0(t0)
    sw   t0, 536(fp)
    lw   t0, 536(fp)
    li   t1, 4
    mul  t0, t0, t1
    sw   t0, 540(fp)
    lw   t0, 528(fp)
    lw   t1, 540(fp)
    add  t0, t0, t1
    sw   t0, 544(fp)
    lw   t0, 544(fp)
    lw   t0, 0(t0)
    sw   t0, 548(fp)
    addi t0, fp, 408
    sw   t0, 552(fp)
    lw   t0, 552(fp)
    lw   t0, 0(t0)
    sw   t0, 556(fp)
    lw   t0, 548(fp)
    lw   t1, 556(fp)
    sub  t0, t0, t1
    seqz t0, t0
    sw   t0, 560(fp)
    lw   t0, 560(fp)
    beqz t0, _if_else_8
    j    _if_then_7
_while_end_6:
    addi t0, fp, 412
    sw   t0, 592(fp)
    lw   t0, 592(fp)
    lw   t0, 0(t0)
    sw   t0, 596(fp)
    lw   a0, 596(fp)
    call putint
    li   a0, 10
    call putchar
    li   a0, 0
    lw   ra, 604(sp)
    lw   fp, 600(sp)
    addi sp, sp, 608
    ret
_if_then_7:
    addi t0, fp, 404
    sw   t0, 564(fp)
    lw   t0, 564(fp)
    lw   t0, 0(t0)
    sw   t0, 568(fp)
    addi t0, fp, 412
    sw   t0, 572(fp)
    lw   t2, 572(fp)
    lw   t0, 568(fp)
    sw   t0, 0(t2)
    j    _if_end_9
_if_else_8:
    j    _if_end_9
_if_end_9:
    addi t0, fp, 404
    sw   t0, 576(fp)
    lw   t0, 576(fp)
    lw   t0, 0(t0)
    sw   t0, 580(fp)
    lw   t0, 580(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, 584(fp)
    addi t0, fp, 404
    sw   t0, 588(fp)
    lw   t2, 588(fp)
    lw   t0, 584(fp)
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
