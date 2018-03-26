" Preamble ---------------------------------------------------------------- {{{
if !has('win32')
  if !has('nvim')
    set shell=/bin/bash
  endif
endif

set nocompatible               " be iMproved
" }}}
" Plugins  ---------------------------------------------------------------- {{{
" https://github.com/junegunn/vim-plug
" Download: curl -fLo ~/.vim/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if has('win32')
  call plug#begin(expand('~').'/vimfiles/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
" The following are examples of different formats supported.

" Language Support
Plug 'tpope/vim-fugitive'
Plug 'nvie/vim-flake8'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Expand Editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'terryma/vim-expand-region'
Plug 'lucapette/vim-textobj-underscore'
Plug 'vim-scripts/Quich-Filter'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'tpope/vim-obsession'
Plug 'vim-scripts/YankRing.vim'

" UI (Colorscheme and so on)
"Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-signify'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'w0ng/vim-hybrid', { 'do': 'git am ~/.dotfiles/vim/patch/vim-hybrid/*.patch' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Framework
Plug 'honza/vim-snippets'
if !has('win32')
  Plug 'SirVer/ultisnips'
  Plug 'Valloric/YouCompleteMe', {'do': 'python install.py --clang-completer --system-libclang'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
  Plug 'Mizuchi/vim-ranger'
endif
Plug 'majutsushi/tagbar'

Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'svermeulen/vim-easyclip'

" Background executed
Plug 'vim-scripts/IndentConsistencyCop'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'junegunn/vim-peekaboo' "Show registers for paste text
Plug 'vim-scripts/gtags.vim'
Plug 'airblade/vim-gitgutter'

" Executed Plugin
Plug 'ntpeters/vim-better-whitespace'
Plug 't9md/vim-quickhl'
Plug 'junegunn/limelight.vim' "Focus for writer
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'

call plug#end()
" }}}
" Basic options ----------------------------------------------------------- {{{
let mapleader = "\<Space>"
set hidden "새로운 buffer를 열기전에 이전 buffer를 반드시 저장하지않아도(hidden) 된다
filetype plugin indent on " 파일의 종류를 자동으로 인식
syntax enable " 파일 형식에 따른 Syntax Highlighting 기능을 켠다
filetype on
set comments=sl:/*,mb:\ *,elx:*/
set showcmd " 완성중인 명령을 표시
set magic " magic 기능 사용 Allows pattern matching with special characters
" Wildmenu completion {{{

" Tab 자동 완성시 가능한 목록을 보여줌
set wildmenu
" File open등에서 자동완성 기능 사용시 bash와 유사하게 동작하도록 변경함
set wildmode=longest:list,full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" }}}
" Line Return {{{
" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}
" }}}
" Abbreviations ----------------------------------------------------------- {{{
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
ab unsinged unsigned
" }}}
" View -------------------------------------------------------------------- {{{
set novisualbell " 에러 발생시에 소리대신 화면 블링크(disable)
set ruler " 커서의 위치를 항상 보이게 함.
"set relativenumber "
set number " 줄 번호 표시
set nuw=5 " 줄 번호 표시 너비 설정
set cursorline " 현재 커서 줄 강조
set laststatus=2 " 항상 status 라인을 표시하도록 함.
" Status Line 설정
set statusline=\ %F\ %m%r%h%y\ %w\%=\Line:\%8.(%l%)/%-8.(%L%)\ Colume\ %4.(%c%)%6.([%p%%]%)

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

"Enable Word wrap
set wrap
set linebreak

" 특수문자(tab, line ending) 표시 안함
set nolist
" tab/End of line characters 설정
set listchars=tab:>-,trail:-

" 괄호의 짝을 Highlight
set showmatch
set matchtime=3

" Color scheme {{{
set t_Co=256
set background=dark
syntax on
colorscheme hybrid
" IF hybrid!!
highlight Search ctermbg=54 ctermfg=11 guifg=#1d1f21 guibg=#f0c674
" highlight LineNr ctermfg=143 guifg=#373b41
" }}}
set showmode
set lazyredraw
set ttyfast
set scrolloff=4
set sidescrolloff=2
set cmdheight=1

set numberwidth=6
set splitbelow
set splitright
" Folding ----------------------------------------------------------------- {{{
set foldlevel=5
set foldcolumn=1
set foldlevelstart=-1
" Space to toggle folds.
nnoremap , za
vnoremap , za

" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <leader>z mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fill_start_count = 7 - len(foldedlinecount)
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 7 - fill_start_count
  return line . " " . repeat("", fill_start_count) . foldedlinecount . ' lines ' . repeat("",fillcharcount) . ' '
endfunction " }}}
set foldtext=MyFoldText()
" Focus Mode View {{{
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
endfunc " }}}
nnoremap <F1> :call ToggleFocusMode()<cr>
" }}}
" Column Over ------------------------------------------------------------- {{{
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)
" }}}
" GUI --------------------------------------------------------------------- {{{
" 폰트 설정
if has("gui_running")
  if has("win32")
    set gfn=FantasqueSansMono\ Nerd\ Font:h11:cANSI
  elseif has("unix")
    set gfn=Source\ Code\ Pro\ 11
  else
    set gfn=consolas\ 11
  endif
