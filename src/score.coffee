# score a password

_ = require 'underscore'

substitute = require './substitute'
numtypes = require './numtypes'

score = (input) ->

  shortened = substitute input

  shortlength = shortened.length
  shorttypes = numtypes shortened

  shortlength * shorttypes

module.exports = _.memoize score
