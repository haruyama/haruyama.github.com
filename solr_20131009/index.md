% Small Improvements for Lucene/Solr Tokenizer
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))
% 第12回 Solr 勉強会 2013/10/09

# StandardTokenizer

StandardTokenizer discards some kinds of characters: Symbol, Punctuation, ...).

SOLUTION: [haruyama/StandardPlusTokenizer · GitHub](https://github.com/haruyama/StandardPlusTokenizer)

This tokenizer tokenizes all characters but spaces.

# kuromoji

kuromoji divides FULLWIDTH DIGIT series into separate character tokens.

SOLUTION: MappingCharFilterFactory

```xml
<charFilter class="solr.MappingCharFilterFactory" mapping="mapping-fullwidth-digit.txt" />
<tokenizer class="solr.JapaneseTokenizerFactory" mode="search"/>
```

# lucene-gosen

lucene-gosen tokenizes HALFWIDTH characters into one unk, even if characters includes a punctuation.

SOLUTION: MappingCharFilterFactory or kuromoji

