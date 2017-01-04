
set nocompatible               " be iMproved
" Plugins
" https://github.com/junegunn/vim-plug
" Download: curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')
" The following are examples of different formats supported.

" Language Support
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Expand Editor
Plug 'Lokaltog/vim-easymotion'
Plug 'repeat.vim'
Plug 'surround.vim'
Plug 'Raimondi/delimitMate' "automatic close parens, brackets...
Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
"Plug 'kana/vim-textobj-entire'
Plug 'terryma/vim-expand-region'

" UI (Colorscheme and so on)
"Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-signify'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'w0ng/vim-hybrid'

" Framework
Plug 'UltiSnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'Mizuchi/vim-ranger'
Plug 'octol/vim-cpp-enhanced-highlight'

" Background executed
Plug 'vim-scripts/IndentConsistencyCop'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'junegunn/vim-peekaboo' "Show registers for paste text
Plug 'gtags.vim'

" Executed Plugin
Plug 'ntpeters/vim-better-whitespace'
Plug 't9md/vim-quickhl'
Plug 'junegunn/limelight.vim' "Focus for writer
Plug 'junegunn/vim-easy-align'

call plug#end()

if !has('nvim')
  set shell=/bin/bash
endif

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
    set gfn=Source\ Code\ Pro\ 11
  else
    set gfn=consolas\ 11
  endif
endif

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme PaperColor
colorscheme hybrid
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
    set numberwidth=10
    set foldcolumn=8
    set noruler
    set nonumber
    Limelight
  else
    set numberwidth=4
    set foldcolumn=1
    set ruler
    set number
    Limelight!
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
  autocmd BufWinEnter *.py set colorcolumn=80
  autocmd BufWinEnter *.c set colorcolumn=80
  autocmd BufWinEnter *.h set colorcolumn=80
else
  autocmd BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
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

" 탭 크기 설정
set tabstop=8
set shiftwidth=8
set softtabstop=0

" 탭 -> 공백 변환 기능 (사용 안함)
" set noexpandtab

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
        set clipboard+=unnamed
        set clipboard+=unnamedplus
endif
if !has('nvim')
  if !has("gui_running")
    set clipboard+=exclude:.*
  endif
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
"autocmd BufWritePre * if &modifiable | %s/\s\+$//e | endif
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

" /를 입력하여 검색을 시작할 때 자동으로 영문상태로 만들어준다
"set iminsert=1
"set imsearch=0

set comments=sl:/*,mb:\ *,elx:*/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
  if !has('nvim')
  set ttymouse=xterm

  function! ShowMouseMode()
    if (&mouse == 'a')
      echo "mouse-vim"
    else
      echo "mouse-xterm"
    endif
  endfunction
endif
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
function! s:P4_add_current( )
  execute "!p4 add " . expand("%")
endfunc
function! s:P4_change( )
  execute "!p4 change"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMD alias
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quitall<bang>
command! SpaceIndent set ts=4 sw=4 sws=4 expandtab
command! EP4 call <SID>P4_edit_current()
command! RP4 call <SID>P4_revert_current()
command! XP4 call <SID>P4_add_current()
command! NP4 call <SID>P4_change()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetCscope()
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
  if filereadable("GPATH")
    let l:root_dir = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  else
    let l:root_dir = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  endif
  let l:cur = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  if isdirectory(l:root_dir)
    execute "cd " . l:root_dir
    if filereadable("GPATH")
      nnoremap <C-\>^] :GtagsCursor<CR>
      nnoremap <F7> :Ngtags<CR>
      nnoremap <M-h> :Gtags -gi<space>
      nnoremap <silent><M-n> :cn<CR>
      nnoremap <silent><M-m> :cp<CR>
    endif
    execute "cd " . l:cur
  endif
endfunction
autocmd BufReadPost * :call GtagsCommnad()
"---------------------------------------------------------------------
" gtags-cscope.vim
"---------------------------------------------------------------------
let GtagsCscope_Auto_Load = 1
"let GtagsCscope_Auto_Map = 1
let GtagsCscope_Keep_Alive = 1
let GtagsCscope_Quiet = 1
"---------------------------------------------------------------------
" FZF
"---------------------------------------------------------------------
let g:fzf_layout = { 'window': '-tabnew' }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

noremap <silent> <M-o> :FZF<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

command! Recent call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})


function! s:gtags_sink(line)
  echom a:line
  execute "cs find g " . substitute(a:line, '\n', '', '')
endfunction

function! s:tags()
  if filereadable("GPATH")
    let l:root_dir = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  else
    let l:root_dir = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  endif
  let l:cur = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  if isdirectory(l:root_dir)
    execute "cd " . l:root_dir
    if !filereadable("GPATH")
      echohl WarningMsg
      echom 'Preparing tags'
      echohl None
      call system('gtags')
    endif
    execute "cd " . l:cur
    call fzf#run({
    \ 'source':  'global -c',
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '30%',
    \ 'sink':    function('s:gtags_sink')})
  endif
