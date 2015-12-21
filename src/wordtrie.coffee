# a trie of english words

trie = require 'trie'
words = require 'an-array-of-english-words'

wordtrie = new trie.Trie()

for word in words
  wordtrie.addWord word

module.exports = wordtrie
