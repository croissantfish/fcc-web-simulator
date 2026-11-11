        .data
_nl:    .asciiz "\n"

        .text
        .globl main

func_show:
        addiu $sp, $sp, -32
        sw    $ra, 28($sp)
        sw    $fp, 24($sp)
        move  $fp, $sp
        sw    $a0, 0($fp)
        sw    $a1, 4($fp)
_entry_0:
        li    $a0, 69
        jal   putchar
        addiu $t0, $fp, 0
        sw    $t0, 8($fp)
        lw    $t0, 8($fp)
        lw    $t0, 0($t0)
        sw    $t0, 12($fp)
        lw    $a0, 12($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, 4
        sw    $t0, 16($fp)
        lw    $t0, 16($fp)
        lw    $t0, 0($t0)
        sw    $t0, 20($fp)
        lw    $a0, 20($fp)
        jal   putint
        li    $a0, 10
        jal   putchar
        lw    $ra, 28($sp)
        lw    $fp, 24($sp)
        addiu $sp, $sp, 32
        jr    $ra
func_show_bool:
        addiu $sp, $sp, -32
        sw    $ra, 28($sp)
        sw    $fp, 24($sp)
        move  $fp, $sp
        sw    $a0, 0($fp)
        sw    $a1, 4($fp)
_entry_1:
        li    $a0, 69
        jal   putchar
        addiu $t0, $fp, 0
        sw    $t0, 8($fp)
        lw    $t0, 8($fp)
        lw    $t0, 0($t0)
        sw    $t0, 12($fp)
        lw    $a0, 12($fp)
        jal   putint
        li    $a0, 32
        jal   putchar
        addiu $t0, $fp, 4
        sw    $t0, 16($fp)
        lw    $t0, 16($fp)
        lw    $t0, 0($t0)
        sw    $t0, 20($fp)
        lw    $t0, 20($fp)
        beqz  $t0, _if_else_3
        j     _if_then_2
_if_then_2:
        li    $a0, 1
        jal   putint
        j     _if_end_4
_if_else_3:
        li    $a0, 0
        jal   putint
        j     _if_end_4
_if_end_4:
        li    $a0, 10
        jal   putchar
        lw    $ra, 28($sp)
        lw    $fp, 24($sp)
        addiu $sp, $sp, 32
        jr    $ra
main:
        addiu $sp, $sp, -672
        sw    $ra, 668($sp)
        sw    $fp, 664($sp)
        move  $fp, $sp
_entry_5:
        jal   getint
        sw    $v0, 12($fp)
        addiu $t0, $fp, 0
        sw    $t0, 16($fp)
        lw    $t2, 16($fp)
        lw    $t0, 12($fp)
        sw    $t0, 0($t2)
        jal   getint
        sw    $v0, 20($fp)
        addiu $t0, $fp, 4
        sw    $t0, 24($fp)
        lw    $t2, 24($fp)
        lw    $t0, 20($fp)
        sw    $t0, 0($t2)
        jal   getint
        sw    $v0, 28($fp)
        addiu $t0, $fp, 8
        sw    $t0, 32($fp)
        lw    $t2, 32($fp)
        lw    $t0, 28($fp)
        sw    $t0, 0($t2)
        addiu $t0, $fp, 0
        sw    $t0, 36($fp)
        lw    $t0, 36($fp)
        lw    $t0, 0($t0)
        sw    $t0, 40($fp)
        addiu $t0, $fp, 4
        sw    $t0, 44($fp)
        lw    $t0, 44($fp)
        lw    $t0, 0($t0)
        sw    $t0, 48($fp)
        addiu $t0, $fp, 8
        sw    $t0, 52($fp)
        lw    $t0, 52($fp)
        lw    $t0, 0($t0)
        sw    $t0, 56($fp)
        lw    $t0, 48($fp)
        lw    $t1, 56($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 60($fp)
        lw    $t0, 40($fp)
        lw    $t1, 60($fp)
        add   $t0, $t0, $t1
        sw    $t0, 64($fp)
        addiu $t0, $fp, 0
        sw    $t0, 68($fp)
        lw    $t0, 68($fp)
        lw    $t0, 0($t0)
        sw    $t0, 72($fp)
        addiu $t0, $fp, 4
        sw    $t0, 76($fp)
        lw    $t0, 76($fp)
        lw    $t0, 0($t0)
        sw    $t0, 80($fp)
        lw    $t0, 72($fp)
        lw    $t1, 80($fp)
        div   $t0, $t0, $t1
        sw    $t0, 84($fp)
        lw    $t0, 64($fp)
        lw    $t1, 84($fp)
        sub   $t0, $t0, $t1
        sw    $t0, 88($fp)
        li    $a0, 1
        lw    $a1, 88($fp)
        jal   func_show
        sw    $v0, 92($fp)
        addiu $t0, $fp, 0
        sw    $t0, 96($fp)
        lw    $t0, 96($fp)
        lw    $t0, 0($t0)
        sw    $t0, 100($fp)
        addiu $t0, $fp, 4
        sw    $t0, 104($fp)
        lw    $t0, 104($fp)
        lw    $t0, 0($t0)
        sw    $t0, 108($fp)
        lw    $t0, 100($fp)
        lw    $t1, 108($fp)
        add   $t0, $t0, $t1
        sw    $t0, 112($fp)
        addiu $t0, $fp, 8
        sw    $t0, 116($fp)
        lw    $t0, 116($fp)
        lw    $t0, 0($t0)
        sw    $t0, 120($fp)
        lw    $t0, 120($fp)
        li    $t1, 2
        sub   $t0, $t0, $t1
        sw    $t0, 124($fp)
        lw    $t0, 112($fp)
        lw    $t1, 124($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 128($fp)
        li    $a0, 2
        lw    $a1, 128($fp)
        jal   func_show
        sw    $v0, 132($fp)
        addiu $t0, $fp, 0
        sw    $t0, 136($fp)
        lw    $t0, 136($fp)
        lw    $t0, 0($t0)
        sw    $t0, 140($fp)
        addiu $t0, $fp, 4
        sw    $t0, 144($fp)
        lw    $t0, 144($fp)
        lw    $t0, 0($t0)
        sw    $t0, 148($fp)
        lw    $t0, 140($fp)
        lw    $t1, 148($fp)
        sub   $t0, $t0, $t1
        sw    $t0, 152($fp)
        addiu $t0, $fp, 8
        sw    $t0, 156($fp)
        lw    $t0, 156($fp)
        lw    $t0, 0($t0)
        sw    $t0, 160($fp)
        lw    $t0, 152($fp)
        lw    $t1, 160($fp)
        sub   $t0, $t0, $t1
        sw    $t0, 164($fp)
        li    $a0, 3
        lw    $a1, 164($fp)
        jal   func_show
        sw    $v0, 168($fp)
        li    $t0, 100
        li    $t1, 7
        div   $t0, $t0, $t1
        sw    $t0, 172($fp)
        lw    $t0, 172($fp)
        li    $t1, 3
        div   $t0, $t0, $t1
        sw    $t0, 176($fp)
        li    $a0, 4
        lw    $a1, 176($fp)
        jal   func_show
        sw    $v0, 180($fp)
        li    $t0, 100
        li    $t1, 17
        rem   $t0, $t0, $t1
        sw    $t0, 184($fp)
        lw    $t0, 184($fp)
        li    $t1, 6
        rem   $t0, $t0, $t1
        sw    $t0, 188($fp)
        li    $a0, 5
        lw    $a1, 188($fp)
        jal   func_show
        sw    $v0, 192($fp)
        addiu $t0, $fp, 0
        sw    $t0, 196($fp)
        lw    $t0, 196($fp)
        lw    $t0, 0($t0)
        sw    $t0, 200($fp)
        lw    $t0, 200($fp)
        neg   $t0, $t0
        sw    $t0, 204($fp)
        addiu $t0, $fp, 4
        sw    $t0, 208($fp)
        lw    $t0, 208($fp)
        lw    $t0, 0($t0)
        sw    $t0, 212($fp)
        lw    $t0, 204($fp)
        lw    $t1, 212($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 216($fp)
        addiu $t0, $fp, 8
        sw    $t0, 220($fp)
        lw    $t0, 220($fp)
        lw    $t0, 0($t0)
        sw    $t0, 224($fp)
        lw    $t0, 216($fp)
        lw    $t1, 224($fp)
        add   $t0, $t0, $t1
        sw    $t0, 228($fp)
        li    $a0, 6
        lw    $a1, 228($fp)
        jal   func_show
        sw    $v0, 232($fp)
        addiu $t0, $fp, 0
        sw    $t0, 236($fp)
        lw    $t0, 236($fp)
        lw    $t0, 0($t0)
        sw    $t0, 240($fp)
        addiu $t0, $fp, 4
        sw    $t0, 244($fp)
        lw    $t0, 244($fp)
        lw    $t0, 0($t0)
        sw    $t0, 248($fp)
        lw    $t0, 240($fp)
        lw    $t1, 248($fp)
        add   $t0, $t0, $t1
        sw    $t0, 252($fp)
        lw    $t0, 252($fp)
        neg   $t0, $t0
        sw    $t0, 256($fp)
        addiu $t0, $fp, 8
        sw    $t0, 260($fp)
        lw    $t0, 260($fp)
        lw    $t0, 0($t0)
        sw    $t0, 264($fp)
        lw    $t0, 256($fp)
        lw    $t1, 264($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 268($fp)
        li    $a0, 7
        lw    $a1, 268($fp)
        jal   func_show
        sw    $v0, 272($fp)
        addiu $t0, $fp, 0
        sw    $t0, 276($fp)
        lw    $t0, 276($fp)
        lw    $t0, 0($t0)
        sw    $t0, 280($fp)
        lw    $t0, 280($fp)
        neg   $t0, $t0
        sw    $t0, 284($fp)
        addiu $t0, $fp, 4
        sw    $t0, 288($fp)
        lw    $t0, 288($fp)
        lw    $t0, 0($t0)
        sw    $t0, 292($fp)
        lw    $t0, 284($fp)
        lw    $t1, 292($fp)
        add   $t0, $t0, $t1
        sw    $t0, 296($fp)
        addiu $t0, $fp, 8
        sw    $t0, 300($fp)
        lw    $t0, 300($fp)
        lw    $t0, 0($t0)
        sw    $t0, 304($fp)
        lw    $t0, 304($fp)
        li    $t1, 2
        add   $t0, $t0, $t1
        sw    $t0, 308($fp)
        lw    $t0, 296($fp)
        lw    $t1, 308($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 312($fp)
        li    $a0, 8
        lw    $a1, 312($fp)
        jal   func_show
        sw    $v0, 316($fp)
        addiu $t0, $fp, 0
        sw    $t0, 320($fp)
        lw    $t0, 320($fp)
        lw    $t0, 0($t0)
        sw    $t0, 324($fp)
        addiu $t0, $fp, 4
        sw    $t0, 328($fp)
        lw    $t0, 328($fp)
        lw    $t0, 0($t0)
        sw    $t0, 332($fp)
        lw    $t0, 324($fp)
        lw    $t1, 332($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 336($fp)
        lw    $t0, 336($fp)
        beqz  $t0, _sc_right_6
        j     _sc_true_7
_sc_true_7:
        li    $t0, 1
        sw    $t0, 396($fp)
        lw    $t0, 396($fp)
        sw    $t0, 400($fp)
        j     _sc_end_8
_sc_right_6:
        addiu $t0, $fp, 4
        sw    $t0, 340($fp)
        lw    $t0, 340($fp)
        lw    $t0, 0($t0)
        sw    $t0, 344($fp)
        addiu $t0, $fp, 8
        sw    $t0, 348($fp)
        lw    $t0, 348($fp)
        lw    $t0, 0($t0)
        sw    $t0, 352($fp)
        lw    $t0, 344($fp)
        lw    $t1, 352($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 356($fp)
        lw    $t0, 356($fp)
        beqz  $t0, _sc_false_10
        j     _sc_right_9
_sc_end_8:
        li    $a0, 9
        lw    $a1, 400($fp)
        jal   func_show_bool
        sw    $v0, 404($fp)
        addiu $t0, $fp, 0
        sw    $t0, 408($fp)
        lw    $t0, 408($fp)
        lw    $t0, 0($t0)
        sw    $t0, 412($fp)
        addiu $t0, $fp, 4
        sw    $t0, 416($fp)
        lw    $t0, 416($fp)
        lw    $t0, 0($t0)
        sw    $t0, 420($fp)
        lw    $t0, 412($fp)
        lw    $t1, 420($fp)
        seq   $t0, $t0, $t1
        sw    $t0, 424($fp)
        lw    $t0, 424($fp)
        seq   $t0, $t0, $zero
        sw    $t0, 428($fp)
        lw    $t0, 428($fp)
        beqz  $t0, _sc_false_13
        j     _sc_right_12
_sc_right_9:
        addiu $t0, $fp, 8
        sw    $t0, 360($fp)
        lw    $t0, 360($fp)
        lw    $t0, 0($t0)
        sw    $t0, 364($fp)
        addiu $t0, $fp, 0
        sw    $t0, 368($fp)
        lw    $t0, 368($fp)
        lw    $t0, 0($t0)
        sw    $t0, 372($fp)
        lw    $t0, 364($fp)
        lw    $t1, 372($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 376($fp)
        lw    $t0, 376($fp)
        sw    $t0, 380($fp)
        lw    $t0, 380($fp)
        sw    $t0, 388($fp)
        j     _sc_end_11
_sc_false_10:
        li    $t0, 0
        sw    $t0, 384($fp)
        lw    $t0, 384($fp)
        sw    $t0, 388($fp)
        j     _sc_end_11
_sc_right_12:
        addiu $t0, $fp, 0
        sw    $t0, 432($fp)
        lw    $t0, 432($fp)
        lw    $t0, 0($t0)
        sw    $t0, 436($fp)
        addiu $t0, $fp, 8
        sw    $t0, 440($fp)
        lw    $t0, 440($fp)
        lw    $t0, 0($t0)
        sw    $t0, 444($fp)
        lw    $t0, 436($fp)
        lw    $t1, 444($fp)
        add   $t0, $t0, $t1
        sw    $t0, 448($fp)
        addiu $t0, $fp, 4
        sw    $t0, 452($fp)
        lw    $t0, 452($fp)
        lw    $t0, 0($t0)
        sw    $t0, 456($fp)
        lw    $t0, 448($fp)
        lw    $t1, 456($fp)
        sgt   $t0, $t0, $t1
        sw    $t0, 460($fp)
        lw    $t0, 460($fp)
        sw    $t0, 464($fp)
        lw    $t0, 464($fp)
        sw    $t0, 472($fp)
        j     _sc_end_14
_sc_false_13:
        li    $t0, 0
        sw    $t0, 468($fp)
        lw    $t0, 468($fp)
        sw    $t0, 472($fp)
        j     _sc_end_14
_sc_end_11:
        lw    $t0, 388($fp)
        sw    $t0, 392($fp)
        lw    $t0, 392($fp)
        sw    $t0, 400($fp)
        j     _sc_end_8
_sc_end_14:
        li    $a0, 10
        lw    $a1, 472($fp)
        jal   func_show_bool
        sw    $v0, 476($fp)
        addiu $t0, $fp, 0
        sw    $t0, 480($fp)
        lw    $t0, 480($fp)
        lw    $t0, 0($t0)
        sw    $t0, 484($fp)
        addiu $t0, $fp, 4
        sw    $t0, 488($fp)
        lw    $t0, 488($fp)
        lw    $t0, 0($t0)
        sw    $t0, 492($fp)
        lw    $t0, 484($fp)
        lw    $t1, 492($fp)
        add   $t0, $t0, $t1
        sw    $t0, 496($fp)
        addiu $t0, $fp, 8
        sw    $t0, 500($fp)
        lw    $t0, 500($fp)
        lw    $t0, 0($t0)
        sw    $t0, 504($fp)
        lw    $t0, 496($fp)
        lw    $t1, 504($fp)
        slt   $t0, $t0, $t1
        sw    $t0, 508($fp)
        lw    $t0, 508($fp)
        seq   $t0, $t0, $zero
        sw    $t0, 512($fp)
        li    $a0, 11
        lw    $a1, 512($fp)
        jal   func_show_bool
        sw    $v0, 516($fp)
        addiu $t0, $fp, 0
        sw    $t0, 520($fp)
        lw    $t0, 520($fp)
        lw    $t0, 0($t0)
        sw    $t0, 524($fp)
        addiu $t0, $fp, 4
        sw    $t0, 528($fp)
        lw    $t0, 528($fp)
        lw    $t0, 0($t0)
        sw    $t0, 532($fp)
        lw    $t0, 524($fp)
        lw    $t1, 532($fp)
        add   $t0, $t0, $t1
        sw    $t0, 536($fp)
        addiu $t0, $fp, 0
        sw    $t0, 540($fp)
        lw    $t0, 540($fp)
        lw    $t0, 0($t0)
        sw    $t0, 544($fp)
        addiu $t0, $fp, 4
        sw    $t0, 548($fp)
        lw    $t0, 548($fp)
        lw    $t0, 0($t0)
        sw    $t0, 552($fp)
        lw    $t0, 544($fp)
        lw    $t1, 552($fp)
        sub   $t0, $t0, $t1
        sw    $t0, 556($fp)
        lw    $t0, 536($fp)
        lw    $t1, 556($fp)
        mul   $t0, $t0, $t1
        sw    $t0, 560($fp)
        addiu $t0, $fp, 8
        sw    $t0, 564($fp)
        lw    $t0, 564($fp)
        lw    $t0, 0($t0)
        sw    $t0, 568($fp)
        lw    $t0, 568($fp)
        li    $t1, 1
        add   $t0, $t0, $t1
        sw    $t0, 572($fp)
        lw    $t0, 560($fp)
        lw    $t1, 572($fp)
        div   $t0, $t0, $t1
        sw    $t0, 576($fp)
        li    $a0, 12
        lw    $a1, 576($fp)
        jal   func_show
        sw    $v0, 580($fp)
        addiu $t0, $fp, 0
        sw    $t0, 584($fp)
        lw    $t0, 584($fp)
        lw    $t0, 0($t0)
        sw    $t0, 588($fp)
        addiu $t0, $fp, 4
        sw    $t0, 592($fp)
        lw    $t0, 592($fp)
        lw    $t0, 0($t0)
        sw    $t0, 596($fp)
        addiu $t0, $fp, 8
        sw    $t0, 600($fp)
        lw    $t0, 600($fp)
        lw    $t0, 0($t0)
        sw    $t0, 604($fp)
        lw    $t0, 596($fp)
        lw    $t1, 604($fp)
        sub   $t0, $t0, $t1
        sw    $t0, 608($fp)
        lw    $t0, 588($fp)
        lw    $t1, 608($fp)
        div   $t0, $t0, $t1
        sw    $t0, 612($fp)
        addiu $t0, $fp, 0
        sw    $t0, 616($fp)
        lw    $t0, 616($fp)
        lw    $t0, 0($t0)
        sw    $t0, 620($fp)
        addiu $t0, $fp, 4
        sw    $t0, 624($fp)
        lw    $t0, 624($fp)
        lw    $t0, 0($t0)
        sw    $t0, 628($fp)
        addiu $t0, $fp, 8
        sw    $t0, 632($fp)
        lw    $t0, 632($fp)
        lw    $t0, 0($t0)
        sw    $t0, 636($fp)
        lw    $t0, 628($fp)
        lw    $t1, 636($fp)
        add   $t0, $t0, $t1
        sw    $t0, 640($fp)
        lw    $t0, 620($fp)
        lw    $t1, 640($fp)
        rem   $t0, $t0, $t1
        sw    $t0, 644($fp)
        lw    $t0, 612($fp)
        lw    $t1, 644($fp)
        add   $t0, $t0, $t1
        sw    $t0, 648($fp)
        li    $a0, 13
        lw    $a1, 648($fp)
        jal   func_show
        sw    $v0, 652($fp)
        li    $v0, 0
        lw    $ra, 668($sp)
        lw    $fp, 664($sp)
        addiu $sp, $sp, 672
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
