# get the number of character types in the string

_ = require 'underscore'

whichtypes = require './whichtypes'

module.exports = numtypes = (input) ->

  typesfound = whichtypes input
  typesfound.length
