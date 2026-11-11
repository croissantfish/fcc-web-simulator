        .data
_nl:    .asciiz "\n"
_str0:    .asciiz "move "
_str1:    .asciiz " --> "
_str2:    .asciiz "move "
_str3:    .asciiz " --> "
        .align 2
__fcc_global_count:    .word 0

        .text
        .globl main

func_cd:
        addiu $sp, $sp, -192
        sw    $ra, 188($sp)
        sw    $fp, 184($sp)
        move  $fp, $sp
        sw    $a0, 0($fp)
        sw    $a1, 4($fp)
        sw    $a2, 8($fp)
        sw    $a3, 12($fp)
_entry_0:
        addiu $t0, $fp, 0
        sw    $t0, 16($fp)
        lw    $t0, 16($fp)
        lw    $t0, 0($t0)
        sw    $t0, 20($fp)
        lw    $t0, 20($fp)
        li    $t1, 1
        seq   $t0, $t0, $t1
        sw    $t0, 24($fp)
        lw    $t0, 24($fp)
        beqz  $t0, _if_else_2
        j     _if_then_1
_if_then_1:
        la    $a0, _str0
        jal   putstr
        addiu $t0, $fp, 4
        sw    $t0, 28($fp)
        lw    $t0, 28($fp)
        lb    $t0, 0($t0)
        sw    $t0, 32($fp)
        lw    $a0, 32($fp)
        jal   putchar
        la    $a0, _str1
        jal   putstr
        addiu $t0, $fp, 12
        sw    $t0, 36($fp)
        lw    $t0, 36($fp)
        lb    $t0, 0($t0)
        sw    $t0, 40($fp)
        lw    $a0, 40($fp)
        jal   putchar
        li    $a0, 10
        jal   putchar
        la    $t0, __fcc_global_count
        sw    $t0, 44($fp)
        lw    $t0, 44($fp)
        lw    $t0, 0($t0)
        sw    $t0, 48($fp)
        lw    $t0, 48($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, 52($fp)
        la    $t0, __fcc_global_count
        sw    $t0, 56($fp)
        lw    $t2, 56($fp)
        lw    $t0, 52($fp)
        sw    $t0, 0($t2)
        j     _if_end_3
_if_else_2:
        addiu $t0, $fp, 0
        sw    $t0, 60($fp)
        lw    $t0, 60($fp)
        lw    $t0, 0($t0)
        sw    $t0, 64($fp)
        lw    $t0, 64($fp)
        li    $t1, 1
        sub   $t0, $t0, $t1
        sw    $t0, 68($fp)
        addiu $t0, $fp, 4
        sw    $t0, 72($fp)
        lw    $t0, 72($fp)
        lb    $t0, 0($t0)
        sw    $t0, 76($fp)
        addiu $t0, $fp, 12
        sw    $t0, 80($fp)
        lw    $t0, 80($fp)
        lb    $t0, 0($t0)
        sw    $t0, 84($fp)
        addiu $t0, $fp, 8
        sw    $t0, 88($fp)
        lw    $t0, 88($fp)
        lb    $t0, 0($t0)
        sw    $t0, 92($fp)
        lw    $a0, 68($fp)
        lw    $a1, 76($fp)
        lw    $a2, 84($fp)
        lw    $a3, 92($fp)
        jal   func_cd
        sw    $v0, 96($fp)
        la    $a0, _str2
        jal   putstr
        addiu $t0, $fp, 4
        sw    $t0, 100($fp)
        lw    $t0, 100($fp)
        lb    $t0, 0($t0)
        sw    $t0, 104($fp)
        lw    $a0, 104($fp)
        jal   putchar
        la    $a0, _str3
        jal   putstr
        addiu $t0, $fp, 12
        sw    $t0, 108($fp)
        lw    $t0, 108($fp)
        lb    $t0, 0($t0)
        sw    $t0, 112($fp)
        lw    $a0, 112($fp)
        jal   putchar
        li    $a0, 10
        jal   putchar
        la    $t0, __fcc_global_count
        sw    $t0, 116($fp)
        lw    $t0, 116($fp)
        lw    $t0, 0($t0)
        sw    $t0, 120($fp)
        lw    $t0, 120($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, 124($fp)
        la    $t0, __fcc_global_count
        sw    $t0, 128($fp)
        lw    $t2, 128($fp)
        lw    $t0, 124($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 0
        sw    $t0, 132($fp)
        lw    $t0, 132($fp)
        lw    $t0, 0($t0)
        sw    $t0, 136($fp)
        lw    $t0, 136($fp)
        li    $t1, 1
        sub   $t0, $t0, $t1
        sw    $t0, 140($fp)
        addiu $t0, $fp, 8
        sw    $t0, 144($fp)
        lw    $t0, 144($fp)
        lb    $t0, 0($t0)
        sw    $t0, 148($fp)
        addiu $t0, $fp, 4
        sw    $t0, 152($fp)
        lw    $t0, 152($fp)
        lb    $t0, 0($t0)
        sw    $t0, 156($fp)
        addiu $t0, $fp, 12
        sw    $t0, 160($fp)
        lw    $t0, 160($fp)
        lb    $t0, 0($t0)
        sw    $t0, 164($fp)
        lw    $a0, 140($fp)
        lw    $a1, 148($fp)
        lw    $a2, 156($fp)
        lw    $a3, 164($fp)
        jal   func_cd
        sw    $v0, 168($fp)
        j     _if_end_3
_if_end_3:
        lw    $ra, 188($sp)
        lw    $fp, 184($sp)
        addiu $sp, $sp, 192
        jr    $ra
main:
        addiu $sp, $sp, -48
        sw    $ra, 44($sp)
        sw    $fp, 40($sp)
        move  $fp, $sp
_entry_4:
        jal   getint
        sw    $v0, 4($fp)
        addiu $t0, $fp, 0
        sw    $t0, 8($fp)
        lw    $t2, 8($fp)
        lw    $t0, 4($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 0
        sw    $t0, 12($fp)
        lw    $t0, 12($fp)
        lw    $t0, 0($t0)
        sw    $t0, 16($fp)
        lw    $a0, 16($fp)
        li    $a1, 65
        li    $a2, 66
        li    $a3, 67
        jal   func_cd
        sw    $v0, 20($fp)
        la    $t0, __fcc_global_count
        sw    $t0, 24($fp)
        lw    $t0, 24($fp)
        lw    $t0, 0($t0)
        sw    $t0, 28($fp)
        lw    $a0, 28($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        li    $v0, 0
        lw    $ra, 44($sp)
        lw    $fp, 40($sp)
        addiu $sp, $sp, 48
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
