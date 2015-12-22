# improve a password

_ = require 'underscore'

chartypes = require './chartypes'
classify = require './classify'
whichtypes = require './whichtypes'
replace = require './replace'

module.exports = improve = (input) ->

  # password with all four character types still needs to be more than 12 characters long
  if input.length <= 12
    return input + "! 1abcdefghij"[0..13-input.length]

  typesused = whichtypes input
  unused = _.difference chartypes.ALL, typesused

  typesseen = []
  for i in [0...input.length]
    ch = input[i]
    ty = classify ch

    if ty is chartypes.LETTER and _.contains typesseen, ty
      nextty = if unused.length
        unused.pop()
      else
        chartypes.NUMBER

      prefix = input[...i]
      replacement = replace input[i], nextty
      suffix = input[i+1..]

      return "#{prefix}#{replacement}#{suffix}"

    typesseen.push ty
