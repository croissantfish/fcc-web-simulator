import { assemble } from './parser.js'
import { ARCHITECTURES, registerDisplay, registerIndex } from './isa.js'
import { hex, parseNumber, u32 } from './memory.js'

const BUILTINS = new Set([
  'getchar', 'getint', 'getstr', 'putchar', 'putint', 'putstr',
  'malloc', 'free', '__malloc_struct', '__malloc_array', '__free_struct', '__free_array',
])

const whitespace = new Set([9, 10, 13, 32])
const encoder = new TextEncoder()

export class Simulator {
  constructor(architecture = 'mips') {
    this.architecture = architecture
    this.config = ARCHITECTURES[architecture]
    this.program = null
    this.status = 'empty'
  }

  load(source, input = '') {
    this.program = assemble(source, this.architecture)
    this.registers = new Int32Array(32)
    this.memory = this.program.memory
    this.pc = this.program.entry
    this.hi = 0
    this.lo = 0
    this.heapPointer = this.program.heapStart
    this.steps = 0
    this.output = ''
    this.exitCode = null
    this.status = 'ready'
    this.error = null
    this.changedRegisters = new Set()
    this.decoder = new TextDecoder()
    this.setInput(input)
    this.setRegister('sp', this.config.stackTop)
    this.setRegister('gp', this.program.symbols.get('__global_pointer$') || 0)
    this.setRegister('ra', 0)
    this.memory.clearDirty()
    this.changedRegisters.clear()
    return this.program
  }

  setInput(input) {
    this.inputBytes = encoder.encode(input)
    this.inputOffset = 0
  }

  index(register) {
    return registerIndex(this.architecture, register)
  }

  getRegister(register) {
    return this.registers[this.index(register)] | 0
  }

  setRegister(register, value) {
    const index = typeof register === 'number' ? register : this.index(register)
    if (index === 0) return
    const next = value | 0
    if (this.registers[index] !== next) this.changedRegisters.add(index)
    this.registers[index] = next
  }

  evaluate(operand) {
    return this.program.evaluate(operand) | 0
  }

  address(operand) {
    const match = operand.trim().match(/^([^(]*)\(([^)]+)\)$/)
    if (!match) return u32(this.evaluate(operand))
    const offset = match[1].trim() ? this.evaluate(match[1]) : 0
    return u32(this.getRegister(match[2]) + offset)
  }

  target(operand) {
    return u32(this.evaluate(operand))
  }

  appendBytes(bytes) {
    if (!bytes.length) return
    this.output += this.decoder.decode(Uint8Array.from(bytes), { stream: true })
  }

  appendText(text) {
    this.appendBytes([...encoder.encode(text)])
  }

  readByte() {
    if (this.inputOffset >= this.inputBytes.length) return -1
    return this.inputBytes[this.inputOffset++]
  }

  readInteger() {
    let byte = this.readByte()
    while (byte >= 0 && whitespace.has(byte)) byte = this.readByte()
    let sign = 1
    if (byte === 45) {
      sign = -1
      byte = this.readByte()
    }
    let value = 0
    let found = false
    while (byte >= 48 && byte <= 57) {
      found = true
      value = (value * 10 + byte - 48) | 0
      byte = this.readByte()
    }
    return found ? (value * sign) | 0 : 0
  }

  allocate(size) {
    const result = this.heapPointer
    this.heapPointer = u32(this.heapPointer + Math.max(0, size | 0))
    return result
  }

