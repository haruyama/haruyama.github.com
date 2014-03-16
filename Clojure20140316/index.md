% My Clojure Development Environment (Vol. 4)
% HARUYAMA Seigo([@haruyama](https://twitter.com/haruyama))

# lein + Vim

* [technomancy/leiningen](https://github.com/technomancy/leiningen)
    * version 2
* Vim

# lein

* [~/.lein/profiles.clj](https://github.com/haruyama/Settings/blob/91d9372293c491bf3a94b0997c94b171e82e1287/.lein/profiles.clj)

# jvm-opts

```
         :jvm-opts ["-XX:+TieredCompilation"
                    "-XX:TieredStopAtLevel=1"]
```

for speeding up boot time.

* [tnoda-clojure • JVM のオプション設定で Clojure の起動を 30% 高速化 → さらに高速化で起動時間半減へ](http://tnoda-clojure.tumblr.com/post/51495039433/jvm-clojure-30)

# Static Analysis

* [jonase/lein-kibit](https://github.com/jonase/lein-kibit)
* [jonase/eastwood](https://github.com/jonase/eastwood)
* [dakrone/lein-bikeshed](https://github.com/dakrone/lein-bikeshed)

# Vim plugins

* [tpope/vim-fireplace](https://github.com/tpope/vim-fireplace)
* [guns/vim-clojure-highlight](https://github.com/guns/vim-clojure-highlight)
* [guns/vim-clojure-static](https://github.com/guns/vim-clojure-static)

* [vim-scripts/paredit.vim](https://github.com/vim-scripts/paredit.vim)
* [amdt/vim-niji](https://github.com/amdt/vim-niji)

* [haruyama/vim-matchopen](https://github.com/haruyama/vim-matchopen)

# Vim setting

* [$HOME/.vim/after/ftplugin/clojure.vim](https://github.com/haruyama/Settings/blob/91d9372293c491bf3a94b0997c94b171e82e1287/.vim/after/ftplugin/clojure.vim)
* [$HOME/.vim/syntax_checkers/clojure/nrepl.vim](https://github.com/haruyama/Settings/blob/91d9372293c491bf3a94b0997c94b171e82e1287/.vim/syntax_checkers/clojure/nrepl.vim)
    * a syntax checker and test runnner using [scrooloose/syntastic](https://github.com/scrooloose/syntastic)

# Requirements for syntax check

* add org.clojure/tools.namespace to profiles.dev.dependencies.
    * [mixi-cj-lib/project.clj at master](https://github.com/haruyama/mixi-cj-lib/blob/master/project.clj)
* execute 'lein repl' in a project directory.

# Demo: syntax check and run test

# References

* [@haruyama の Clojure 開発環境](http://haruyama.github.com/Clojure20121021/haruyama.html)
* [@haruyama の Clojure 開発環境 その2](http://haruyama.github.com/Clojure20130317/haruyama2.html)
* [@haruyama の Clojure 開発環境 その3](http://haruyama.github.com/Clojure20130630/haruyama3.html)
