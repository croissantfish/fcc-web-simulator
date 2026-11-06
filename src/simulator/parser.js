import { ARCHITECTURES } from './isa.js'
import { Memory, parseNumber } from './memory.js'

function stripComment(line) {
  let quote = null
  let escaped = false
  for (let index = 0; index < line.length; index += 1) {
    const char = line[index]
    if (escaped) {
      escaped = false
      continue
    }
    if (char === '\\' && quote) {
      escaped = true
      continue
    }
    if ((char === '"' || char === "'") && (!quote || quote === char)) {
      quote = quote ? null : char
    }
    if (char === '#' && !quote) return line.slice(0, index)
  }
  return line
}

export function splitOperands(text) {
  const result = []
  let current = ''
  let quote = null
  let depth = 0
  for (const char of text) {
    if ((char === '"' || char === "'") && (!quote || quote === char)) quote = quote ? null : char
    if (char === '(' && !quote) depth += 1
    if (char === ')' && !quote) depth -= 1
    if (char === ',' && !quote && depth === 0) {
      result.push(current.trim())
      current = ''
    } else current += char
  }
  if (current.trim() || text.trim()) result.push(current.trim())
  return result
}

export function parseCharLiteral(text) {
  const match = text.trim().match(/^'(.*)'$/s)
  if (!match) return null
  const value = match[1]
  const escapes = { n: 10, r: 13, t: 9, 0: 0, '\\': 92, "'": 39, '"': 34 }
  if (value.length === 1) return value.charCodeAt(0)
  if (value.startsWith('\\') && value.length === 2 && value[1] in escapes) return escapes[value[1]]
  if (/^\\x[\da-f]{2}$/i.test(value)) return Number.parseInt(value.slice(2), 16)
  throw new Error(`无法识别字符字面量：${text}`)
}

function parseString(text) {
  const match = text.trim().match(/^"([\s\S]*)"$/s)
  if (!match) throw new Error(`字符串缺少双引号：${text}`)
  const bytes = []
  const content = match[1]
  for (let index = 0; index < content.length; index += 1) {
    if (content[index] !== '\\') {
      bytes.push(...new TextEncoder().encode(content[index]))
      continue
    }
    index += 1
    const char = content[index]
    const simple = { n: 10, r: 13, t: 9, 0: 0, '\\': 92, '"': 34, "'": 39 }
    if (char in simple) bytes.push(simple[char])
    else if (char === 'x') {
      bytes.push(Number.parseInt(content.slice(index + 1, index + 3), 16))
      index += 2
    } else throw new Error(`不支持的字符串转义：\\${char}`)
  }
  return bytes
}

