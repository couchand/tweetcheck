# improve a password

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'
whichtypes = require './whichtypes'
score = require './score'
replace = require './replace'

# the kernel: improve a bit
kernel = (input) ->

  typesused = whichtypes input
  unused = _.difference chartypes.ALL, typesused

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
