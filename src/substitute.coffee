# substitute a single letter for english words

_ = require 'underscore'

bestcover = require './bestcover'

module.exports = substitute = (input) ->

  cover = bestcover input

  replaced = input

  for word in cover
    replaced = replaced.replace word, 'a'

  replaced
