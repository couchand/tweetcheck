chai = require './setup'

messages = require '../src/messages'
respond = require '../src/respond'

describe "respond", ->

  describe "a strong password", ->
    it "returns the strong password message", ->
      input = "4L0NG 4ND 5+R0NG"
      actual = respond input
      actual.should.equal messages.STRONG

  describe "with a weak password", ->
    testReplaced = (input) ->
      it "suggests a better password for '#{input}'", ->
        actual = respond input
        actual.should.contain messages.WEAK

    testReplaced 'p4ssw0rd'
    testReplaced '1p4ssw0rd2'

  describe "with an unacceptable password", ->
    testBad = (input) ->
      it "returns the unacceptable password message", ->
        actual = respond input
        actual.should.equal messages.UNACCEPTABLE

    testBad 'a' # TODO: should be 'password'
    testBad '1a2' # TODO: should be '1password2'