  invokeBuiltin(name) {
    if (!BUILTINS.has(name) || this.program.symbols.has(name)) return false
    const resultRegister = this.architecture === 'mips' ? 'v0' : 'a0'
    const argument = this.getRegister('a0')
    switch (name) {
      case 'getint': this.setRegister(resultRegister, this.readInteger()); break
      case 'getchar': this.setRegister(resultRegister, this.readByte()); break
      case 'putint': this.appendText(String(argument | 0)); break
      case 'putchar': this.appendBytes([argument & 0xff]); break
      case 'putstr': this.appendText(this.memory.readString(argument)); break
      case 'getstr': {
        const bytes = []
        let byte = this.readByte()
        while (byte >= 0 && byte !== 10) {
          bytes.push(byte)
          byte = this.readByte()
        }
        bytes.push(0)
        this.memory.writeBytes(argument, Uint8Array.from(bytes))
        this.setRegister(resultRegister, bytes.length - 1)
        break
      }
      case 'malloc':
      case '__malloc_struct': this.setRegister(resultRegister, this.allocate(argument)); break
      case '__malloc_array': {
        const count = argument | 0
        const size = this.getRegister('a1') | 0
        const base = this.allocate(count * size + 4)
        this.memory.write32(base, count)
        this.setRegister(resultRegister, base + 4)
        break
      }
      case 'free':
      case '__free_struct':
      case '__free_array': break
      default: return false
    }
    return true
  }

  syscall() {
    const number = this.getRegister('v0')
    const a0 = this.getRegister('a0')
    switch (number) {
      case 1: this.appendText(String(a0 | 0)); break
      case 4: this.appendText(this.memory.readString(a0)); break
      case 5: this.setRegister('v0', this.readInteger()); break
      case 8: {
        const maximum = Math.max(0, this.getRegister('a1') | 0)
        const bytes = []
        let byte = this.readByte()
        while (byte >= 0 && bytes.length < Math.max(0, maximum - 1)) {
          bytes.push(byte)
          if (byte === 10) break
          byte = this.readByte()
        }
        bytes.push(0)
        this.memory.writeBytes(a0, Uint8Array.from(bytes))
        break
      }
      case 9: {
        const previous = this.heapPointer
        this.heapPointer = u32(this.heapPointer + a0)
        this.setRegister('v0', previous)
        break
      }
      case 10:
      case 17:
        this.exitCode = number === 17 ? a0 : 0
        this.status = 'finished'
        break
      case 11: this.appendBytes([a0 & 0xff]); break
      case 12: this.setRegister('v0', this.readByte()); break
      default: throw new Error(`暂不支持 SPIM syscall ${number}`)
    }
  }

  ecall() {
    const number = this.getRegister('a7')
    const a0 = this.getRegister('a0')
    switch (number) {
      case 63: {
        if (a0 !== 0) {
          this.setRegister('a0', -1)
          break
        }
        const count = Math.max(0, this.getRegister('a2') | 0)
        const address = this.getRegister('a1')
        let read = 0
        while (read < count) {
          const byte = this.readByte()
          if (byte < 0) break
          this.memory.write8(address + read, byte)
          read += 1
        }
        this.setRegister('a0', read)
        break
      }
      case 64: {
        if (![1, 2].includes(a0)) {
          this.setRegister('a0', -1)
          break
        }
        const count = Math.max(0, this.getRegister('a2') | 0)
        const address = this.getRegister('a1')
        this.appendBytes(this.memory.readBytes(address, count))
        this.setRegister('a0', count)
        break
      }
      case 93:
      case 94:
        this.exitCode = a0
        this.status = 'finished'
        break
      case 214: {
        const previous = this.heapPointer
        this.heapPointer = u32(this.heapPointer + a0)
        this.setRegister('a0', previous)
        break
      }
      default: throw new Error(`暂不支持 RISC-V ecall ${number}`)
    }
  }

  branch(condition, operand, nextPc) {
    return condition ? this.target(operand) : nextPc
  }

  divide(dividend, divisor, unsigned = false) {
    if (unsigned) {
      const left = dividend >>> 0
      const right = divisor >>> 0
      return right === 0 ? 0xffffffff : Math.floor(left / right) | 0
    }
    if (divisor === 0) return -1
    return Math.trunc(dividend / divisor) | 0
  }

  remainder(dividend, divisor, unsigned = false) {
    if (unsigned) {
      const left = dividend >>> 0
      const right = divisor >>> 0
      return right === 0 ? left : (left % right) | 0
    }
    if (divisor === 0) return dividend
    return (dividend % divisor) | 0
  }

