# classify characters

chartypes = require './chartypes'
whitespace = require './whitespace'

module.exports = classify = (char) ->

  ch = char[0]

  if ch >= 'A' and ch <= 'Z' or ch >= 'a' and ch <= 'z'
    chartypes.LETTER

  else if ch in whitespace
    chartypes.WHITESPACE

  else if ch >= '0' and ch <= '9'
    chartypes.NUMBER

  else
    chartypes.OTHER
