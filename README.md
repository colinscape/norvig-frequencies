# norvig-frequencies

A list of 97565 words ordered by their decreasing frequency
as described by Peter Norvig in his blog post
[English Letter Frequency Counts: Mayzner Revisited](http://norvig.com/mayzner.html).

To install:

<pre>
  $ npm install norvig-frequencies
</pre>

And to use:

<pre>
  words = require 'norvig-frequencies'

  console.log 'The 10 most common English words are:'
  console.log word for word in words.slice 0, 10
</pre>