elseif has("win32")
  hi CursorLine ctermbg=129
endif
" }}}
" }}}
" Filetype-specific ------------------------------------------------------- {{{
" Diff {{{

" This is from https://github.com/sgeb/vim-diff-fold/ without the extra
" settings crap.  Just the folding expr.

function! DiffFoldLevel()
  let l:line=getline(v:lnum)

  if l:line =~# '^\(diff\|Index\)'     " file
    return '>1'
  elseif l:line =~# '^\(@@\|\d\)'  " hunk
    return '>2'
  elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
    return '>2'
  elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
    return '>2'
  else
    return '='
  endif
endfunction

augroup ft_diff
  au!
  autocmd FileType diff setlocal foldmethod=expr
  autocmd FileType diff setlocal foldexpr=DiffFoldLevel()
augroup END

" }}}
" C {{{
let c_no_comment_fold=1
let c_no_if0_fold=0
let c_no_block_fold=1
function! CFold()
    if getline(v:lnum - 1) =~ '^}\\s*$'
        return '<1'
    elseif getline(v:lnum + 1) =~ '^{\\s*$'
        return '>1'
    elseif getline(v:lnum + 2) =~ '^{\\s*$'
        return '>1'
    elseif getline(v:lnum + 3) =~ '^{\\s*$'
        return '>1'
    endif
    return '='
endfunction

function! CFoldText()
    let line = getline(v:foldstart)
    let sub = substitute(line, '.*\<\(\w\+\)(.*).*', '\1(...)', 'g')
    return '+-- ' . sub . ' (' . (v:foldend - v:foldstart + 1) . ' lines)'
  endfunction
augroup ft_c
  au!
  au FileType c setlocal foldmethod=expr foldexpr=CFold() foldtext=CFoldText() fillchars-=fold:-
  au FileType c setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END

" }}}
" C++ {{{

augroup ft_cpp
  au!
  au FileType cpp setlocal foldmethod=marker foldmarker={,}
  au FileType cpp setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END

" }}}
" Vim {{{
augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker keywordprg=:help
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}
" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
autocmd FileType javascript setlocal cindent
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 sts=4 expandtab
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c,cpp,java set mps+==:;
autocmd FileType mkd setlocal nosmartindent noautoindent
autocmd BufRead,BufNewFile *.cmm setfiletype trace
" }}}
" Edit Preference --------------------------------------------------------- {{{
set history=1000 " 명령어 기록을 남길 갯수 지정
set undofile
set undoreload=10000
set backspace=indent,eol,start " 백스페이스 사용 제한사항 해제

" Backups {{{
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.tmp/vim/undo//     " undo files
set backupdir=~/.tmp/vim/backup// " backups
set directory=~/.tmp/vim/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
" }}}
" indent & tab size {{{
set autoindent " 자동 들여쓰기 사용
set cindent " C indent 사용
set smartindent " Smart indent 사용
" Tab size
set tabstop=8
set shiftwidth=8
set softtabstop=0
" disable tab to space
set noexpandtab
" }}}
set formatoptions=qrn1j
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
set nostartofline " 여러 가지 이동 동작시 줄의 시작으로 자동 이동 안함
set sel=inclusive " 비주얼 모드에서의 동작 설정

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
set km=startsel,stopsel
" }}}
" Search and Replace ------------------------------------------------------ {{{
set hlsearch " 검색어 강조 기능끔
set nowrapscan " 검색시 파일 끝에서 처음으로 되돌리기 안함
set ignorecase " 검색시 대소문자를 구별하지 않음
set showmatch " 괄호가 매치하는 위치를 보여주는 기능
set incsearch " Increase Search

