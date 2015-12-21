chai = require './setup'

suggest = require '../src/suggest'

describe "suggest", ->

  describe "a strong password", ->
    it "returns the provided password", ->
      input = "4L0NG 4ND 5+R0NG"
      actual = suggest input
      actual.should.equal input

  describe "with a weak password", ->
    testReplaced = (input) ->
      it "suggests a better password for '#{input}'"

    testReplaced 'password'
    testReplaced '1password2'
