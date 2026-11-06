const PAGE_SIZE = 4096

export class Memory {
  constructor() {
    this.pages = new Map()
    this.dirty = new Set()
  }

  page(address, create = false) {
    const key = Math.floor((address >>> 0) / PAGE_SIZE)
    if (!this.pages.has(key) && create) this.pages.set(key, new Uint8Array(PAGE_SIZE))
    return this.pages.get(key)
  }

  read8(address) {
    const page = this.page(address)
    return page ? page[(address >>> 0) % PAGE_SIZE] : 0
  }

  read16(address) {
    return this.read8(address) | (this.read8(address + 1) << 8)
  }

  read32(address) {
    return (this.read8(address) |
      (this.read8(address + 1) << 8) |
      (this.read8(address + 2) << 16) |
      (this.read8(address + 3) << 24)) | 0
  }

  write8(address, value) {
    const page = this.page(address, true)
    page[(address >>> 0) % PAGE_SIZE] = value & 0xff
    this.dirty.add(address >>> 0)
  }

  write16(address, value) {
    this.write8(address, value)
    this.write8(address + 1, value >>> 8)
  }

  write32(address, value) {
    this.write8(address, value)
    this.write8(address + 1, value >>> 8)
    this.write8(address + 2, value >>> 16)
    this.write8(address + 3, value >>> 24)
  }

  readBytes(address, length) {
    return Uint8Array.from({ length }, (_, index) => this.read8(address + index))
  }

  writeBytes(address, bytes) {
    bytes.forEach((byte, index) => this.write8(address + index, byte))
  }

  readString(address, limit = 1024 * 1024) {
    const bytes = []
    for (let index = 0; index < limit; index += 1) {
      const byte = this.read8(address + index)
      if (byte === 0) break
      bytes.push(byte)
    }
    return new TextDecoder().decode(Uint8Array.from(bytes))
  }

  clearDirty() {
    this.dirty.clear()
  }
}

export const u32 = (value) => value >>> 0
export const hex = (value, width = 8) => `0x${(value >>> 0).toString(16).padStart(width, '0')}`

export function parseNumber(text) {
  const value = String(text).trim().replaceAll('_', '')
  if (/^[+-]?0x[\da-f]+$/i.test(value)) {
    const negative = value.startsWith('-')
    const digits = value.replace(/^[+-]?0x/i, '')
    return (negative ? -1 : 1) * Number.parseInt(digits, 16)
  }
  if (/^[+-]?0b[01]+$/i.test(value)) {
    const negative = value.startsWith('-')
    const digits = value.replace(/^[+-]?0b/i, '')
    return (negative ? -1 : 1) * Number.parseInt(digits, 2)
  }
  if (/^[+-]?\d+$/.test(value)) return Number.parseInt(value, 10)
  throw new Error(`无法识别数值：${text}`)
}
