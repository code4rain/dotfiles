set nocompatible               " be iMproved
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'mhinz/vim-signify'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'ntpeters/vim-better-whitespace'
"Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'

"""""""""""""""""""""""""
Plugin 't9md/vim-quickhl'
" (Optional) For quickhl move
Plugin 'kana/vim-operator-user'
"""""""""""""""""""""""""

""" snipmate start
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Optional:
Plugin 'honza/vim-snippets'
""" snipmate end
Plugin 'bufexplorer.zip'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���� ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

"���� �߻��ÿ� �Ҹ���� ȭ���� �����̵����� (disable)
"set visualbell

" Ŀ���� ��ġ�� �׻� ���̰� ��.
set ruler

" �� ��ȣ ǥ��
set number

" �� ��ȣ ǥ�� �ʺ� ����
set nuw=5

" ���� Ŀ�� �� ����
set cursorline

" �׻� status ������ ǥ���ϵ��� ��.
set laststatus=2

" Status Line ����
set statusline=\ %f\ %m%r%h%y\ %w\%=\Line:\%8.(%l%)/%-8.(%L%)\ Colume\ %4.(%c%)%6.([%p%%]%)

if has("gui_running")
    set lines=150
    set co=171
    winp 580 4
endif

" ��Ʈ ����
if has("gui_running")
    if has("win32")
        set gfn=��������ڵ�:h10:cANSI
    elseif has("unix")
        set gfn=consolas\ 9
    else
        set gfn=consolas\ 11
    endif
endif

set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:jellybeans_background_color="000000"
" colorscheme jellybeans
"colorscheme gruvbox
colorscheme molokai
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

" Ư������(tab, line ending) ǥ�� ����
set nolist
" tab/End of line characters ����
set listchars=tab:>-,eol:$

" ��ȣ�� ¦�� Highlight
set showmatch

set foldlevel=3
set foldcolumn=2
set numberwidth=4

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

" c, h ������ ��� 80 column �̻��� ��� ǥ��
if exists('+colorcolumn')
        autocmd BufWinEnter *.c set colorcolumn=80
        autocmd BufWinEnter *.h set colorcolumn=80
else
        autocmd BufWinEnter *.c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        autocmd BufWinEnter *.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���� ��� ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ɾ� ����� ���� ���� ����
set history=1000
"�齺���̽� ���
set backspace=indent,eol,start

"��������� ������ ����
set nobackup

" �ϼ����� ����� ǥ��
set showcmd

" �� ũ�� ����
set tabstop=8
set shiftwidth=8
set softtabstop=0

" �� -> ���� ��ȯ ��� (��� ����)
set noexpandtab

" �ڵ� �ٹٲ�
set wrap

" gVim �� ������� ��� Ŭ�����带 unnamed �������ͷ� ����
" xterm_clipboard ����� ���� ������ ���� ����
"if has("gui_running") || has("xterm_clipboard")
"        set clipboard+=unnamed
"       set clipboard+=unnamedplus
"endif
if !has("gui_running")
	set clipboard+=exclude:.*
endif

" magic ��� ��� Allows pattern matching with special characters
set magic

" ���� ���� �̵� ���۽� ���� �������� �ڵ� �̵� ����
set nostartofline

" ���־� ��忡���� ���� ����
set sel=inclusive

" SHIFT Ű�� ���� ������ ����� ���� ���
" ���� ���¿��� Ctrl+F,B �� �̵��ϸ� ������ �����Ǿ� ������ ����
set km=startsel,stopsel

" ��ȣ¦ ã�� ��ɿ� ����� ��ȣ ������ ���Ѵ�.
set matchpairs+=<:>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �˻� ��� ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" �˻��� ���� ���
set hlsearch

" �˻��� ���� ������ ó������ �ǵ����� ����
set nowrapscan

" �˻��� ��ҹ��ڸ� �������� ����
set ignorecase

" ��ȣ�� ��ġ�ϴ� ��ġ�� �����ִ� ���
set showmatch

" Increase Search
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype ��� & Syntax Highlighting ���
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ������ ������ �ڵ����� �ν�
filetype plugin indent on

" ���� ���Ŀ� ���� Syntax Highlighting ����� �Ҵ�
syntax enable
filetype on

if has("syntax")
	syntax on
