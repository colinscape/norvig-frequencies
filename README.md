# norvig-frequencies

A list of 97,565 words ordered by their decreasing frequency
as described by Peter Norvig in his blog post
[English Letter Frequency Counts: Mayzner Revisited](http://norvig.com/mayzner.html).

## Source

Original data
[published by Peter Norvig](http://norvig.com/google-books-common-words.txt).

## To install:

<pre>
  $ npm install norvig-frequencies
</pre>

## And to use (CoffeeScript):

<pre>
  words = require 'norvig-frequencies'

  console.log 'The 10 most common English words are:'
  console.log word for word in words.slice 0, 10
</pre>

Alternatively, in JavaScript:

<pre>
  words = require('norvig-frequencies')

  console.log('The 10 most common English words are:')
  for (var i=0; i &lt; 10; ++i) {
    console.log(words[i]);
  }
</pre>

