% mixi での Clojure の利用
% 春山 征吾([@haruyama](https://twitter.com/haruyama))

# 内容

* 春山の Clojure 史
* [haruyama/mixi-cj-lib](https://github.com/haruyama/mixi-cj-lib) の紹介

# 春山の Clojure 史 - Clojure 以前

2007年ごろより関数型言語に興味を持ち本を読む.

2008年, 当時所属していたECナビ(現 VOYAGE GROUP) で SICP読書会に参加.

現在もミクシィにて毎週月曜19時過ぎより SICP読書会を開催しています(現在4章).

# 春山の Clojure 史

* 2011/05 [Tokyo.clj#13 - [PARTAKE]](http://partake.in/events/7f78039f-5644-484d-af89-99251c06a7bf) に参加
    * 当時無職だったので積極的に勉強会に参加していた
    * Clojure は1夜づけで参加
* 2012/02 [haruyama/ime-sample](https://github.com/haruyama/ime-sample) を作成
    * [日本語入力を支える技術](https://gihyo.jp/book/2012/978-4-7741-4993-6) のコードを Clojure で
* 2012/03 ミクシィ内で利用する JVM 関係のコードを書く言語を以下のように定める
    * すでに全面的に Java で開発しているものは Java
    * 新規に開発するもので Java のクラスを継承したりするものは Scala
    * Java のクラスを利用するだけのものは Clojure
* 2012/04- 以下のプログラムを Clojure で作成
    * mixiボイスのバーストセンテンス抽出
    * [haruyama/tiny-sbm](https://github.com/haruyama/tiny-sbm): Solr の機能説明のための小さなソーシャルブックマーク
    * [haruyama/mixi-cj-lib](https://github.com/haruyama/mixi-cj-lib)

# mixi-cj-lib

いままで書いたコードのうち再利用できそうなものを抽出した小さなライブラリ

* mixi.io
* mixi.lucene.kuromoji
* mixi.solr.solrj

# なぜ mixi.io/slurp-file などがあるのか

* mixi.io/{slurp-file,spit-file} を用意.
    * clojure.core/{slurp,spit} と同機能
    * しかし clojure.java.io には, リソースリークの可能性がある
    * https://github.com/clojure/clojure/blob/master/src/clj/clojure/java/io.clj
    * Java でいう new ...Reader(new ...Stream) のようなコードがある. Stream のインスタンス生成に成功して Reader の生成に失敗すると Stream.close() が呼ばれずリソースリークの可能性.

