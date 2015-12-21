chai = require './setup'

bestcover = require '../src/bestcover'

describe "bestcover", ->

  describe "with no words in string", ->
    testNothing = (input) ->
      it "returns empty list", ->
        actual = bestcover input
        actual.should.have.length 0

    testNothing ''
    testNothing '123'
    testNothing '1a2'

  describe "with a word in the string", ->
    testSomething = (input, expected) ->
      it "finds the best cover", ->
        actual = bestcover input
        actual.should.have.length expected.length

        for index of actual
          actual[index].should.equal expected[index]

    testSomething 'password', ['password']
    testSomething '1password2', ['password']
