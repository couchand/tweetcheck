chai = require './setup'

numtypes = require '../src/numtypes'

describe "numtypes", ->

  describe "with no characters at all", ->
    it "returns zero", ->
      actual = numtypes ''
      actual.should.equal 0

  describe "with a single type in the string", ->
    testSomething = (input) ->
      it "returns one", ->
        actual = numtypes input
        actual.should.equal 1

    testSomething 'password'
    testSomething '123'
    testSomething ' \t\n\r'
    testSomething './*&$'

  describe "with two types", ->
    testTwo = (input) ->
      it "returns two", ->
        actual = numtypes input
        actual.should.equal 2

    testTwo '1password2'
    testTwo '3.14159265'
    testTwo 'peace dude'

  describe "with all four types", ->
    it 'returns four', ->
      actual = numtypes '42 bananas!'
      actual.should.equal 4