" /를 입력하여 검색을 시작할 때 자동으로 영문상태로 만들어준다
set iminsert=1
set imsearch=0
set matchpairs+=<:> " 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
" }}}
" Mouse ------------------------------------------------------------------- {{{
set mouse=a
if !has('win32')
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
endif
" }}}
" Plugin Settings --------------------------------------------------------- {{{
" Perforce {{{
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
command! EP4 call <SID>P4_edit_current()
command! RP4 call <SID>P4_revert_current()
command! XP4 call <SID>P4_add_current()
command! NP4 call <SID>P4_change()
" }}}

" gtags-cscope.vim {{{
let GtagsCscope_Ignore_Case = 1
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 0
let GtagsCscope_Keep_Alive = 1
let GtagsCscope_Quiet = 1
set cscopetag
" }}}
" FZF {{{
" let g:fzf_layout = { 'window': '-tabnew' }
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

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

command! Recent call fzf#run({
      \  'source':  v:oldfiles,
      \  'sink':    'e',
      \  'options': '-m -x +s',
      \  'down':    '40%'})

function! s:GtagsCscope_GtagsRoot()
  let cmd = "global -pq"
  let cmd_output = system(cmd)
  if v:shell_error != 0
    if v:shell_error == 3
      call s:Error('GTAGS not found.')
    else
      call s:Error('global command failed. command line: ' . cmd)
    endif
    return ''
  endif
  return strpart(cmd_output, 0, strlen(cmd_output) - 1)
endfunction

function! s:gtags_sink(line)
  echom a:line
  execute "cs find g " . substitute(a:line, '\n', '', '')
endfunction

function! s:tags()
  let gtagsroot = s:GtagsCscope_GtagsRoot()
  if isdirectory(gtagsroot)
    call fzf#run({
          \ 'source':  'global -c',
          \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
          \ 'down':    '30%',
          \ 'sink':    function('s:gtags_sink')})
    " execute "cd " . l:cur
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
  let gtagsroot = s:GtagsCscope_GtagsRoot()
  if isdirectory(gtagsroot)
    call fzf#run({
          \ 'source':  'global -rx --color=always ' . a:find,
          \ 'options': '--ansi +m -d "\s" --with-nth 3.. --prompt "Reference> " --reverse --tabstop=1 ',
          \ 'down':    '30%',
          \ 'sink':    function('s:rgtags_sink')})
  endif
endfunction

command! Rgtags call s:rtags(expand('<cword>'))

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

function! s:wrap_fzf_grep(args, bang)
  let gtagsroot = s:GtagsCscope_GtagsRoot()
  if isdirectory(gtagsroot)
    let directory = gtagsroot
  else
    let directory = getcwd()
  endif
  let cmd = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --type-add "history:.search_history" --type-not history --color "always" '. shellescape(a:args)
  let result = split(system(cmd), '.\n')
  call writefile(result, directory . "/.search_history")
  call fzf#vim#grep('cat ' . directory . '/.search_history', 1, a:bang)
endfunction

function! s:show_search_history(filter, bang)
  let s:gtagsroot = s:GtagsCscope_GtagsRoot()
  if isdirectory(s:gtagsroot)
    let s:directory = s:gtagsroot
  else
    let s:directory = getcwd()
  endif
  if empty(a:filter)
    call fzf#vim#grep('cat ' . s:directory . '/.search_history', 1, a:bang)
  else
    call fzf#vim#grep('cat ' s:directory . '/.search_history | rg ' . a:filter, 1, a:bang)
  endif
endfunction

function! s:clear_history()
  let s:gtagsroot = s:GtagsCscope_GtagsRoot()
  if isdirectory(s:gtagsroot)
    let s:directory = s:gtagsroot
  else
    let s:directory = getcwd()
  endif
  echom "Clear All Search History"
  call delete(s:directory . "/.search_history")
endfunction

command! -bang -nargs=* SH call s:show_search_history(<q-args>, <bang>0)
command! -bang -nargs=* SearchHistory call s:show_search_history(<q-args>, <bang>0)
command! -bang -nargs=* CH call s:clear_history()
command! -bang -nargs=* ClearHistory call s:clear_history()

command! -bang -nargs=* SearchProject call s:wrap_fzf_grep(expand('<cword>'), <bang>0)
noremap <C-\> :SearchProject<CR>
command! -bang -nargs=* Find call s:wrap_fzf_grep(<q-args>, <bang>0)
command! -bang -nargs=* S  call s:wrap_fzf_grep(<q-args>, <bang>0)

command! -bang -nargs=* GGrep
      \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})<Paste>
" }}}
" Tagbar {{{
let g:tagbar_left = 1
let g:tagbar_show_linenumbers = 0
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "aboveleft"
let g:tagbar_indent = 1

