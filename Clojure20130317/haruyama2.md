% @haruyama の Clojure 開発環境 その2
% 春山 征吾([@haruyama](https://twitter.com/haruyama))

# 前回の資料

[@haruyama の Clojure 開発環境](http://haruyama.github.com/Clojure20121021/haruyama.html)

# lein + Vim

* [technomancy/leiningen · GitHub](https://github.com/technomancy/leiningen)
* Vim

# lein

* lein 2.x と lein 1.x があるが, 2.x を利用.
* ~/.lein/profiles.clj

```clojure
{:user  {:plugins [[lein-kibit "0.0.8"]
                   [lein-difftest "2.0.0"]
                   [lein-pprint   "1.1.1"]
                   [lein-localrepo "0.4.1"]
                   [jonase/eastwood "0.0.2"]]
         :search-page-size 30
         }}
```

# 静的解析

* kibit
* eastwood

# 自動テスト

```sh
while inotifywait -e CLOSE_WRITE **/*/ || true; do lein test; done
```

* でも起動が遅い...
* 後述の vim-fireplace + nREPL で.

# Vim 

* ~/.vim/after/ftplugin/clojure.vim
    * VimShellSendStringAndMove と Rtrim(), Ref() は別に定義しています.

```vimscript
setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 smarttab

call vimshell#set_dictionary_helper(g:vimshell_interactive_interpreter_commands, 'clojure', 'lein repl')

vnoremap <buffer> <silent> ,s :VimShellSendString<CR>
vnoremap <buffer> <silent> <CR> :VimShellSendStringAndMove<CR>

autocmd BufWritePre *.{clj,cljs}  call RTrim()

if exists('*PareditInitBuffer')
  call PareditInitBuffer()
  nnoremap <SID>(toggle-paredit) :<C-u>call PareditToggle()<CR>
  nmap <buffer> <Leader>4 <SID>(toggle-paredit)
endif

setl includeexpr=substitute(substitute(v:fname,'/.*$','',''),'\\.','/','g')
setl path+=src;/,test;/
setl suffixesadd=.clj,cljs

nnoremap <buffer> <silent> ,r :call Ref('clojure')<Enter>
```

# Vim plugins

* [thinca/vim-ft-clojure](https://github.com/thinca/vim-ft-clojure)
* [vim-scripts/paredit.vim](https://github.com/vim-scripts/paredit.vim)

* [tpope/vim-fireplace · GitHub](https://github.com/tpope/vim-fireplace)
    * デモ

* [liquidz/lein-vim](https://github.com/liquidz/lein-vim)
