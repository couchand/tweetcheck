# score a password

substitute = require './substitute'
numtypes = require './numtypes'

module.exports = score = (input) ->

  shortened = substitute input

  shortlength = shortened.length
  shorttypes = numtypes shortened

  shortlength * shorttypes
