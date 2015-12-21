# cover the input with words

wordtrie = require './wordtrie'

# kernel gets word covers given suffix covers
kernel = (input, suffixcovers) ->

  covers = []

  for nextlength in [1..input.length]
    prefix = input[...nextlength]
    suffix = input[nextlength..]

    # if the next prefix is a word
    if wordtrie.lookup prefix

      # if there are any suffix covers, prefix this word to them all
      if suffix of suffixcovers and suffixcovers[suffix].length
        for cover in suffixcovers[suffix]
          covers.push [prefix].concat cover

      # otherwise just add this word
      else
        covers.push [prefix]

    # otherwise just use suffix cover
    else

      # don't worry about being optimal here
      for cover in suffixcovers[suffix]
        covers.push cover

  # if it has no words at all use next suffix cover
  if covers.length is 0
    suffixcovers[input[1..]]
  else
    covers

# the husk
module.exports = wordcover = (input) ->

  # optimization: ignore single letter words
  return [] if input.length <= 1

  covers = '': []

  # prepare suffix covers
  for i in [input.length-1..1]
    suffix = input[i..]
    covers[suffix] = kernel suffix, covers

  # use suffixes to find original
  kernel input, covers
