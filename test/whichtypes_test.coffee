chai = require './setup'

_ = require 'underscore'

chartypes = require '../src/chartypes'
whichtypes = require '../src/whichtypes'

describe "whichtypes", ->

  describe "with no characters at all", ->
    it "returns empty set", ->
      actual = whichtypes ''
      actual.should.have.length 0

  describe "with a single type in the string", ->
    testSomething = (input, type) ->
      it "returns it", ->
        actual = whichtypes input
        actual.should.have.length 1
        actual.should.contain type

    testSomething 'password', chartypes.LETTER
    testSomething '123', chartypes.NUMBER
    testSomething ' \t\n\r', chartypes.WHITESPACE
    testSomething './*&$', chartypes.OTHER

  describe "with some types", ->
    testTwo = (input, types) ->
      it "returns them", ->
        actual = whichtypes input
        actual.should.have.length types.length

        intersection = _.intersection actual, types
        intersection.should.have.length types.length

    testTwo '1password2', [chartypes.LETTER, chartypes.NUMBER]
    testTwo '3.14159265', [chartypes.NUMBER, chartypes.OTHER]
    testTwo 'peace dude', [chartypes.LETTER, chartypes.WHITESPACE]

  describe "with all four types", ->
    it 'returns four', ->
      actual = whichtypes '42 bananas!'
      actual.should.have.length 4
