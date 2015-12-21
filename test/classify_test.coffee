chai = require './setup'

chartypes = require '../src/chartypes'
classify = require '../src/classify'

describe "classify", ->

  describe "letters", ->
    testLetter = (input) ->
      it "classifies '#{input}'", ->
        actual = classify input
        actual.should.equal chartypes.LETTER

    for c in ['a', 'b', 'y', 'z']
      testLetter c

    for c in ['A', 'B', 'Y', 'Z']
      testLetter c

  describe "numbers", ->
    testNumber = (input) ->
      it "classifies '#{input}'", ->
        actual = classify "#{input}"
        actual.should.equal chartypes.NUMBER

    for i in [0..9]
      testNumber i

  describe "whitespace", ->
    testWhitespace = (input, name) ->
      it "classifies #{name}", ->
        actual = classify input
        actual.should.equal chartypes.WHITESPACE

    testWhitespace ' ', 'space'
    testWhitespace '\t', 'tab'
    testWhitespace '\n', 'newline'
    testWhitespace '\r', 'carriage return'

  describe "symbols", ->
    testSymbol = (input) ->
      it "classifies '#{input}'", ->
        actual = classify input
        actual.should.equal chartypes.OTHER

    testSymbol '+'
    testSymbol '.'
    testSymbol '&'
    testSymbol '\\'
    testSymbol '\u263a'
