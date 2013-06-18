% My Clojure Development Environment (Vol. 3)
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))

# lein + Vim

* [technomancy/leiningen · GitHub](https://github.com/technomancy/leiningen)
    * version 2
* Vim

# lein

* ~/.lein/profiles.clj

```clojure
{:user  {:plugins [[lein-kibit "0.0.8"]
                   [lein-difftest "2.0.0"]
                   [lein-pprint   "1.1.1"]
                   [lein-localrepo "0.4.1"]
                   [lein-licenses "0.1.1"]
                   [jonase/eastwood "0.0.2"]
                   [lein-clojars "0.9.1"]]
         :search-page-size 30
         :jvm-opts ["-XX:+TieredCompilation"
                    "-XX:TieredStopAtLevel=1"]}}
```

# jvm-opts

for speeding up boot time.

* [tnoda-clojure • JVM のオプション設定で Clojure の起動を 30% 高速化 → さらに高速化で起動時間半減へ](http://tnoda-clojure.tumblr.com/post/51495039433/jvm-clojure-30)

# Static Analysis

* kibit
* eastwood

# Vim plugins

* [thinca/vim-ft-clojure](https://github.com/thinca/vim-ft-clojure)
* [vim-scripts/paredit.vim](https://github.com/vim-scripts/paredit.vim)
* [tpope/vim-fireplace · GitHub](https://github.com/tpope/vim-fireplace)

* [liquidz/lein-vim](https://github.com/liquidz/lein-vim)

# Vim setting

TODO

* $HOME/.vim/after/ftplugin/clojure.vim
* $HOME/.vim/bundle/syntastic/syntax_checkers/clojure/nrepl.vim

# Demo: syntax check and run test

# References.

* [@haruyama の Clojure 開発環境](http://haruyama.github.com/Clojure20121021/haruyama.html)
* [@haruyama の Clojure 開発環境 その2](http://haruyama.github.com/Clojure20130317/haruyama2.html)
