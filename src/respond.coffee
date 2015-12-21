# respond to a given password score

messages = require './messages'
cutoffs = require './cutoffs'

score = require './score'
suggest = require './suggest'

module.exports = respond = (password) ->

  result = score password

  if result >= cutoffs.STRONG
    messages.STRONG

  else if result < cutoffs.WEAK
    messages.UNACCEPTABLE

  else
    suggested = suggest password

    messages.WEAK + suggested