endfunction

command! Ngtags call s:tags()

function! s:rgtags_sink(line)
  echom a:line
  let parts = split(a:line)
  let excmd = matchstr(parts[1], '^[0-9]*\ze')
  execute 'silent e' parts[2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:rtags(find)
  if filereadable("GPATH")
    let l:root_dir = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  else
    let l:root_dir = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  endif
  let l:cur = substitute(system("pwd 2>/dev/null"), '\n', '', '')
  if isdirectory(l:root_dir)
    execute "cd " . l:root_dir
    if !filereadable("GPATH")
      echohl WarningMsg
      echom 'Preparing tags'
      echohl None
      call system('gtags')
    endif
    execute "cd " . l:cur
    call fzf#run({
    \ 'source':  'global -rx ' . a:find,
    \ 'options': '+m -d "\s" --with-nth 3..',
    \ 'down':    '30%',
    \ 'sink':    function('s:rgtags_sink')})
  endif
endfunction

command! Rgtags call s:rtags(expand('<cword>'))

function! s:search_sink(line)
  echom a:line
  let parts = split(a:line, ':')
  let excmd = matchstr(parts[1], '^[0-9]*\ze')
  execute 'silent e' parts[0]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:search_project(find)
  let l:root_dir = substitute(system("git rev-parse --show-toplevel 2>/dev/null"), '\n', '', '')
  if isdirectory(l:root_dir)
    execute "cd " . l:root_dir
  else
    let l:cur = substitute(system("pwd 2>/dev/null"), '\n', '', '')
    execute "cd " . l:cur
  endif
  call fzf#run({
  \ 'source':  'ag --nogroup --column --color ' . a:find,
  \ 'options': '+m -d "\s" --ansi --with-nth 1..',
  \ 'window' : '-tabnew',
  \ 'sink':    function('s:search_sink')})
endfunction
command! SearchProject call s:search_project(expand('<cword>'))
noremap <C-\> :SearchProject<CR>
command! -bang -nargs=* S  call s:search_project(<q-args>)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})<Paste>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "aboveleft"
let g:tagbar_indent = 1

"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)
nmap <M-l> :TagbarToggle<CR>
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
map <silent><M-j> <Plug>(signify-next-hunk)
map <silent><M-k> <Plug>(signify-prev-hunk)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup rainbow
  autocmd!
  autocmd VimEnter & RainbowParentheses
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" expand-region
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :1,
      \ 'i''' :1,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :1,
      \ }
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
vnoremap q <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:cpp_class_scope_highlight = 1
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
inoremap <C-Q> <ESC>:q!<CR>
inoremap <C-S> <ESC>:w<CR>a
inoremap <C-_> :Rgtags<CR>
"inoremap <silent><C-K> <Esc>d$A
inoremap <silent><F3> <Esc>:set paste<CR>"*gp:set nopaste<CR>a
inoremap jk <Esc>
inoremap ㅓㅏ <ESC>

"map <silent><C-K> d$
"map <silent><C-U> d^
map q: :q
nmap <F2> "*yw
nmap <F3> "*p
nmap Y "*yw
vmap > >gv
vmap < <gv
nnoremap <C-L> :Recent<CR>
nnoremap <C-_> :Rgtags<CR>
nnoremap <F7> :Ngtags<CR>
nnoremap <silent> p p`]
nnoremap tt diw"*P
nnoremap ; :
noremap <C-F> <PageUp>
noremap <C-Q> <ESC>:q!<CR>
noremap <C-S> <ESC>:w<CR>
noremap <down> gj
noremap <silent><C-A> ^
noremap <silent><C-E> $
noremap <silent><F3> <ESC>:set paste<CR>"*gp:set nopaste<CR>
noremap <up> gk
noremap gV `[v`]
noremap j gjzz
noremap k gkzz
vmap <F2> "*y
vmap <F3> "*p
vmap Y "*y
vnoremap <silent> p p`]
vnoremap <silent> y y`]

nnoremap n nzz
nnoremap N Nzz

"if has("multi_byte")
"  set encoding=utf-8
"  setglobal fileencoding=utf-8
"  "setglobal bomb
"  set fileencodings=ucs-bom,utf-8,latin1
"endif

" 마지막 편집 위치 복원 기능
au BufReadPost *
      \ if line("'\"")>0 && line("'\"") <= line("$") |
      \ exe "norm g'\"" |
      \ endif

nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stat functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.cmm setfiletype trace

" vim: tabstop=2: softtabstop=2: shiftwidth=2: expandtab
