export const ARCHITECTURES = {
  mips: {
    id: 'mips',
    name: 'SPIM',
    detail: 'MIPS32',
    textBase: 0x00400000,
    dataBase: 0x10010000,
    heapBase: 0x20000000,
    stackTop: 0x7fffeff0,
    registers: [
      'zero', 'at', 'v0', 'v1', 'a0', 'a1', 'a2', 'a3',
      't0', 't1', 't2', 't3', 't4', 't5', 't6', 't7',
      's0', 's1', 's2', 's3', 's4', 's5', 's6', 's7',
      't8', 't9', 'k0', 'k1', 'gp', 'sp', 'fp', 'ra',
    ],
  },
  riscv: {
    id: 'riscv',
    name: 'RISC-V',
    detail: 'RV32IM',
    textBase: 0x00010000,
    dataBase: 0x10000000,
    heapBase: 0x20000000,
    stackTop: 0x7ffffff0,
    registers: [
      'zero', 'ra', 'sp', 'gp', 'tp', 't0', 't1', 't2',
      's0', 's1', 'a0', 'a1', 'a2', 'a3', 'a4', 'a5',
      'a6', 'a7', 's2', 's3', 's4', 's5', 's6', 's7',
      's8', 's9', 's10', 's11', 't3', 't4', 't5', 't6',
    ],
  },
}

export function registerIndex(architecture, token) {
  const original = token.trim().toLowerCase()
  const name = original.replace(/^\$/, '')
  const config = ARCHITECTURES[architecture]
  if (/^\d+$/.test(name)) {
    const index = Number(name)
    if (index < 32) return index
  }
  if (architecture === 'riscv' && /^x\d+$/.test(name)) {
    const index = Number(name.slice(1))
    if (index < 32) return index
  }
  if (architecture === 'mips' && name === 's8') return 30
  if (architecture === 'riscv' && name === 'fp') return 8
  const index = config.registers.indexOf(name)
  if (index < 0) throw new Error(`未知寄存器：${token}`)
  return index
}

export function registerDisplay(architecture, index) {
  const config = ARCHITECTURES[architecture]
  return architecture === 'mips'
    ? { abi: config.registers[index], number: `$${index}` }
    : { abi: config.registers[index], number: `x${index}` }
}

export function formatValue(value, radix = 16) {
  if (radix === 10) return String(value | 0)
  if (radix === 2) return `0b${(value >>> 0).toString(2).padStart(32, '0')}`
  if (radix === 'unsigned') return String(value >>> 0)
  return `0x${(value >>> 0).toString(16).padStart(8, '0')}`
}
