chai = require './setup'

score = require '../src/score'

describe "score", ->

  describe "with no words in string", ->
    testSimple = (input, typecount) ->
      it "returns length times type count", ->
        actual = score input
        actual.should.equal input.length * typecount

    testSimple '', 0
    testSimple '123', 1
    testSimple '1a2', 2

  describe "with a word in the string", ->
    testReplaced = (input, typecount, wordlength) ->
      it "returns length times type count", ->
        actual = score input
        actual.should.equal (input.length - wordlength + 1) * typecount

    testReplaced 'password', 1, 8
    testReplaced '1password2', 2, 8
