% Small Improvements for Lucene/Solr Tokenizer
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))
% 第12回 Solr 勉強会 2013/10/09

# StandardTokenizer

StandardTokenizer discards some kinds of characters: Symbol, Punctuation, ...

SOLUTION: [haruyama/StandardPlusTokenizer · GitHub](https://github.com/haruyama/StandardPlusTokenizer)

This tokenizer tokenizes all characters but spaces.

* [Anuenue text_cjk_plus fieldType](https://github.com/haruyama/Anuenue/blob/9bc4e8853cb2e2bbbcfdd740efeefedb9d98cdf8/src/solr/collection1/conf/schema.xml#L101)

# kuromoji

kuromoji divides FULLWIDTH DIGIT series into separate character tokens.

SOLUTION: MappingCharFilterFactory

```xml
<charFilter class="solr.MappingCharFilterFactory" mapping="mapping-fullwidth-digit.txt" />
<tokenizer class="solr.JapaneseTokenizerFactory" mode="search"/>
```

* [Anuenue text_ja fieldType](https://github.com/haruyama/Anuenue/blob/9bc4e8853cb2e2bbbcfdd740efeefedb9d98cdf8/src/solr/collection1/conf/schema.xml#L40)
* [mapping-fullwidth-digit.txt](https://github.com/haruyama/Anuenue/blob/9bc4e8853cb2e2bbbcfdd740efeefedb9d98cdf8/src/solr/collection1/conf/mapping-fullwidth-digit.txt)

# lucene-gosen-ipadic

lucene-gosen-ipadic tokenizes HALFWIDTH characters into one unk, even if characters include punctuations.

SOLUTION: MappingCharFilterFactory or kuromoji

* [mapping-halfwidth-symbol.txt](https://github.com/haruyama/Anuenue/blob/9bc4e8853cb2e2bbbcfdd740efeefedb9d98cdf8/src/solr/collection1/conf/mapping-halfwidth-symbol.txt)
