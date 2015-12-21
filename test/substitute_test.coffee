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
      it "replaces words in '#{input}'"

    testSomething 'password', 8
    testSomething '1password2', 8
