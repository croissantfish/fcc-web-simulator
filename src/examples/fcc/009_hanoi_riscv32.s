    .option nopic
    .option norelax

    .data
    .align 2
_str0:
    .string "move "
    .align 2
_str1:
    .string " --> "
    .align 2
_str2:
    .string "move "
    .align 2
_str3:
    .string " --> "
    .align 2
__fcc_global_count:
    .word 0

    .text
    .globl main

__fcc_func_cd:
    addi sp, sp, -192
    sw   ra, 188(sp)
    sw   fp, 184(sp)
    addi fp, sp, 192
    sw   a0, -192(fp)
    sw   a1, -188(fp)
    sw   a2, -184(fp)
    sw   a3, -180(fp)
_entry_0:
    addi t0, fp, -192
    sw   t0, -176(fp)
    lw   t0, -176(fp)
    lw   t0, 0(t0)
    sw   t0, -172(fp)
    lw   t0, -172(fp)
    li   t1, 1
    sub  t0, t0, t1
    seqz t0, t0
    sw   t0, -168(fp)
    lw   t0, -168(fp)
    beqz t0, _if_else_2
    j    _if_then_1
_if_then_1:
    la   a0, _str0
    call putstr
    addi t0, fp, -188
    sw   t0, -164(fp)
    lw   t0, -164(fp)
    lb   t0, 0(t0)
    sw   t0, -160(fp)
    lw   a0, -160(fp)
    call putchar
    la   a0, _str1
    call putstr
    addi t0, fp, -180
    sw   t0, -156(fp)
    lw   t0, -156(fp)
    lb   t0, 0(t0)
    sw   t0, -152(fp)
    lw   a0, -152(fp)
    call putchar
    li   a0, 10
    call putchar
    la   t0, __fcc_global_count
    sw   t0, -148(fp)
    lw   t0, -148(fp)
    lw   t0, 0(t0)
    sw   t0, -144(fp)
    lw   t0, -144(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -140(fp)
    la   t0, __fcc_global_count
    sw   t0, -136(fp)
    lw   t2, -136(fp)
    lw   t0, -140(fp)
    sw   t0, 0(t2)
    j    _if_end_3
_if_else_2:
    addi t0, fp, -192
    sw   t0, -132(fp)
    lw   t0, -132(fp)
    lw   t0, 0(t0)
    sw   t0, -128(fp)
    lw   t0, -128(fp)
    li   t1, 1
    sub  t0, t0, t1
    sw   t0, -124(fp)
    addi t0, fp, -188
    sw   t0, -120(fp)
    lw   t0, -120(fp)
    lb   t0, 0(t0)
    sw   t0, -116(fp)
    addi t0, fp, -180
    sw   t0, -112(fp)
    lw   t0, -112(fp)
    lb   t0, 0(t0)
    sw   t0, -108(fp)
    addi t0, fp, -184
    sw   t0, -104(fp)
    lw   t0, -104(fp)
    lb   t0, 0(t0)
    sw   t0, -100(fp)
    lw   a0, -124(fp)
    lw   a1, -116(fp)
    lw   a2, -108(fp)
    lw   a3, -100(fp)
    call __fcc_func_cd
    sw   a0, -96(fp)
    la   a0, _str2
    call putstr
    addi t0, fp, -188
    sw   t0, -92(fp)
    lw   t0, -92(fp)
    lb   t0, 0(t0)
    sw   t0, -88(fp)
    lw   a0, -88(fp)
    call putchar
    la   a0, _str3
    call putstr
    addi t0, fp, -180
    sw   t0, -84(fp)
    lw   t0, -84(fp)
    lb   t0, 0(t0)
    sw   t0, -80(fp)
    lw   a0, -80(fp)
    call putchar
    li   a0, 10
    call putchar
    la   t0, __fcc_global_count
    sw   t0, -76(fp)
    lw   t0, -76(fp)
    lw   t0, 0(t0)
    sw   t0, -72(fp)
    lw   t0, -72(fp)
    li   t1, 1
    add  t0, t0, t1
    sw   t0, -68(fp)
    la   t0, __fcc_global_count
    sw   t0, -64(fp)
    lw   t2, -64(fp)
    lw   t0, -68(fp)
    sw   t0, 0(t2)
    addi t0, fp, -192
    sw   t0, -60(fp)
    lw   t0, -60(fp)
    lw   t0, 0(t0)
    sw   t0, -56(fp)
    lw   t0, -56(fp)
    li   t1, 1
    sub  t0, t0, t1
    sw   t0, -52(fp)
    addi t0, fp, -184
    sw   t0, -48(fp)
    lw   t0, -48(fp)
    lb   t0, 0(t0)
    sw   t0, -44(fp)
    addi t0, fp, -188
    sw   t0, -40(fp)
    lw   t0, -40(fp)
    lb   t0, 0(t0)
    sw   t0, -36(fp)
    addi t0, fp, -180
    sw   t0, -32(fp)
    lw   t0, -32(fp)
    lb   t0, 0(t0)
    sw   t0, -28(fp)
    lw   a0, -52(fp)
    lw   a1, -44(fp)
    lw   a2, -36(fp)
    lw   a3, -28(fp)
    call __fcc_func_cd
    sw   a0, -24(fp)
    j    _if_end_3
_if_end_3:
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 192
    ret
main:
    addi sp, sp, -48
    sw   ra, 44(sp)
    sw   fp, 40(sp)
    addi fp, sp, 48
_entry_4:
    call getint
    sw   a0, -44(fp)
    addi t0, fp, -48
    sw   t0, -40(fp)
    lw   t2, -40(fp)
    lw   t0, -44(fp)
    sw   t0, 0(t2)
    addi t0, fp, -48
    sw   t0, -36(fp)
    lw   t0, -36(fp)
    lw   t0, 0(t0)
    sw   t0, -32(fp)
    lw   a0, -32(fp)
    li   a1, 65
    li   a2, 66
    li   a3, 67
    call __fcc_func_cd
    sw   a0, -28(fp)
    la   t0, __fcc_global_count
    sw   t0, -24(fp)
    lw   t0, -24(fp)
    lw   t0, 0(t0)
    sw   t0, -20(fp)
    lw   a0, -20(fp)
    call putint
    li   a0, 10
    call putchar
    li   a0, 0
    lw   ra, -4(fp)
    lw   fp, -8(fp)
    addi sp, sp, 48
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
