export const EXAMPLES = {
  mips: [
    {
      id: 'factorial',
      name: '递归阶乘',
      description: '函数调用、递归与标准 I/O',
      input: '5\n',
      code: `# FCC / SPIM 递归阶乘示例
        .data
prompt: .asciiz "n = "
result: .asciiz "n! = "
nl:     .asciiz "\\n"

        .text
        .globl main
getint:
        li    $v0, 5
        syscall
        jr    $ra
putint:
        li    $v0, 1
        syscall
        jr    $ra
putstr:
        li    $v0, 4
        syscall
        jr    $ra
fact:
        addiu $sp, $sp, -16
        sw    $ra, 12($sp)
        sw    $a0, 8($sp)
        li    $t0, 1
        ble   $a0, $t0, fact_base
        addiu $a0, $a0, -1
        jal   fact
        lw    $t1, 8($sp)
        mul   $v0, $v0, $t1
        j     fact_done
fact_base:
        li    $v0, 1
fact_done:
        lw    $ra, 12($sp)
        addiu $sp, $sp, 16
        jr    $ra
main:
        la    $a0, prompt
        jal   putstr
        jal   getint
        move  $a0, $v0
        jal   fact
        move  $s0, $v0
        la    $a0, result
        jal   putstr
        move  $a0, $s0
        jal   putint
        la    $a0, nl
        jal   putstr
        li    $v0, 10
        syscall`,
    },
    {
      id: 'array',
      name: '数组求和',
      description: '数据段、循环与字寻址',
      input: '',
      code: `.data
values: .word 12, -4, 27, 9
msg:    .asciiz "sum = "
nl:     .asciiz "\\n"
.text
.globl main
main:
    la    $s0, values
    li    $s1, 0
    li    $s2, 0
loop:
    li    $t0, 4
    bge   $s1, $t0, done
    sll   $t1, $s1, 2
    addu  $t1, $s0, $t1
    lw    $t2, 0($t1)
    add   $s2, $s2, $t2
    addiu $s1, $s1, 1
    j     loop
done:
    li    $v0, 4
    la    $a0, msg
    syscall
    li    $v0, 1
    move  $a0, $s2
    syscall
    li    $v0, 4
    la    $a0, nl
    syscall
    li    $v0, 10
    syscall`,
    },
  ],
  riscv: [
    {
      id: 'factorial',
      name: '递归阶乘',
      description: 'RV32IM、函数调用与 FCC I/O',
      input: '5\n',
      code: `# FCC / RISC-V 递归阶乘示例
    .option norelax
    .text
    .globl main
main:
    addi  sp, sp, -16
    sw    ra, 12(sp)
    la    a0, prompt
    call  putstr
    call  getint
    call  fact
    mv    s0, a0
    la    a0, result
    call  putstr
    mv    a0, s0
    call  putint
    la    a0, nl
    call  putstr
    li    a0, 0
    lw    ra, 12(sp)
    addi  sp, sp, 16
    ret
fact:
    addi  sp, sp, -16
    sw    ra, 12(sp)
    sw    a0, 8(sp)
    li    t0, 1
    ble   a0, t0, fact_base
    addi  a0, a0, -1
    call  fact
    lw    t0, 8(sp)
    mul   a0, a0, t0
    j     fact_done
fact_base:
    li    a0, 1
fact_done:
    lw    ra, 12(sp)
    addi  sp, sp, 16
    ret
    .data
prompt: .asciz "n = "
result: .asciz "n! = "
nl:     .asciz "\\n"`,
    },
    {
      id: 'array',
      name: '数组求和',
      description: '数据段、循环与字寻址',
      input: '',
      code: `.data
values: .word 12, -4, 27, 9
msg:    .string "sum = "
nl:     .string "\\n"
.text
.globl main
main:
    la    s0, values
    li    s1, 0
    li    s2, 0
loop:
    li    t0, 4
    bge   s1, t0, done
    slli  t1, s1, 2
    add   t1, s0, t1
    lw    t2, 0(t1)
    add   s2, s2, t2
    addi  s1, s1, 1
    j     loop
done:
    la    a0, msg
    call  putstr
    mv    a0, s2
    call  putint
    la    a0, nl
    call  putstr
    li    a0, 0
    li    a7, 93
    ecall`,
    },
  ],
}
