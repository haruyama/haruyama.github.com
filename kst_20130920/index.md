% KST 20130920: Lucene's FST
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))

# FST

* Finite State Transducer
    * [Finite state transducer - Wikipedia, the free encyclopedia](http://en.wikipedia.org/wiki/Finite_state_transducer)

# Lucene's FST

* [org.apache.lucene.util.fst (Lucene 4.4.0 API)](http://lucene.apache.org/core/4_4_0/core/org/apache/lucene/util/fst/package-summary.html)

# Using FST in Lucene 

* [Lucene's FST Implementation - Lucene Revolution](http://www.lucenerevolution.org/sites/default/files/AutomatonInvasionLuceneRevolution2012_1.pdf)
* [Changing Bits: Using Finite State Transducers in Lucene](http://blog.mikemccandless.com/2010/12/using-finite-state-transducers-in.html)
* [Finite State Automata in Lucene](http://www.lucenerevolution.org/sites/default/files/Weiss%20Dawid%20-%20Finite%20State%20Automata%20in%20Lucene%281%29_0.pdf)

# Using FST in Lucene 

* Index (BlockTree Terms Distionary)
* Fuzzy Query
    * [Changing Bits: Lucene's FuzzyQuery is 100 times faster in 4.0](http://blog.mikemccandless.com/2011/03/lucenes-fuzzyquery-is-100-times-faster.html)']
    * [Fast string correction with Levenshtein automata](http://csi.ufs.ac.za/resres/files/Schultz.pdf)
* Spell Checker/Suggester
* Dictionary of kuromoji
    * lucene/analysis/kuromoji/src/java/org/apache/lucene/analysis/ja/dict/
* Synonym

# Using Lucene's FST in Java

* [Lucene 4.4 の FST を使って FSA を構築する | 関口宏司のLuceneブログ](http://lucene.jugem.jp/?eid=475)
* [FSTとGraphViz | 関口宏司のLuceneブログ](http://lucene.jugem.jp/?eid=465)

# Using Lucene's FST in Clojure

* [mixi-clojure-commons/src/mixi/lucene/fst.clj at v0.2.0](https://github.com/haruyama/mixi-clojure-commons/blob/v0.2.0/src/mixi/lucene/fst.clj)
* [mixi-clojure-commons/test/mixi/lucene/fst_test.clj at v0.2.0](https://github.com/haruyama/mixi-clojure-commons/blob/v0.2.0/test/mixi/lucene/fst_test.clj)
