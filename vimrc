set nocompatible               " be iMproved
" Plugins
"https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plug on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'mhinz/vim-signify'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-easymotion'
"Plug 'bbchung/clighter'
Plug 'Valloric/YouCompleteMe'
"""""""""""""""""""""""""
Plug 't9md/vim-quickhl'
" (Optional) For quickhl move
Plug 'kana/vim-operator-user'
"""""""""""""""""""""""""
""" Markdown
"Plug 'godlygeek/tabular'
"Plug 'mmai/wikilink'
"Plug 'farseer90718/vim-taskwarrior'
Plug 'vim-pandoc'
"""""""""""""""""""""""""
Plug 'Align'
Plug 'mkitt/tabline.vim'
""" snipmate start
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'

" Optional:
"Plug 'honza/vim-snippets'
""" snipmate end
""" UltiSnips --START--
Plug 'UltiSnips'
" Optional:
Plug 'honza/vim-snippets'
""" UltiSnips --END--
Plug 'tommcdo/vim-exchange'
Plug 'repeat.vim'
Plug 'bufexplorer.zip'
Plug 'surround.vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/gitignore'
Plug 'yssl/VIntSearch'
"Plug 'delimitMate.vim'
" Gtags
Plug 'gtags.vim'
Plug 'chrisbra/vim-diff-enhanced'
"
" Detect Code Format
Plug 'ntpeters/vim-better-whitespace'
Plug 'kien/rainbow_parentheses.vim'
"Indentation
Plug 'IndentConsistencyCop'
" Plug 'tpope/vim-sleuth'
" Plug 'ciaranm/detectindent'
" Colors
Plug 'tomasr/molokai'
Plug 'blerins/flattown'
Plug 'itchyny/landscape.vim'
Plug 'junegunn/seoul256.vim'

Plug 'YankRing.vim'
Plug 'elzr/vim-json'
call plug#end()

set shell=/bin/bash

let mapleader = "\<Space>"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 보기 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

"에러 발생시에 소리대신 화면이 깜빡이도록함 (disable)
"set visualbell

" 커서의 위치를 항상 보이게 함.
set ruler

" 줄 번호 표시
set number

" 줄 번호 표시 너비 설정
set nuw=5

" 현재 커서 줄 강조
set cursorline

" 항상 status 라인을 표시하도록 함.
set laststatus=2

" Status Line 설정
set statusline=\ %F\ %m%r%h%y\ %w\%=\Line:\%8.(%l%)/%-8.(%L%)\ Colume\ %4.(%c%)%6.([%p%%]%)

if has("gui_running")
  set lines=150
  set co=171
  winp 580 4
endif

" 폰트 설정
if has("gui_running")
  if has("win32")
    set gfn=consolas:h11:cANSI
  elseif has("unix")
    set gfn=Ubuntu\ Mono\ 11
  else
    set gfn=consolas\ 11
  endif
endif

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jellybeans_background_color="000000"
let g:seoul256_background = 233
colorscheme seoul256
"if !has("gui_running")
"   let g:gruvbox_italic = 0
"endif
"let g:gruvbox_invert_signs = 1
"let g:gruvbox_sign_column = 'dark0'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Enable Word wrap
set wrap
set linebreak

" 특수문자(tab, line ending) 표시 안함
set nolist
" tab/End of line characters 설정
set listchars=tab:>-,eol:$

" 괄호의 짝을 Highlight

set showmatch
set matchtime=3

set showmode
set lazyredraw
set ttyfast
set scrolloff=4
set sidescrolloff=2
set cmdheight=1

set foldlevel=5
set foldcolumn=1
set numberwidth=6

" Focus Mode View
function! ToggleFocusMode()
  if (&foldcolumn != 8)
    set numberwidth=6
    set foldcolumn=8
    set noruler
  else
    set numberwidth=4
    set foldcolumn=0
    set ruler
    "execute 'colorscheme ' . g:colors_name
  endif
endfunc
function! FocusModeOff()
  set numberwidth=4
  set foldcolumn=2
  set ruler
endfunc

nnoremap <F1> :call ToggleFocusMode()<cr>

" For Folding
set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction

" c, h 파일인 경우 80 column 이상인 경우 표시
if exists('+colorcolumn')
  autocmd BufWinEnter *.c set colorcolumn=80
  autocmd BufWinEnter *.h set colorcolumn=80
else
  autocmd BufWinEnter *.c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  autocmd BufWinEnter *.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 명령어 기록을 남길 갯수 지정
set history=1000
"백스페이스 사용
set backspace=indent,eol,start

"백업파일을 만들지 않음
set nobackup
set nowritebackup
set noswapfile

" 완성중인 명령을 표시
set showcmd

" Disalbe tabstop, shiftwidth, noexpandtab
" Instead of these settings, use DetectIndent as autocmd *
" 탭 크기 설정
set tabstop=8
set shiftwidth=8
set softtabstop=0

" 탭 -> 공백 변환 기능 (사용 안함)
" set noexpandtab

" 자동 줄바꿈
set wrap

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
"if has("gui_running") || has("xterm_clipboard")
"        set clipboard+=unnamed
"        set clipboard+=unnamedplus
"endif
if !has("gui_running")
  set clipboard+=exclude:.*
endif

" magic 기능 사용 Allows pattern matching with special characters
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동 안함
set nostartofline

" 비주얼 모드에서의 동작 설정
set sel=inclusive

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
set km=startsel,stopsel

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set matchpairs+=<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 검색 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 검색어 강조 기능
set hlsearch

" 검색시 파일 끝에서 처음으로 되돌리기 안함
set nowrapscan

" 검색시 대소문자를 구별하지 않음
set ignorecase

" 괄호가 매치하는 위치를 보여주는 기능
set showmatch

" Increase Search
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 파일의 종류를 자동으로 인식
filetype plugin indent on

" 파일 형식에 따른 Syntax Highlighting 기능을 켠다
syntax enable
filetype on

if has("syntax")
  syntax on
endif

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
autocmd FileType javascript setlocal cindent
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 sts=4 expandtab
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType sh setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType c,cpp,java set mps+==:;
autocmd FileType mkd setlocal nosmartindent noautoindent
autocmd BufWritePre * if &modifiable | %s/\s\+$//e | endif
"autocmd BufReadPost * if &modifiable | %s/\n\{3,}/\r\r/e | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동 들여쓰기 사용
set autoindent
" C indent 사용
set cindent
"Smart indent 사용
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"새로운 buffer를 열기전에 이전 buffer를 반드시 저장하지않아도(hidden) 된다
set hidden

" Tab 자동 완성시 가능한 목록을 보여줌
set wildmenu

" File open등에서 자동완성 기능 사용시 bash와 유사하게 동작하도록 변경함
set wildmode=list:longest,full

" /를 입력하여 검색을 시작할 때 자동으로 영문사태로 만들어준다
"set iminsert=1
"set imsearch=0

set comments=sl:/*,mb:\ *,elx:*/

"unix format으로 변경하고,"trailing space 지우기
func! FUNC_dos2unix()
  %s/\s\+$//g
  %s///g
  set ff=unix
endfunc
nmap  <Leader>u :call FUNC_dos2unix()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 기타 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 매크로 실행중에 화면을 다시 그리지 않음
set lz

set mouse=a
set ttymouse=xterm

function! ShowMouseMode()
  if (&mouse == 'a')
    echo "mouse-vim"
  else
    echo "mouse-xterm"
  endif
endfunction

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자주 틀리는 글자 수정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ab fucntion function
ab calss class
ab functio function
ab dunction function
ab functuin function
ab dunction function
ab functuin function
ab functopn function
ab fumction function
ab vlass class
ab xlass class
ab classs class
ab forarch foreach
ab inser insert
ab insertt insert
ab quewrty query
ab ovject object
ab objectr object
ab evho echo
ab printr print_r
ab prit print
ab fales false
ab treu true
ab teur true
ab ture true
ab nulll null
ab nuii null
ab retrun return
ab retunr return
ab htis this
ab erturn return

function! s:P4_edit_current( )
  execute "!p4 edit " . expand("%")
endfunc
function! s:P4_revert_current( )
  execute "!p4 revert " . expand("%")
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMD alias
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quitall<bang>
command! PerforceEdit call <SID>P4_edit_current()
command! PerforceRevert call <SID>P4_revert_current()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function SetCscope()
  let curdir = getcwd()

  while !filereadable("cscope.out") && getcwd() != "/"
    cd ..
  endwhile

  if filereadable("cscope.out")
    execute "silent cs add " . getcwd() . "/cscope.out"
    "echo \"Load CSCOPE DONE\"
  endif

  execute "cd " . curdir
endfunction

"cscope file-searching alternative
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif
  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help
  call SetCscope()
endif

"---------------------------------------------------------------------
" GTAGS
"---------------------------------------------------------------------
function! GtagsCommnad()
  let l:root_dir = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  if isdirectory(l:root_dir)
    if filereadable("GPATH")
      execute "cd " . l:root_dir
      nnoremap <silent><Leader>j :GtagsCursor<CR>
      nnoremap <Leader>g :Gtags<space>
      nnoremap <Leader>i :Gtags -gi<space>
      nnoremap <Leader>n :cn<CR>
      nnoremap <Leader>p :cp<CR>
    endif
  endif
endfunction
autocmd BufReadPost * :call GtagsCommnad()
""---------------------------------------------------------------------
"" gtags-cscope.vim
""---------------------------------------------------------------------
"let GtagsCscope_Auto_Load = 1
"let GtagsCscope_Auto_Map = 1
"let GtagsCscope_Keep_Alive = 1
"let GtagsCscope_Quiet = 1
"---------------------------------------------------------------------
" Vimgrep
"---------------------------------------------------------------------
function! Find_current_file(word)
  execute "silent vimgrep " . a:word . " %"
  let l:count = len(getqflist())
  if l:count
    execute "copen"
    nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
    nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
    nnoremap <silent> <buffer> o  <CR>
    nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
    nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
    nnoremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

    exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . 'c' .'close<CR>'
    exe 'nnoremap <silent> <buffer> go <CR>:' . 'c' . 'open<CR>'
    exe 'nnoremap <silent> <buffer> q  :' . 'c' . 'close<CR>'

    echom "keys: q=quit <cr>/e/t/h/v=enter/edit/tab/split/vsplit go/T/H=preview versions of same"
  endif
endfunction
function! Open_QuickFixList()
  let l:count = len(getqflist())
  if l:count
    execute "copen"
    nnoremap <silent> <buffer> h  <C-W><CR><C-w>K
    nnoremap <silent> <buffer> H  <C-W><CR><C-w>K<C-w>b
    nnoremap <silent> <buffer> o  <CR>
    nnoremap <silent> <buffer> t  <C-w><CR><C-w>T
    nnoremap <silent> <buffer> T  <C-w><CR><C-w>TgT<C-W><C-W>
    nnoremap <silent> <buffer> v  <C-w><CR><C-w>H<C-W>b<C-W>J<C-W>t

    exe 'nnoremap <silent> <buffer> e <CR><C-w><C-w>:' . 'c' .'close<CR>'
    exe 'nnoremap <silent> <buffer> go <CR>:' . 'c' . 'open<CR>'
    exe 'nnoremap <silent> <buffer> q  :' . 'c' . 'close<CR>'

    echom "keys: q=quit <cr>/e/t/h/v=enter/edit/tab/split/vsplit go/T/H=preview versions of same"
  endif
endfunction
command! -nargs=* CSearch call Find_current_file(<q-args>)
noremap <F9> :call Find_current_file(expand('<cword>'))<CR>
noremap <F10> :call Open_QuickFixList()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:tagbar_left = 1
"let g:tagbar_show_linenumbers = 0
"let g:tagbar_autopreview = 1
"let g:tagbar_previewwin_pos = "aboveleft"
"let g:tagbar_indent = 1

"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)
"set <M-L> =l
"nmap <C-L> :call OpenTagbar()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-quickhl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>h <Plug>(quickhl-manual-this)
xmap <leader>h <Plug>(quickhl-manual-this)
nmap <leader>H <Plug>(quickhl-manual-reset)
xmap <leader>H <Plug>(quickhl-manual-reset)

nmap <leader>t <Plug>(quickhl-cword-toggle)
nmap <leader>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F11> <leader>be
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_initial_foldlevel=6
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4>hh :help my_git<CR>
nnoremap <silent> <F4> :Gstatus<CR>
nnoremap <silent> <F4>s :Gstatus<CR>
nnoremap <silent> <F4>b :Gblame<CR>
nnoremap <silent> <F4>c :Gcommit<CR>
nnoremap <silent> <F4>l :Git l %<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<,>'
" nmap s <Plug>(easymotion-s1)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader><leader> <Plug>(easymotion-bd-w)
nmap <Leader>b <Plug>(easymotion-b)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_overwrite = 1
let g:signify_update_on_focusgained = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <silent><C-9> <leader>cc
"map <silent><C-0> <Leader>ci
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DetectIndent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufReadPost * :DetectIndent
"let g:detectindent_preferred_indent = 8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd VimEnter * RainbowParenthesesToggleAll
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Repeat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-expand-region
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap <C-F> <Plug>delimitMateS-Tab
"imap <C-H> <Plug>delimitMateS-BS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader>] :call fzf#run({
      \   'source':      reverse(BufList()),
      \   'sink':        function('BufOpen'),
      \   'options':     '+m',
      \   'tmux_width': '20%'
      \ })<CR>
let g:fzf_tmux_height = '20%'
let g:fzf_tmux_width = '20%'
noremap <F12> <ESC>:FZF<CR>
nnoremap <silent><leader>o :FZF<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 그외 단축키 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cnoreab W w
cnoreab Wq wq
cnoreab q q!
cnoreab rmblank g/^$/d
cnoreab w!! w !sudo tee > /dev/null %

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-Q> <ESC>:q!<CR>

inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-L> <ESC>
inoremap <C-Q> <ESC>:q!<CR>
inoremap <C-S> <ESC>:w<CR>a
inoremap <silent><C-K> <Esc>d$A
inoremap <silent><F3> <Esc>:set paste<CR>"*gp:set nopaste<CR>a
inoremap jk <Esc>
inoremap ㅓㅏ <ESC>

map <silent><C-K> d$
map <silent><C-U> d^
map q: :q
nmap <F2> "*yw
nmap Y "*yw
nnoremap <C-L> V
nnoremap <silent> p p`]
nnoremap tt diw"*P
noremap <C-F> <PageUp>
noremap <C-Q> <ESC>:q!<CR>
noremap <C-S> <ESC>:w<CR>
noremap <down> gj
noremap <silent><C-A> ^
noremap <silent><C-E> $
noremap <silent><F3> <ESC>:set paste<CR>"*gp:set nopaste<CR>
noremap <up> gk
noremap gV `[v`]
noremap j gj
noremap k gk
vmap <F2> "*y
vmap Y "*y
vnoremap <C-L> <ESC>
vnoremap <silent> p p`]
vnoremap <silent> y y`]
vnoremap q <ESC>

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
" 마지막 편집 위치 복원 기능
au BufReadPost *
      \ if line("'\"")>0 && line("'\"") <= line("$") |
      \ exe "norm g'\"" |
      \ endif

nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" If you need current path in insert mode :
inoremap j% <C-R>=expand("%:p:h") . "/" <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stat functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call ToggleFocusMode()
" Example of how to use w:created in an autocmd to initialize a window-local option
"autocmd WinLeave * :call FocusModeOff()
"autocmd WinEnter * :call FocusModeOff()
