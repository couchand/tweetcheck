# substitute a single letter for english words

_ = require 'underscore'
words = require 'an-array-of-english-words'
words = _.sortBy words, (w) -> -w.length

module.exports = substitute = (input, substitution='a') ->

  replaced = input

  for word in words
    replaced = replaced.replace word, substitution

  replaced
