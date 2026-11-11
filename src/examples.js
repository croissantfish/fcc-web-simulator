import { FCC_EXAMPLES } from './examples/fcc/index.js'

export const EXAMPLES = {
  mips: [
    {
      id: 'hello',
      name: 'Hello World',
      description: '最小程序、字符串输出与退出',
      input: '',
      code: `.data
message: .asciiz "Hello, world!\\n"

    .text
    .globl main
main:
    li    $v0, 4
    la    $a0, message
    syscall
    li    $v0, 10
    syscall`,
    },
    {
      id: 'gcd',
      name: '欧几里得算法',
      description: '辗转相除法、循环与取余',
      input: '1071 462\n',
      code: `# FCC / SPIM 欧几里得算法示例
        .data
prompt_a: .asciiz "a = "
prompt_b: .asciiz "b = "
result:   .asciiz "gcd = "
nl:       .asciiz "\\n"

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

# gcd(a, b)：当 b 不为 0 时，反复执行 (a, b) = (b, a % b)
gcd:
        move  $t0, $a0
        move  $t1, $a1
gcd_loop:
        beqz  $t1, gcd_done
        div   $t0, $t1
        mfhi  $t2
        move  $t0, $t1
        move  $t1, $t2
        j     gcd_loop
gcd_done:
        move  $v0, $t0
        jr    $ra

main:
        la    $a0, prompt_a
        jal   putstr
        jal   getint
        move  $s0, $v0
        la    $a0, prompt_b
        jal   putstr
        jal   getint
        move  $s1, $v0
        move  $a0, $s0
        move  $a1, $s1
        jal   gcd
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
    ...FCC_EXAMPLES.mips,
  ],
  riscv: [
    {
      id: 'hello',
      name: 'Hello World',
      description: '最小程序、字符串输出与退出',
      input: '',
      code: `.option norelax
    .data
message: .asciz "Hello, world!\\n"

    .text
    .globl main
main:
    li    a0, 1
    la    a1, message
    li    a2, 14
    li    a7, 64
    ecall
    li    a0, 0
    li    a7, 93
    ecall`,
    },
    {
      id: 'gcd',
      name: '欧几里得算法',
      description: '辗转相除法、循环与取余',
      input: '1071 462\n',
      code: `# FCC / RISC-V 欧几里得算法示例
    .option norelax
    .text
    .globl main
main:
    addi  sp, sp, -16
    sw    ra, 12(sp)
    sw    s0, 8(sp)
    sw    s1, 4(sp)
    la    a0, prompt_a
    call  putstr
    call  getint
    mv    s0, a0
    la    a0, prompt_b
    call  putstr
    call  getint
    mv    s1, a0
    mv    a0, s0
    mv    a1, s1
    call  gcd
    mv    s0, a0
    la    a0, result
    call  putstr
    mv    a0, s0
    call  putint
    la    a0, nl
    call  putstr
    li    a0, 0
    lw    ra, 12(sp)
    lw    s0, 8(sp)
    lw    s1, 4(sp)
    addi  sp, sp, 16
    ret

# gcd(a, b)：当 b 不为 0 时，反复执行 (a, b) = (b, a % b)
gcd:
    mv    t0, a0
    mv    t1, a1
gcd_loop:
    beqz  t1, gcd_done
    rem   t2, t0, t1
    mv    t0, t1
    mv    t1, t2
    j     gcd_loop
gcd_done:
    mv    a0, t0
    ret

    .data
prompt_a: .asciz "a = "
prompt_b: .asciz "b = "
result:   .asciz "gcd = "
nl:       .asciz "\\n"`,
    },
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
    ...FCC_EXAMPLES.riscv,
  ],
}
