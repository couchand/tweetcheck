# improve a password

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'
bestcover = require './bestcover'
score = require './score'

# the kernel: improve a bit
kernel = (input) ->

  cover = bestcover input
  cover = _.filter cover, (c) -> c.length > 1

  if cover.length > 0
    original = cover[0]
    replacement = original[0] + '1'
    if original.length > 2
      replacement = replacement + original[2..]

    input.replace original, replacement

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
