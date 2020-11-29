let s:fontsize = 11

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" aleをOmnisharpに限定
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

" コメントアウトに使う記号
autocmd FileType cs setlocal commentstring=//\ %s

" 画面端まで行っても改行しない
set nowrap

" tabはspace 4つ
set tabstop=4
set shiftwidth=4

" clipboardを連携
set clipboard=unnamed,unnamedplus

set scrolloff=5

" deinのアンインストール時にはこれを使う
" let g:dein#auto_recache = 1

" 行番号を表示
set number

" ctagsのツリー表示
nmap <F8> :TagbarToggle<CR>

" fzf
nnoremap <leader>fo :Files<CR>

" コード補完をタブで選択可能にする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" CheatSheetの設定
let g:cheatsheet#cheat_file = '~/.config/nvim/cheatsheet.md'
let g:cheatsheet#float_window = 1

" OmniSharpの設定
autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

autocmd FileType cs nnoremap <leader>x  :OmniSharpGetCodeActions<cr>
autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
autocmd FileType cs nnoremap <leader>d  :OmniSharpDocumentation<cr>

autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

autocmd FileType cs nnoremap <leader>rn :OmniSharpRename<cr>
autocmd FileType cs nnoremap <leader>cf :OmniSharpCodeFormat<cr>
autocmd FileType cs nnoremap <leader>rl :OmniSharpReloadSolution<cr>
autocmd FileType cs nnoremap <leader>rs :OmniSharpRestartServer<cr>

" ctagsの設定----------------------------------------------------------------------
" ctagsのファイルは.tagsというファイル名
set tags=.tags;~

" ctagsを自動で更新するための関数
function! s:execute_ctags() abort
  " 探すタグファイル名
  let tag_name = '.tags'
  " ディレクトリを遡り、タグファイルを探し、パス取得
  let tags_path = findfile(tag_name, '.;')
  " タグファイルパスが見つからなかった場合
  if tags_path ==# ''
    return
  endif

  " タグファイルのディレクトリパスを取得
  " `:p:h`の部分は、:h filename-modifiersで確認
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  " 見つかったタグファイルのディレクトリに移動して、ctagsをバックグラウンド実行（エラー出力破棄）
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

" ctagsを自動で更新
augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END
" ----------------------------------------------------------------------------------

" deinの設定------------------------------------------------------------------------
if &compatible
  set nocompatible
endif
" dein.vimインストール時に指定したディレクトリをセット
let s:dein_dir = expand('~/.cache/dein')
" dein.vimの実体があるディレクトリをセット
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vimが存在していない場合はgithubからclone
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " dein.toml, dein_layz.tomlファイルのディレクトリをセット
  let s:toml_dir = expand('~/.config/nvim')
  " 起動時に読み込むプラグイン群
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " 遅延読み込みしたいプラグイン群
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" -------------------------------------------------------------------------------------
