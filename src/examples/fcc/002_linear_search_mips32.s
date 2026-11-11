        .data
_nl:    .asciiz "\n"
        .align 2
__fcc_global_MAX_N:    .word 100

        .text
        .globl main

main:
        addiu $sp, $sp, -608
        sw    $ra, 604($sp)
        sw    $fp, 600($sp)
        move  $fp, $sp
_entry_0:
        jal   getint
        sw    $v0, 416($fp)
        addiu $t0, $fp, 400
        sw    $t0, 420($fp)
        lw    $t2, 420($fp)
        lw    $t0, 416($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 404
        sw    $t0, 424($fp)
        lw    $t2, 424($fp)
        li    $t0, 0
        sw    $t0, 0($t2)
        j     _while_start_1
_while_start_1:
        addiu $t0, $fp, 404
        sw    $t0, 428($fp)
        lw    $t0, 428($fp)
        lw    $t0, 0($t0)
        sw    $t0, 432($fp)
        addiu $t0, $fp, 400
        sw    $t0, 436($fp)
        lw    $t0, 436($fp)
        lw    $t0, 0($t0)
        sw    $t0, 440($fp)
        lw    $t0, 432($fp)
        lw    $t1, 440($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 444($fp)
        lw    $t0, 444($fp)
        beqz  $t0, _while_end_3
        j     _while_body_2
_while_body_2:
        jal   getint
        sw    $v0, 448($fp)
        addiu $t0, $fp, 0
        sw    $t0, 452($fp)
        addiu $t0, $fp, 404
        sw    $t0, 456($fp)
        lw    $t0, 456($fp)
        lw    $t0, 0($t0)
        sw    $t0, 460($fp)
        lw    $t0, 460($fp)
        li    $t1, 4
        mul   $t0, $t0, $t1
        sw    $t0, 464($fp)
        lw    $t0, 452($fp)
        lw    $t1, 464($fp)
        add   $t0, $t0, $t1
        sw    $t0, 468($fp)
        lw    $t2, 468($fp)
        lw    $t0, 448($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 404
        sw    $t0, 472($fp)
        lw    $t0, 472($fp)
        lw    $t0, 0($t0)
        sw    $t0, 476($fp)
        lw    $t0, 476($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, 480($fp)
        addiu $t0, $fp, 404
        sw    $t0, 484($fp)
        lw    $t2, 484($fp)
        lw    $t0, 480($fp)
        sw    $t0, 0($t2)
        j     _while_start_1
_while_end_3:
        jal   getint
        sw    $v0, 488($fp)
        addiu $t0, $fp, 408
        sw    $t0, 492($fp)
        lw    $t2, 492($fp)
        lw    $t0, 488($fp)
        sw    $t0, 0($t2)
        li    $t0, 1
        neg   $t0, $t0
        sw    $t0, 496($fp)
        addiu $t0, $fp, 412
        sw    $t0, 500($fp)
        lw    $t2, 500($fp)
        lw    $t0, 496($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 404
        sw    $t0, 504($fp)
        lw    $t2, 504($fp)
        li    $t0, 0
        sw    $t0, 0($t2)
        j     _while_start_4
_while_start_4:
        addiu $t0, $fp, 404
        sw    $t0, 508($fp)
        lw    $t0, 508($fp)
        lw    $t0, 0($t0)
        sw    $t0, 512($fp)
        addiu $t0, $fp, 400
        sw    $t0, 516($fp)
        lw    $t0, 516($fp)
        lw    $t0, 0($t0)
        sw    $t0, 520($fp)
        lw    $t0, 512($fp)
        lw    $t1, 520($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 524($fp)
        lw    $t0, 524($fp)
        beqz  $t0, _while_end_6
        j     _while_body_5
_while_body_5:
        addiu $t0, $fp, 0
        sw    $t0, 528($fp)
        addiu $t0, $fp, 404
        sw    $t0, 532($fp)
        lw    $t0, 532($fp)
        lw    $t0, 0($t0)
        sw    $t0, 536($fp)
        lw    $t0, 536($fp)
        li    $t1, 4
        mul   $t0, $t0, $t1
        sw    $t0, 540($fp)
        lw    $t0, 528($fp)
        lw    $t1, 540($fp)
        add   $t0, $t0, $t1
        sw    $t0, 544($fp)
        lw    $t0, 544($fp)
        lw    $t0, 0($t0)
        sw    $t0, 548($fp)
        addiu $t0, $fp, 408
        sw    $t0, 552($fp)
        lw    $t0, 552($fp)
        lw    $t0, 0($t0)
        sw    $t0, 556($fp)
        lw    $t0, 548($fp)
        lw    $t1, 556($fp)
        seq   $t0, $t0, $t1
        sw    $t0, 560($fp)
        lw    $t0, 560($fp)
        beqz  $t0, _if_else_8
        j     _if_then_7
_while_end_6:
        addiu $t0, $fp, 412
        sw    $t0, 592($fp)
        lw    $t0, 592($fp)
        lw    $t0, 0($t0)
        sw    $t0, 596($fp)
        lw    $a0, 596($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        li    $v0, 0
        lw    $ra, 604($sp)
        lw    $fp, 600($sp)
        addiu $sp, $sp, 608
        jr    $ra
_if_then_7:
        addiu $t0, $fp, 404
        sw    $t0, 564($fp)
        lw    $t0, 564($fp)
        lw    $t0, 0($t0)
        sw    $t0, 568($fp)
        addiu $t0, $fp, 412
        sw    $t0, 572($fp)
        lw    $t2, 572($fp)
        lw    $t0, 568($fp)
        sw    $t0, 0($t2)
        j     _if_end_9
_if_else_8:
        j     _if_end_9
_if_end_9:
        addiu $t0, $fp, 404
        sw    $t0, 576($fp)
        lw    $t0, 576($fp)
        lw    $t0, 0($t0)
        sw    $t0, 580($fp)
        lw    $t0, 580($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, 584($fp)
        addiu $t0, $fp, 404
        sw    $t0, 588($fp)
        lw    $t2, 588($fp)
        lw    $t0, 584($fp)
        sw    $t0, 0($t2)
        j     _while_start_4

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