  executeMips(instruction) {
    const { op, args } = instruction
    const nextPc = u32(this.pc + 4)
    const r = (index) => this.getRegister(args[index])
    const w = (index, value) => this.setRegister(args[index], value)
    const immediate = (index) => this.evaluate(args[index])
    let destination = nextPc
    switch (op) {
      case 'nop': break
      case 'move': w(0, r(1)); break
      case 'li': w(0, immediate(1)); break
      case 'la': w(0, this.target(args[1])); break
      case 'lui': w(0, immediate(1) << 16); break
      case 'add': case 'addu': case 'addi': case 'addiu':
        w(0, r(1) + (op.startsWith('addi') ? immediate(2) : r(2))); break
      case 'sub': case 'subu': w(0, r(1) - r(2)); break
      case 'neg': case 'negu': w(0, -r(1)); break
      case 'not': w(0, ~r(1)); break
      case 'abs': w(0, Math.abs(r(1))); break
      case 'mul': w(0, Math.imul(r(1), r(2))); break
      case 'mult': case 'multu': {
        const product = op === 'mult'
          ? BigInt(r(0)) * BigInt(r(1))
          : BigInt(r(0) >>> 0) * BigInt(r(1) >>> 0)
        this.lo = Number(BigInt.asIntN(32, product))
        this.hi = Number(BigInt.asIntN(32, product >> 32n))
        break
      }
      case 'div':
        if (args.length === 2) {
          if (r(1) === 0) throw new Error('除数为零')
          this.lo = this.divide(r(0), r(1))
          this.hi = this.remainder(r(0), r(1))
        } else {
          if (r(2) === 0) throw new Error('除数为零')
          w(0, this.divide(r(1), r(2)))
        }
        break
      case 'divu':
        if (r(1) === 0 || (args.length === 3 && r(2) === 0)) throw new Error('除数为零')
        if (args.length === 2) {
          this.lo = this.divide(r(0), r(1), true)
          this.hi = this.remainder(r(0), r(1), true)
        } else w(0, this.divide(r(1), r(2), true))
        break
      case 'rem': w(0, this.remainder(r(1), r(2))); break
      case 'remu': w(0, this.remainder(r(1), r(2), true)); break
      case 'mfhi': w(0, this.hi); break
      case 'mflo': w(0, this.lo); break
      case 'mthi': this.hi = r(0); break
      case 'mtlo': this.lo = r(0); break
      case 'and': w(0, r(1) & r(2)); break
      case 'or': w(0, r(1) | r(2)); break
      case 'xor': w(0, r(1) ^ r(2)); break
      case 'nor': w(0, ~(r(1) | r(2))); break
      case 'andi': w(0, r(1) & immediate(2)); break
      case 'ori': w(0, r(1) | immediate(2)); break
      case 'xori': w(0, r(1) ^ immediate(2)); break
      case 'sll': w(0, r(1) << (immediate(2) & 31)); break
      case 'srl': w(0, r(1) >>> (immediate(2) & 31)); break
      case 'sra': w(0, r(1) >> (immediate(2) & 31)); break
      case 'sllv': w(0, r(1) << (r(2) & 31)); break
      case 'srlv': w(0, r(1) >>> (r(2) & 31)); break
      case 'srav': w(0, r(1) >> (r(2) & 31)); break
      case 'slt': w(0, r(1) < r(2) ? 1 : 0); break
      case 'sltu': w(0, (r(1) >>> 0) < (r(2) >>> 0) ? 1 : 0); break
      case 'slti': w(0, r(1) < immediate(2) ? 1 : 0); break
      case 'sltiu': w(0, (r(1) >>> 0) < (immediate(2) >>> 0) ? 1 : 0); break
      case 'seq': w(0, r(1) === r(2) ? 1 : 0); break
      case 'sne': w(0, r(1) !== r(2) ? 1 : 0); break
      case 'sge': w(0, r(1) >= r(2) ? 1 : 0); break
      case 'sgeu': w(0, (r(1) >>> 0) >= (r(2) >>> 0) ? 1 : 0); break
      case 'sgt': w(0, r(1) > r(2) ? 1 : 0); break
      case 'sgtu': w(0, (r(1) >>> 0) > (r(2) >>> 0) ? 1 : 0); break
      case 'sle': w(0, r(1) <= r(2) ? 1 : 0); break
      case 'sleu': w(0, (r(1) >>> 0) <= (r(2) >>> 0) ? 1 : 0); break
      case 'lw': w(0, this.memory.read32(this.address(args[1]))); break
      case 'sw': this.memory.write32(this.address(args[1]), r(0)); break
      case 'lb': w(0, (this.memory.read8(this.address(args[1])) << 24) >> 24); break
      case 'lbu': w(0, this.memory.read8(this.address(args[1]))); break
      case 'lh': w(0, (this.memory.read16(this.address(args[1])) << 16) >> 16); break
      case 'lhu': w(0, this.memory.read16(this.address(args[1]))); break
      case 'sb': this.memory.write8(this.address(args[1]), r(0)); break
      case 'sh': this.memory.write16(this.address(args[1]), r(0)); break
      case 'beq': case 'bne': case 'blt': case 'ble': case 'bgt': case 'bge': {
        const conditions = {
          beq: r(0) === r(1), bne: r(0) !== r(1), blt: r(0) < r(1),
          ble: r(0) <= r(1), bgt: r(0) > r(1), bge: r(0) >= r(1),
        }
        destination = this.branch(conditions[op], args[2], nextPc)
        break
      }
      case 'beqz': destination = this.branch(r(0) === 0, args[1], nextPc); break
      case 'bnez': destination = this.branch(r(0) !== 0, args[1], nextPc); break
      case 'blez': destination = this.branch(r(0) <= 0, args[1], nextPc); break
      case 'bgtz': destination = this.branch(r(0) > 0, args[1], nextPc); break
      case 'bltz': destination = this.branch(r(0) < 0, args[1], nextPc); break
      case 'bgez': destination = this.branch(r(0) >= 0, args[1], nextPc); break
      case 'b': destination = this.target(args[0]); break
      case 'j': destination = this.target(args[0]); break
      case 'jal':
        this.setRegister('ra', nextPc)
        if (!this.program.symbols.has(args[0]) && this.invokeBuiltin(args[0])) destination = nextPc
        else destination = this.target(args[0])
        break
      case 'jr': destination = u32(r(0)); break
      case 'jalr': {
        const target = r(args.length - 1)
        this.setRegister(args.length === 2 ? args[0] : 'ra', nextPc)
        destination = u32(target)
        break
      }
      case 'movz': if (r(2) === 0) w(0, r(1)); break
      case 'movn': if (r(2) !== 0) w(0, r(1)); break
      case 'syscall': this.syscall(); break
      default: throw new Error(`暂不支持 MIPS 指令 ${op}`)
    }
    return destination
  }

