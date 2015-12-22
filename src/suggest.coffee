# suggest a better password

score = require './score'
improve = require './improve'

module.exports = suggest = (input) ->

  current = input

  while 50 > score current
    current = improve current

  current
