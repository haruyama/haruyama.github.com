% @haruyama の Clojure 開発環境
% 春山 征吾([@haruyama](https://twitter.com/haruyama))

# lein + Vim

* [technomancy/leiningen · GitHub](https://github.com/technomancy/leiningen)
* Vim

# lein

* lein 2.x と lein 1.x があるが, 2.x を利用.
* ~/.lein/profiles.clj

```clojure
{:user  {:plugins {
                   lein-difftest "1.3.8"
                   lein-pprint   "1.1.1"
                   lein-localrepo "0.4.0"
                   jonase/eastwood "0.0.2"
                   }
         :search-page-size 30
         ; :repl-options  {:prompt  (fn  [ns]  (str "your command, master? "))}
        }}
```

# 自動テスト

* lein-autotest は最近のleinでは動かない
* [jakemcc/lein-autoexpect · GitHub](https://github.com/jakemcc/lein-autoexpect) は動く
    * テストに [jaycfields/expectations · GitHub](https://github.com/jaycfields/expectations)  を利用
* inotifywait を利用する

```sh
while inotifywait -e CLOSE_WRITE **/*.clj || true; do lein test; done
```

# Vim 

* ~/.vim/after/ftplugin/clojure.vim

```vimscript
setl tabstop=2 expandtab shiftwidth=2 softtabstop=2 smarttab

call vimshell#set_dictionary_helper(g:vimshell_interactive_interpreter_commands, 'clojure', 'lein repl')

vmap <silent> ,s :VimShellSendString<CR>
vmap <silent> <CR> :VimShellSendStringAndMove<CR>

autocmd BufWritePre *.{clj,cljs}  call RTrim()

if exists('*PareditInitBuffer')
  call PareditInitBuffer()
  nnoremap <SID>(toggle-paredit) :<C-u>call PareditToggle()<CR>
  nmap <Leader>4 <SID>(toggle-paredit)
endif

setl includeexpr=substitute(substitute(v:fname,'/.*$','','g'),'\\.','/','g')
setl path+=src;/,test;/
setl suffixesadd=.clj,cljs

"if exists('g:loaded_jump2clj')
"  setl includeexpr=jump2clj#jump('gf')
"  noremap fg :call jump2clj#jump('vne')<ENTER>
"endif

nnoremap <buffer> <silent> ,r :call Ref('clojure')<Enter>
```

# Vim plugins

* [thinca/vim-ft-clojure · GitHub](https://github.com/thinca/vim-ft-clojure)
* [vim-scripts/paredit.vim · GitHub](https://github.com/vim-scripts/paredit.vim)
* [haruyama/jump2clj.vim · GitHub](https://github.com/haruyama/jump2clj.vim)
    * 作ったけど設定だけでほぼ代替できたのでたぶんもう使わない.