  executeRiscv(instruction) {
    const { op, args } = instruction
    const nextPc = u32(this.pc + 4)
    const r = (index) => this.getRegister(args[index])
    const w = (index, value) => this.setRegister(args[index], value)
    const immediate = (index) => this.evaluate(args[index])
    let destination = nextPc
    switch (op) {
      case 'nop': break
      case 'mv': w(0, r(1)); break
      case 'li': w(0, immediate(1)); break
      case 'la': w(0, this.target(args[1])); break
      case 'lui': w(0, immediate(1) << 12); break
      case 'auipc': w(0, this.pc + (immediate(1) << 12)); break
      case 'add': w(0, r(1) + r(2)); break
      case 'addi': w(0, r(1) + immediate(2)); break
      case 'sub': w(0, r(1) - r(2)); break
      case 'neg': w(0, -r(1)); break
      case 'not': w(0, ~r(1)); break
      case 'mul': w(0, Math.imul(r(1), r(2))); break
      case 'mulh': w(0, Number(BigInt.asIntN(32, (BigInt(r(1)) * BigInt(r(2))) >> 32n))); break
      case 'mulhu': w(0, Number(BigInt.asUintN(32, (BigInt(r(1) >>> 0) * BigInt(r(2) >>> 0)) >> 32n))); break
      case 'mulhsu': w(0, Number(BigInt.asIntN(32, (BigInt(r(1)) * BigInt(r(2) >>> 0)) >> 32n))); break
      case 'div': w(0, this.divide(r(1), r(2))); break
      case 'divu': w(0, this.divide(r(1), r(2), true)); break
      case 'rem': w(0, this.remainder(r(1), r(2))); break
      case 'remu': w(0, this.remainder(r(1), r(2), true)); break
      case 'and': w(0, r(1) & r(2)); break
      case 'or': w(0, r(1) | r(2)); break
      case 'xor': w(0, r(1) ^ r(2)); break
      case 'andi': w(0, r(1) & immediate(2)); break
      case 'ori': w(0, r(1) | immediate(2)); break
      case 'xori': w(0, r(1) ^ immediate(2)); break
      case 'sll': w(0, r(1) << (r(2) & 31)); break
      case 'srl': w(0, r(1) >>> (r(2) & 31)); break
      case 'sra': w(0, r(1) >> (r(2) & 31)); break
      case 'slli': w(0, r(1) << (immediate(2) & 31)); break
      case 'srli': w(0, r(1) >>> (immediate(2) & 31)); break
      case 'srai': w(0, r(1) >> (immediate(2) & 31)); break
      case 'slt': w(0, r(1) < r(2) ? 1 : 0); break
      case 'sltu': w(0, (r(1) >>> 0) < (r(2) >>> 0) ? 1 : 0); break
      case 'slti': w(0, r(1) < immediate(2) ? 1 : 0); break
      case 'sltiu': w(0, (r(1) >>> 0) < (immediate(2) >>> 0) ? 1 : 0); break
      case 'seqz': w(0, r(1) === 0 ? 1 : 0); break
      case 'snez': w(0, r(1) !== 0 ? 1 : 0); break
      case 'sltz': w(0, r(1) < 0 ? 1 : 0); break
      case 'sgtz': w(0, r(1) > 0 ? 1 : 0); break
      case 'lw': w(0, this.memory.read32(this.address(args[1]))); break
      case 'sw': this.memory.write32(this.address(args[1]), r(0)); break
      case 'lb': w(0, (this.memory.read8(this.address(args[1])) << 24) >> 24); break
      case 'lbu': w(0, this.memory.read8(this.address(args[1]))); break
      case 'lh': w(0, (this.memory.read16(this.address(args[1])) << 16) >> 16); break
      case 'lhu': w(0, this.memory.read16(this.address(args[1]))); break
      case 'sb': this.memory.write8(this.address(args[1]), r(0)); break
      case 'sh': this.memory.write16(this.address(args[1]), r(0)); break
      case 'beq': case 'bne': case 'blt': case 'bge': case 'bltu': case 'bgeu':
      case 'bgt': case 'ble': case 'bgtu': case 'bleu': {
        const unsigned = op.endsWith('u')
        const left = unsigned ? r(0) >>> 0 : r(0)
        const right = unsigned ? r(1) >>> 0 : r(1)
        const conditions = {
          beq: left === right, bne: left !== right, blt: left < right, bge: left >= right,
          bltu: left < right, bgeu: left >= right, bgt: left > right, ble: left <= right,
          bgtu: left > right, bleu: left <= right,
        }
        destination = this.branch(conditions[op], args[2], nextPc)
        break
      }
      case 'beqz': destination = this.branch(r(0) === 0, args[1], nextPc); break
      case 'bnez': destination = this.branch(r(0) !== 0, args[1], nextPc); break
      case 'blez': destination = this.branch(r(0) <= 0, args[1], nextPc); break
      case 'bgez': destination = this.branch(r(0) >= 0, args[1], nextPc); break
      case 'bltz': destination = this.branch(r(0) < 0, args[1], nextPc); break
      case 'bgtz': destination = this.branch(r(0) > 0, args[1], nextPc); break
      case 'j': destination = this.target(args[0]); break
      case 'jr': destination = u32(r(0)); break
      case 'ret': destination = u32(this.getRegister('ra')); break
      case 'jal': {
        const label = args[args.length - 1]
        this.setRegister(args.length === 2 ? args[0] : 'ra', nextPc)
        destination = this.target(label)
        break
      }
      case 'call': {
        this.setRegister('ra', nextPc)
        if (!this.program.symbols.has(args[0]) && this.invokeBuiltin(args[0])) destination = nextPc
        else destination = this.target(args[0])
        break
      }
      case 'jalr': {
        let target
        if (args.length === 1) {
          target = this.address(`0(${args[0]})`)
          this.setRegister('ra', nextPc)
        } else {
          target = this.address(args[1])
          this.setRegister(args[0], nextPc)
        }
        destination = u32(target) & ~1
        break
      }
      case 'ecall': this.ecall(); break
      default: throw new Error(`暂不支持 RISC-V 指令 ${op}`)
    }
    return destination
  }