export function assemble(source, architecture) {
  const config = ARCHITECTURES[architecture]
  if (!config) throw new Error(`不支持的目标架构：${architecture}`)
  const memory = new Memory()
  const symbols = new Map()
  const constants = new Map()
  const instructions = []
  const initializers = []
  const lines = source.replaceAll('\r\n', '\n').split('\n')
  let section = 'text'
  let textAddress = config.textBase
  let dataAddress = config.dataBase

  const define = (name, address) => {
    if (symbols.has(name)) throw new Error(`重复定义标签 ${name}`)
    symbols.set(name, address >>> 0)
  }

  lines.forEach((raw, lineIndex) => {
    const lineNumber = lineIndex + 1
    try {
      let content = stripComment(raw).trim()
      if (!content) return
      const labelPattern = /^([A-Za-z_.$][\w.$]*):/
      let label = content.match(labelPattern)
      while (label) {
        define(label[1], section === 'text' ? textAddress : dataAddress)
        content = content.slice(label[0].length).trim()
        label = content.match(labelPattern)
      }
      if (!content) return
      if (!content.startsWith('.')) {
        if (section !== 'text') throw new Error('指令必须位于 .text 段')
        const match = content.match(/^(\S+)\s*([\s\S]*)$/)
        const op = match[1].toLowerCase()
        instructions.push({ pc: textAddress >>> 0, line: lineNumber, op, args: splitOperands(match[2]), raw: raw.trim() })
        textAddress += 4
        return
      }

      const match = content.match(/^(\S+)\s*([\s\S]*)$/)
      const directive = match[1].toLowerCase()
      const rest = match[2].trim()
      if (directive === '.text') section = 'text'
      else if (['.data', '.bss', '.rodata'].includes(directive) || directive === '.section') section = 'data'
      else if (['.globl', '.global', '.option', '.type', '.size', '.file', '.ident', '.attribute'].includes(directive)) return
      else if (directive === '.set') {
        const operands = splitOperands(rest)
        if (operands.length === 2 && /^[A-Za-z_.$][\w.$]*$/.test(operands[0])) {
          constants.set(operands[0], parseNumber(operands[1]))
        }
      }
      else if (directive === '.eqv') {
        const operands = splitOperands(rest)
        constants.set(operands[0], parseNumber(operands[1]))
      } else {
        if (section === 'text') throw new Error(`${directive} 数据指示符不能位于 .text 段`)
        const operands = splitOperands(rest)
        if (['.align', '.p2align'].includes(directive)) {
          const alignment = 2 ** parseNumber(operands[0])
          dataAddress = Math.ceil(dataAddress / alignment) * alignment
        } else if (directive === '.balign') {
          const alignment = parseNumber(operands[0])
          dataAddress = Math.ceil(dataAddress / alignment) * alignment
        } else if (['.space', '.zero'].includes(directive)) {
          dataAddress += parseNumber(operands[0])
        } else if (['.word', '.4byte', '.half', '.2byte', '.byte', '.1byte'].includes(directive)) {
          const size = ['.word', '.4byte'].includes(directive) ? 4 : ['.half', '.2byte'].includes(directive) ? 2 : 1
          operands.forEach((operand) => {
            initializers.push({ address: dataAddress, size, operand })
            dataAddress += size
          })
        } else if (['.ascii', '.asciiz', '.asciz', '.string'].includes(directive)) {
          const bytes = parseString(rest)
          if (directive !== '.ascii') bytes.push(0)
          initializers.push({ address: dataAddress, size: 0, bytes })
          dataAddress += bytes.length
        } else throw new Error(`暂不支持汇编指示符 ${directive}`)
      }
    } catch (error) {
      throw new Error(`第 ${lineNumber} 行：${error.message}`)
    }
  })

  if (!symbols.has('__global_pointer$')) symbols.set('__global_pointer$', (config.dataBase + 0x800) >>> 0)

  const evaluate = (operand) => {
    const text = operand.trim()
    const character = parseCharLiteral(text)
    if (character !== null) return character
    if (constants.has(text)) return constants.get(text)
    try {
      return parseNumber(text)
    } catch {
      const symbol = text.match(/^([A-Za-z_.$][\w.$]*)(?:\s*([+-])\s*(.+))?$/)
      if (!symbol || !symbols.has(symbol[1])) throw new Error(`未知符号或数值：${text}`)
      const offset = symbol[2] ? evaluate(symbol[3]) * (symbol[2] === '-' ? -1 : 1) : 0
      return symbols.get(symbol[1]) + offset
    }
  }

  initializers.forEach((item) => {
    if (item.bytes) memory.writeBytes(item.address, Uint8Array.from(item.bytes))
    else {
      const value = evaluate(item.operand)
      if (item.size === 1) memory.write8(item.address, value)
      else if (item.size === 2) memory.write16(item.address, value)
      else memory.write32(item.address, value)
    }
  })

  const entryName = symbols.has('_start') ? '_start' : 'main'
  if (!symbols.has(entryName)) throw new Error('找不到程序入口，请定义 main: 或 _start: 标签')
  const instructionMap = new Map(instructions.map((instruction) => [instruction.pc, instruction]))
  const lineMap = new Map(instructions.map((instruction) => [instruction.line, instruction.pc]))
  const dataLabels = [...symbols.entries()]
    .filter(([, address]) => address >= config.dataBase && address < dataAddress)
    .map(([name, address]) => ({ name, address }))

  return {
    architecture,
    memory,
    symbols,
    instructions,
    instructionMap,
    lineMap,
    dataLabels,
    entry: symbols.get(entryName),
    entryName,
    dataStart: config.dataBase,
    dataEnd: dataAddress,
    heapStart: config.heapBase,
    evaluate,
  }
}
