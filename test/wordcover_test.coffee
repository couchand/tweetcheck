_ = require 'underscore'
chai = require './setup'

wordcover = require '../src/wordcover'

describe "wordcover", ->

  describe "with non-words", ->
    testNo = (input) ->
      it "returns the empty set", ->
        actuals = wordcover input
        actuals.should.have.length 0

    testNo '1234'
    testNo 'fhqwhgds'

  describe "with a word", ->
    testOne = (input, wordlength) ->
      it "returns just the one word", ->
        actuals = wordcover input
        actuals.should.have.length 1

    testOne 'apt'

  describe "with multiple words", ->
    testSeveral = (input, expected) ->
      it "returns several options", ->
        actuals = wordcover input
        actuals.should.have.length.at.least expected, "'#{input}' has #{expected} covers, found [#{actuals.join ', '}]"
        # we don't actually care if it's optimal here

    # [ net, wo ]
    # [ on, et, wo ]
    # [ on, wo ]
    # [ on, two ]
    # [ one, wo ]
    # [ one, two ]
    testSeveral 'onetwo', 6