  step() {
    if (!this.program) throw new Error('请先装载汇编程序')
    if (this.status === 'finished') return { reason: 'finished', steps: 0 }
    if (this.status === 'error') throw new Error(this.error)
    const instruction = this.program.instructionMap.get(this.pc)
    if (!instruction) {
      if (this.pc === 0) {
        this.status = 'finished'
        this.exitCode ??= this.architecture === 'riscv' ? this.getRegister('a0') : 0
        return { reason: 'finished', steps: 0 }
      }
      const error = new Error(`程序计数器 ${hex(this.pc)} 没有可执行指令`)
      this.status = 'error'
      this.error = error.message
      throw error
    }
    this.changedRegisters.clear()
    this.memory.clearDirty()
    try {
      const destination = this.architecture === 'mips'
        ? this.executeMips(instruction)
        : this.executeRiscv(instruction)
      this.pc = destination
      this.steps += 1
      if (this.status !== 'finished') this.status = 'paused'
      return { reason: this.status === 'finished' ? 'finished' : 'paused', steps: 1, instruction }
    } catch (error) {
      const wrapped = new Error(`第 ${instruction.line} 行 · ${hex(instruction.pc)}：${error.message}`)
      this.status = 'error'
      this.error = wrapped.message
      throw wrapped
    }
  }

