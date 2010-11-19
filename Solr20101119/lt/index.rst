Solrの重複uniqueKeyの扱い
--------------------------------
* 単一のshard
* 複数のshard
* 出入口
* いろいろ

.. raw:: pdf

    PageBreak
    
単一のshard
============================================================

uniqueKeyの重複はない


.. raw:: pdf

    PageBreak

複数のshard
============================================================

`DistributedSearch - Solr Wiki <http://wiki.apache.org/solr/DistributedSearch>`_

* Distributed Searching Limitations

  * The unique key field must be unique across all shards.


.. raw:: pdf

    PageBreak


複数のshard: 実際の処理
============================================================

src/java/org/apache/solr/handler/component/

QueryComponent.java で処理されている


.. raw:: pdf

    Spacer 0,50


* uniqueKeyの重複を検出したら結果に含めない

  * 一番最初に処理されたものが結果に入る それ以外は結果に含まれない

.. raw:: pdf

    PageBreak

拡張
============================================================

* shardの名前の大小で優先順位を付ける
* timestampのようなフィールドで優先順位をつける


.. raw:: pdf

    Spacer 0,50


* 作ってみた

  * https://github.com/haruyama/solr/

    *  duplicate_unique_key
 
  * 実装はちょー適当
  * Apache Licence 2.0


