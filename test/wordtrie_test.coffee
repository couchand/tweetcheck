chai = require './setup'

wordtrie = require '../src/wordtrie'

describe "wordtrie", ->

  describe "with non-words", ->
    testNo = (input) ->
      it "doesn't contain '#{input}'", ->
        actual = wordtrie.lookup input
        actual.should.be.false

    testNo '1234'
    testNo 'fhqwhgads'

  describe "with a word", ->
    testYes = (input, wordlength) ->
      it "contains the word '#{input}'", ->
        actual = wordtrie.lookup input
        actual.should.be.true

    testYes 'password'
    testYes 'thorny'

  describe "with a prefix", ->
    testPrefix = (input) ->
      it "doesn't contain '#{input}'", ->
        actual = wordtrie.lookup input
        actual.should.be.false

      it "has the prefix '#{input}'", ->
        actual = wordtrie.isValidPrefix input
        actual.should.be.true

    testPrefix 'passwo'
    testPrefix 'contai'
