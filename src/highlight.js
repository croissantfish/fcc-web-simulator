function escapeHtml(text) {
  return text.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;')
}

export function highlightAssembly(line) {
  const tokenPattern = /("(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'|#.*$|\.[A-Za-z][\w.]*|\$?[A-Za-z_][\w.$]*|[+-]?(?:0x[\da-fA-F]+|\d+))/g
  let result = ''
  let cursor = 0
  let firstWord = true
  for (const match of line.matchAll(tokenPattern)) {
    result += escapeHtml(line.slice(cursor, match.index))
    const token = match[0]
    let className = 'token-symbol'
    if (token.startsWith('#')) className = 'token-comment'
    else if (token.startsWith('"') || token.startsWith("'")) className = 'token-string'
    else if (token.startsWith('.')) className = 'token-directive'
    else if (token.startsWith('$') || /^(?:x\d+|zero|ra|sp|gp|tp|fp|a[0-7]|s\d+|t\d+)$/.test(token)) className = 'token-register'
    else if (/^[+-]?(?:0x|\d)/.test(token)) className = 'token-number'
    else if (firstWord) className = 'token-opcode'
    result += `<span class="${className}">${escapeHtml(token)}</span>`
    cursor = match.index + token.length
    if (!/^[+-]?(?:0x|\d)/.test(token)) firstWord = false
  }
  result += escapeHtml(line.slice(cursor))
  return result || ' '
}
