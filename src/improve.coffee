# improve a password

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'
whichtypes = require './whichtypes'
replace = require './replace'
substitute = require './substitute'

module.exports = improve = (input) ->

  # password with all four character types still needs to be more than 12 characters long
  if input.length <= 12
    return input + "! 1abcdefghij"[0..13-input.length]

  typesused = whichtypes input
  unused = _.difference chartypes.ALL, typesused

  substitution = (word) ->
    newchars = for i in [1...word.length]

      ch = word[i]

      nextty = if unused.length
        unused.pop()
      else
        chartypes.NUMBER

      replace ch, nextty

    word[0] + newchars.join ''

  substitute input, substitution
