# improve a password

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'
whichtypes = require './whichtypes'
bestcover = require './bestcover'
score = require './score'
replace = require './replace'

# the kernel: improve a bit
kernel = (input) ->

  cover = bestcover input
  cover = _.filter cover, (c) -> c.length > 1

  typesused = whichtypes input
  unused = _.difference chartypes.ALL, typesused

  if cover.length > 0
    original = cover[0]

    subtype = if unused.length
      unused[0]
    else
      chartypes.NUMBER
    sub = replace original[1], subtype

    replacement = original[0] + sub
    if original.length > 2
      replacement = replacement + original[2..]

    return input.replace original, replacement

  if unused.length
    added = switch unused[0]
      when chartypes.LETTER then 'a'
      when chartypes.NUMBER then '1'
      when chartypes.WHITESPACE then ' '
      when chartypes.OTHER then '!'

    "#{input}#{added}"

  else
    lastchar = input[-1..][0]
    added = if chartypes.LETTER is classify lastchar
      '1'
    else
      'a'

    "#{input}#{added}"

# the husk: improve enough
module.exports = improve = (input) ->

  current = input

  while 50 > score current
    current = kernel current

  current