"autocmd VimEnter * nested :call tagbar#autoopen(1)
"autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType * nested :call tagbar#autoopen(0)
nmap <M-l> :TagbarToggle<CR>
" }}}
" vim-quickhl {{{
nmap <leader>h <Plug>(quickhl-manual-this)
xmap <leader>h <Plug>(quickhl-manual-this)
nmap <leader>H <Plug>(quickhl-manual-reset)
xmap <leader>H <Plug>(quickhl-manual-reset)

nmap <leader>t <Plug>(quickhl-manual-toggle)
nmap <leader>] <Plug>(quickhl-tag-toggle)
" map H <Plug>(operator-quickhl-manual-this-motion)
"nnoremap <silent> * :call quickhl#manual#this('n')<CR>:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
"vnoremap <silent> * :call quickhl#manual#this('v')<CR>:let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>
" "}}}
" Fugitive {{{
nnoremap <silent> <F4>hh :help my_git<CR>
nnoremap <silent> <F4> :Gstatus<CR>
nnoremap <silent> <F4>s :Gstatus<CR>
nnoremap <silent> <F4>b :Gblame<CR>
nnoremap <silent> <F4>c :Gcommit<CR>
nnoremap <silent> <F4>l :Glog<CR>
" }}}
" easymotion {{{
let g:EasyMotion_leader_key = '<,>'
" nmap s <Plug>(easymotion-s1)
" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <Leader><leader> <Plug>(easymotion-bd-w)
nmap <Leader>b <Plug>(easymotion-b)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" }}}
" incsearch / incsearch-fuzzy {{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map <space>/ <Plug>(incsearch-easymotion-/)
map <space>? <Plug>(incsearch-easymotion-?)
map <space>g/ <Plug>(incsearch-easymotion-stay)
" }}}
" Signify {{{
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_overwrite = 1
let g:signify_update_on_focusgained = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 0
map <silent><M-j> <Plug>(signify-next-hunk)
map <silent><M-k> <Plug>(signify-prev-hunk)
" }}}
" Rainbow parentheses {{{
augroup rainbow
  autocmd!
  autocmd VimEnter & RainbowParentheses
augroup END
" }}}
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" }}}
" YCM {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', '(', '[', '&']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=0
let g:ycm_cache_omnifunc=0
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>', 'S-<TAB>']
" let g:ycm_key_invoke_completion = '<Enter>'
" }}}
" expand-region {{{
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
" }}}
" vim-cpp-enhanced-highlight {{{
" let g:cpp_class_scope_highlight = 1
" }}}
" Quich-Filter {{{
let g:filtering_object = {}
let g:filtering_keywords = []
let g:filtering_kernel_log_keywords = ['PC is at', 'S-Boot', 'CHIP_ID', 's5p_check_keypad', 'Kernel panic', 'Bad mode', 'Check LPI timeout status = 0x0020ffff', 'LPI timeout is occurred']

function! Kernel_search_string(search)
  if empty(g:filtering_object)
    let g:filtering_object = FilteringNew()
  else
    call g:filtering_object.destruct()
    let g:filtering_object = FilteringNew()
  endif

  for i in g:filtering_kernel_log_keywords
    call g:filtering_object.addToParameter('alt', i)
  endfor
  if empty(a:search)
    call g:filtering_object.addInputToParameter('alt', string(g:filtering_object.alt) . ' Append:')
  else
    call g:filtering_object.addToParameter('alt', a:search)
  endif
  let g:filtering_keywords = g:filtering_object.alt
  call g:filtering_object.run()
endfunction

function! Append_search_string(search)
  if empty(g:filtering_object)
    let g:filtering_object = FilteringNew()
  else
    call g:filtering_object.destruct()
    let g:filtering_object = FilteringNew()
  endif

  for i in g:filtering_keywords
    call g:filtering_object.addToParameter('alt', i)
  endfor
  if empty(a:search)
    call g:filtering_object.addInputToParameter('alt', string(g:filtering_object.alt) . ' Append:')
  else
    call g:filtering_object.addToParameter('alt', a:search)
  endif
  let g:filtering_keywords = g:filtering_object.alt
  call g:filtering_object.run()
endfunction
command! -bang -nargs=* F call Append_search_string(<q-args>)
command! -bang -nargs=* K call Kernel_search_string(<q-args>)

function! Clear_run_search()
  if empty(g:filtering_object)
    let g:filtering_object = FilteringNew()
  else
    call g:filtering_object.destruct()
    let g:filtering_object = FilteringNew()
  endif

  call g:filtering_object.addInputToParameter('alt', 'Search:')
  let g:filtering_keywords = g:filtering_object.alt
  call g:filtering_object.run()