endif

" ����� indent ������ ��� C indent �� ����ϴ� ���
autocmd FileType javascript setlocal cindent
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 sts=4 expandtab
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType c,cpp,java set mps+==:;
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �ڵ� �鿩���� ���
set autoindent
" C indent ���
set cindent
"Smart indent ���
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ���� ���
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"���ο� buffer�� �������� ���� buffer�� �ݵ�� ���������ʾƵ�(hidden) �ȴ�
set hidden

" Tab �ڵ� �ϼ��� ������ ����� ������
set wildmenu

" /�� �Է��Ͽ� �˻��� ������ �� �ڵ����� �������·� ������ش�
"set iminsert=0
"set imsearch=0

set comments=sl:/*,mb:\ *,elx:*/

"unix format���� �����ϰ�,"trailing space �����
func! FUNC_dos2unix()
    %s/\s\+$//g
    %s/
//g
    set ff=unix
endfunc
nmap  <Leader>u :call FUNC_dos2unix()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��Ÿ ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ��ũ�� �����߿� ȭ���� �ٽ� �׸��� ����
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
" ���� Ʋ���� ���� ����
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMD alias
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quitall<bang>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-quickhl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F11> <leader>be

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
let g:EasyMotion_leader_key = '<Space>'
nmap s <Plug>(easymotion-s2)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_vcs_list = [ 'git', 'perforce' ]
let g:signify_sign_overwrite = 1
let g:signify_update_on_focusgained = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <silent><C-9> <leader>cc
"map <silent><C-0> <Leader>ci
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * RainbowParenthesesActivate 
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" �׿� ����Ű ����
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Tab ����/�ݱ�
map <silent><C-N> :tabnew<CR>
vnoremap q <ESC>

"Move Cusor like readline
noremap <silent><C-A> ^
noremap <silent><C-E> $
inoremap <C-A> <Home>
inoremap <C-E> <End>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
" Remove contents like readline
map <silent><C-K> d$
map <silent><C-U> d^
nmap Y "*yw
noremap <silent><C-P> :set paste<CR>"*p:set nopaste<CR>
inoremap <silent><C-K> <Esc>d$A
inoremap <silent><C-P> <Esc>:set paste<CR>"*p:set nopaste<CR>a
vmap Y "*y
noremap <silent><C-F> <PageUp>
"Remap for navigation
"inoremap <M-H> <Left>
"inoremap <M-L> <Right>
"inoremap <M-J> <Down>
"inoremap <M-K> <Up>
"Force close

"Below command should be map under 'stty -ixon' at terminal
noremap <C-Q> <ESC>:q!<CR>
noremap <C-S> <ESC>:wq<CR>


" S-j/k �� ���� ������ ���Ʒ��� move
nnoremap <S-Up> :m .-2<CR>==g
nnoremap <S-Down> :m .+1<CR>==g
" "vmap <S-k> [egv
" "vmap <S-j> ]egv
inoremap <S-Up> <Esc>:m .-2<CR>==gi
inoremap <S-Down> <Esc>:m .+1<CR>==gi
vnoremap <S-Up> <Esc>:m .-2<CR>==gv
vnoremap <S-Down> <ESC>:m .+1<CR>==gv
" Ctrl + [ / Ctrl + ] Ű�� indentation ����
nnoremap <C-t> <<
nnoremap <C-y> >>
vnoremap <C-t> <gv
vnoremap <C-y> >gv

" sudo ������ �̿��ؼ� ������ �����ϱ�
cnoreab w!! w !sudo tee > /dev/null %
cnoreab W w
cnoreab rmblank g/^$/d
cnoreab Wq wq
cnoreab q q!

" ccŰ�� currnet word�� �����ϱ�
nnoremap cc diw"*P
vnoremap cc "_dP

inoremap jk <Esc>
"cnoremap jj <Esc>
inoremap �ä� <ESC>


" ������ ���� ��ġ ���� ���
au BufReadPost *
\ if line("'\"")>0 && line("'\"") <= line("$") |
\ exe "norm g'\"" |
\ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stat functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call ToggleFocusMode()
" Example of how to use w:created in an autocmd to initialize a window-local option
"autocmd WinLeave * :call FocusModeOff()
"autocmd WinEnter * :call FocusModeOff()
