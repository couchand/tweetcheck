# replace a character with a similar one of another type

t = require './chartypes'
classify = require './classify'

replacements =
  a:
    NUMBER: '4'
    OTHER: '@'
  b:
    NUMBER: '6'
    OTHER: 'ß'
  c:
    NUMBER: '7'
    OTHER: '¢'
  d:
    NUMBER: '9'
    OTHER: 'Þ'
  e:
    NUMBER: '3'
    OTHER: '€'
  f:
    NUMBER: '5'
    OTHER: '/'
  g:
    NUMBER: '6'
    OTHER: '&'
  h:
    NUMBER: '4'
    OTHER: '?'
  i:
    NUMBER: '1'
    OTHER: '!'
  j:
    NUMBER: '1'
    OTHER: ';'
  k:
    NUMBER: '8'
    OTHER: '#'
  l:
    NUMBER: '1'
    OTHER: '£'
  m:
    NUMBER: '5'
    OTHER: '"'
  n:
    NUMBER: '4'
    OTHER: "'"
  o:
    NUMBER: '0'
    OTHER: '*'
  p:
    NUMBER: '2'
    OTHER: '%'
  q:
    NUMBER: '9'
    OTHER: '\\'
  r:
    NUMBER: '4'
    OTHER: '>'
  s:
    NUMBER: '5'
    OTHER: '$'
  t:
    NUMBER: '4'
    OTHER: '+'
  u:
    NUMBER: '0'
    OTHER: 'Ʊ'
  v:
    NUMBER: '7'
    OTHER: '^'
  w:
    NUMBER: '3'
    OTHER: '"'
  x:
    NUMBER: '8'
    OTHER: '*'
  y:
    NUMBER: '2'
    OTHER: '¥'
  z:
    NUMBER: '2'
    OTHER: '#'

  '1':
    LETTER: 'i'
    OTHER: '!'
  '2':
    LETTER: 'z'
    OTHER: '@'
  '3':
    LETTER: 'e'
    OTHER: '#'
  '4':
    LETTER: 'a'
    OTHER: '$'
  '5':
    LETTER: 's'
    OTHER: '%'
  '6':
    LETTER: 'b'
    OTHER: '^'
  '7':
    LETTER: 'v'
    OTHER: '&'
  '8':
    LETTER: 'm'
    OTHER: '*'
  '9':
    LETTER: 'q'
    OTHER: '('
  '0':
    LETTER: 'O'
    OTHER: ')'

defaults =
  LETTER: 'a'
  NUMBER: '1'
  WHITESPACE: ' '
  OTHER: '!'

typename = (type) ->
  switch type
    when t.LETTER then 'LETTER'
    when t.NUMBER then 'NUMBER'
    when t.OTHER then 'OTHER'
    else 'WHITESPACE'

module.exports = replace = (char, thattype) ->

  if thattype is t.WHITESPACE
    return defaults.WHITESPACE

  ch = char[0]

  thistype = classify ch
  thatname = typename thattype

  if thistype is t.WHITESPACE or thistype is t.OTHER
    return defaults[thatname]

  replacements[ch][thatname] or defaults[thatname]