endfunction

function! Clear_search()
  if !empty(g:filtering_object)
    call g:filtering_object.destruct()
  endif
endfunction
nnoremap <silent><M-f> :call Append_search_string()<CR>
nnoremap <silent><M-g> :call Clear_run_search()<CR>
nnoremap <silent><M-c> :call Clear_search()<CR>
" }}}
" AutoFormat {{{
let g:autoformat_verbosemode=0
nnoremap <C-M-L> :Autoformat<CR>
inoremap <C-M-L> :Autoformat<CR>
vnoremap <C-M-L> :Autoformat<CR>
" }}}
" Surround {{{
xmap s <plug>VSurround
" }}}
" Airline {{{
let g:airline_theme='cool'
let g:airline_extensions = ['branch', 'tabline', 'tagbar', 'obsession']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

if has('win32')
  let g:airline_left_sep = ""
  let g:airline_right_sep = ""
else
  let g:airline_left_sep = "\uE0B0"
  let g:airline_right_sep = "\uE0B2"
endif

" }}}
" NerdComment {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' },
      \ 'python': { 'left': '#', 'leftAlt': '# ' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

function! SavePos()
  let s:left_cur = getpos("'<")
  let s:right_cur = getpos("'>")
  let s:v_cur = getpos("v")
  let g:cur = s:v_cur
  "echom s:left_cur[1] . ":" . s:right_cur[1] . ":" . s:v_cur[1]
  if s:left_cur[1] == s:v_cur[1]
    let g:cur[1] = s:v_cur[1] - 1
  endif
  if s:right_cur[1] == s:v_cur[1]
    let g:cur[1] = s:v_cur[1] + 1
  endif
endfunc

function! MoveBelow()
  let s:cur = g:cur
  call setpos(".", s:cur)
endfunc

nmap <M-;> <plug>NERDCommenterToggle <bar> j
vmap <silent><M-;> :call SavePos()<CR>gv <Bar> <plug>NERDCommenterToggle <bar> :call MoveBelow()<CR>
" }}}
" Multiple-Cursors {{{
let g:EasyClipUseSubstituteDefaults = 1
" Map start key separately from next key
" let g:multi_cursor_start_key='<C-x>'
" }}}
" Auto-Pair {{{
let b:autopairs_enabled = 0
inoremap <buffer> <silent><S-TAB> <ESC>:call AutoPairsJump()<CR>a
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
" }}}
" MyToHtml {{{
function! MyToHtml(line1, line2)
  " make sure to generate in the correct format
  let old_css = 1
  if exists('g:html_use_css')
    let old_css = g:html_use_css
  endif
  let g:html_use_css = 0
  let old_number_lines = 1
  if exists('g:html_number_lines')
    let old_number_lines = g:html_number_lines
  endif
  let g:html_number_lines = 0

  " generate and delete unneeded lines
  exec a:line1.','.a:line2.'TOhtml'
  %g/<body/normal k$dgg

  " convert body to a table
  %s/<body\s*\(bgcolor="[^"]*"\)\s*text=\("[^"]*"\)\s*.*>/<table \1 cellPadding=0><tr><td><font color=\2>/
  %s#</body>\(.\|\n\)*</html>#\='</font></td></tr></table>'#i

  " restore old setting
  let g:html_use_css = old_css
  let g:html_number_lines = 0
endfunction
command! -range=% MyToHtml :call MyToHtml(<line1>,<line2>)
" }}}
" }}}
" Convenience mappings ---------------------------------------------------- {{{
command! -bang Q quitall<bang>
command! SpaceIndent set ts=4 sw=4 sws=4 expandtab

cnoreab W w
cnoreab Wq wq
cnoreab q q!
cnoreab rmblank g/^$/d
cnoreab <silent> w!! w !sudo tee > /dev/null %

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
" nnoremap <silent> p p`]
nnoremap t diw"*P
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
vmap <F2> "*y
vmap <F3> "*p
vmap Y "*yg
vnoremap <silent> p p`]
vnoremap <silent> y y`]

noremap j gjzz
noremap k gkzz
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz
nnoremap <c-]> <c-]>zz

" Source
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

" Insert Mode Completion {{{

inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>

" }}}
" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

inoremap <c-a> <home>
inoremap <c-e> <end>

nnoremap <M-,> `[
nnoremap <M-.> `]
nmap 1 <home>
nmap 0 <end>
nnoremap - <end>
" }}}
" vim: tabstop=2: softtabstop=2: shiftwidth=2: expandtab
