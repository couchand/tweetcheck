# substitute a single letter for english words

_ = require 'underscore'

wordcover = require './wordcover'

add = (a, b) -> a + b
module.exports = substitute = (input) ->

  covers = wordcover input

  # bail out if there are no words
  return input if covers.length is 0

  ranked = _.sortBy covers, (cover) ->

    lengths = _.map cover, (c) -> c.length
    totalchars = _.reduce lengths, add, 0
    words = cover.length

    me = totalchars * input.length - words

    me

  bestcover = ranked[-1..][0]

  replaced = input

  for word in bestcover
    replaced = replaced.replace word, 'a'

  replaced
