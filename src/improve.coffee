# improve a password

_ = require 'underscore'
words = require 'an-array-of-english-words'

chartypes = require './chartypes'
classify = require './classify'
whichtypes = require './whichtypes'
replace = require './replace'
substitute = require './substitute'

substitution = (unused=[]) -> (word) ->
  newchars = for i in [1...word.length]

    ch = word[i]

    nextty = if unused.length
      unused.pop()
    else
      chartypes.NUMBER

    replace ch, nextty

  word[0] + newchars.join ''

randomLeetWord = ->
  words[Math.floor Math.random() * words.length]

module.exports = improve = (input) ->

  typesused = whichtypes input
  unused = _.difference chartypes.ALL, typesused

  # password with all four character types still needs to be more than 12 characters long
  if input.length <= 12
    word = randomLeetWord()
    return input + ' ' + substitution(_.difference unused, [chartypes.WHITESPACE])(word)

  substitute input, substitution unused
