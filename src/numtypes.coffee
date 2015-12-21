# get the number of character types in the string

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'

module.exports = numtypes = (input) ->

  typesfound = []
  typesleft = chartypes
  inputleft = input

  while inputleft.length isnt 0 and typesleft.length isnt 0

    nextchar = inputleft[0]
    nexttype = classify nextchar

    if _.contains typesleft, nexttype
      typesfound = typesfound.concat [nexttype]
      typesleft = _.reject typesleft, (t) -> t is nexttype

    inputleft = inputleft[1..]

  typesfound.length
