chai = require './setup'

substitute = require '../src/substitute'

describe "substitute", ->

  describe "with no words in string", ->
    testNothing = (input) ->
      it "does nothing to '#{input}'", ->
        actual = substitute input
        actual.should.equal input

    testNothing ''
    testNothing '123'
    testNothing '1a2'

  describe "with a word in the string", ->
    testSomething = (input, wordlength) ->
      it "replaces words in '#{input}'", ->
        expected = input.length - wordlength + 1 # one for the single-character replacement

        actual = substitute input
        actual.should.have.length expected

    testSomething 'password', 8
    testSomething '1password2', 8
