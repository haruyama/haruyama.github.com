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
                    "-XX:TieredStopAtLevel=1"
                    "-Xverify:none"]}}
```

# jvm-opts

```
         :jvm-opts ["-XX:+TieredCompilation"
                    "-XX:TieredStopAtLevel=1"
                    "-Xverify:none"]
```

for speeding up boot time.

* [tnoda-clojure • JVM のオプション設定で Clojure の起動を 30% 高速化 → さらに高速化で起動時間半減へ](http://tnoda-clojure.tumblr.com/post/51495039433/jvm-clojure-30)

# Static Analysis

* [jonase/kibit](https://github.com/jonase/kibit/)
* [jonase/eastwood](https://github.com/jonase/eastwood)

# Vim plugins

* [thinca/vim-ft-clojure](https://github.com/thinca/vim-ft-clojure)
* [tpope/vim-fireplace](https://github.com/tpope/vim-fireplace)

* [vim-scripts/paredit.vim](https://github.com/vim-scripts/paredit.vim)

* [liquidz/lein-vim](https://github.com/liquidz/lein-vim)

# Vim setting

* [$HOME/.vim/after/ftplugin/clojure.vim](https://gist.github.com/haruyama/5820163)
* [$HOME/.vim/syntax_checkers/clojure/nrepl.vim](https://gist.github.com/haruyama/5791152)
    * a syntax checker and test runnner using [scrooloose/syntastic](https://github.com/scrooloose/syntastic)

# Requirements for syntax check

* add org.clojure/tools.namespace to profiles.dev.dependencies.
    * [mixi-cj-lib/project.clj at master](https://github.com/haruyama/mixi-cj-lib/blob/master/project.clj)
* execute 'lein repl' in a project directory.

# Demo: syntax check and run test

# References

* [@haruyama の Clojure 開発環境](http://haruyama.github.com/Clojure20121021/haruyama.html)
* [@haruyama の Clojure 開発環境 その2](http://haruyama.github.com/Clojure20130317/haruyama2.html)