  run(breakpoints = new Set(), { maxSteps = 100000, skipCurrent = false } = {}) {
    if (!this.program) throw new Error('请先装载汇编程序')
    let executed = 0
    let first = true
    this.status = 'running'
    while (executed < maxSteps && this.status !== 'finished') {
      if (breakpoints.has(this.pc) && !(first && skipCurrent)) {
        this.status = 'paused'
        return { reason: 'breakpoint', steps: executed }
      }
      const result = this.step()
      this.status = 'running'
      executed += result.steps
      first = false
      if (result.reason === 'finished') {
        this.status = 'finished'
        return { reason: 'finished', steps: executed }
      }
    }
    this.status = 'paused'
    return { reason: executed >= maxSteps ? 'limit' : 'paused', steps: executed }
  }

  getRegisters() {
    if (!this.program) return []
    const rows = this.config.registers.map((_, index) => ({
      ...registerDisplay(this.architecture, index),
      index,
      value: this.registers[index],
      changed: this.changedRegisters.has(index),
    }))
    rows.push({ abi: 'pc', number: 'PC', index: 'pc', value: this.pc | 0, changed: false })
    if (this.architecture === 'mips') {
      rows.push({ abi: 'hi', number: 'HI', index: 'hi', value: this.hi, changed: false })
      rows.push({ abi: 'lo', number: 'LO', index: 'lo', value: this.lo, changed: false })
    }
    return rows
  }

  editRegister(index, text) {
    const value = parseNumber(text)
    if (index === 'pc') this.pc = u32(value)
    else if (index === 'hi') this.hi = value | 0
    else if (index === 'lo') this.lo = value | 0
    else this.setRegister(index, value)
  }

  getMemoryWords(start, count) {
    return Array.from({ length: count }, (_, index) => {
      const address = u32(start + index * 4)
      const bytes = this.memory.readBytes(address, 4)
      return {
        address,
        value: this.memory.read32(address),
        bytes,
        ascii: String.fromCharCode(...bytes).replace(/[\x00-\x1f\x7f-\xff]/g, '·'),
        dirty: [...Array(4)].some((_, offset) => this.memory.dirty.has(u32(address + offset))),
      }
    })
  }

  isCall(instruction = this.program?.instructionMap.get(this.pc)) {
    if (!instruction) return false
    return this.architecture === 'mips'
      ? ['jal', 'jalr'].includes(instruction.op)
      : ['call', 'jal', 'jalr'].includes(instruction.op)
  }
}
