import linearSearchMips from './002_linear_search_mips32.s?raw'
import linearSearchRiscv from './002_linear_search_riscv32.s?raw'
import binarySearchMips from './003_binary_search_mips32.s?raw'
import binarySearchRiscv from './003_binary_search_riscv32.s?raw'
import hanoiMips from './009_hanoi_mips32.s?raw'
import hanoiRiscv from './009_hanoi_riscv32.s?raw'
import expressionMips from './018_expr_precedence_mips32.s?raw'
import expressionRiscv from './018_expr_precedence_riscv32.s?raw'

const metadata = [
  {
    id: 'fcc-linear-search',
    name: '线性查找（FCC）',
    description: 'FCC 编译器产物 · 数组、循环与顺序查找',
    input: '5\n1 3 5 7 9\n5\n',
    mips: linearSearchMips,
    riscv: linearSearchRiscv,
  },
  {
    id: 'fcc-binary-search',
    name: '二分查找（FCC）',
    description: 'FCC 编译器产物 · 函数调用与二分查找',
    input: '5\n1 3 5 7 9\n7\n',
    mips: binarySearchMips,
    riscv: binarySearchRiscv,
  },
  {
    id: 'fcc-hanoi',
    name: '汉诺塔（FCC）',
    description: 'FCC 编译器产物 · 递归、字符与字符串输出',
    input: '3\n',
    mips: hanoiMips,
    riscv: hanoiRiscv,
  },
  {
    id: 'fcc-expression',
    name: '表达式求值（FCC）',
    description: 'FCC 编译器产物 · 优先级、乘除、取余与短路求值',
    input: '17 5 3\n',
    mips: expressionMips,
    riscv: expressionRiscv,
  },
]

export const FCC_EXAMPLES = Object.fromEntries(['mips', 'riscv'].map((architecture) => [
  architecture,
  metadata.map(({ mips, riscv, ...example }) => ({ ...example, code: architecture === 'mips' ? mips : riscv })),
]))
