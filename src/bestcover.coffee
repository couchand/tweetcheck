# find the best cover

_ = require 'underscore'

wordcover = require './wordcover'

add = (a, b) -> a + b

module.exports = bestcover = (input) ->

  covers = wordcover input

  # bail out if there are no words
  return [] if covers.length is 0

  ranked = _.sortBy covers, (cover) ->

    lengths = _.map cover, (c) -> c.length
    totalchars = _.reduce lengths, add, 0
    words = cover.length

    me = totalchars * input.length - words

    me

  ranked[-1..][0]
