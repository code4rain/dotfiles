set nocompatible               " be iMproved

filetype off                   " required!
""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...
Bundle 'grep.vim'
Bundle 'taglist.vim'
Bundle 'EnhancedJumps'
Bundle 'snipMate'
Bundle 'SuperTab'
Bundle 'slack/vim-bufexplorer.git'
Bundle 'hallison/vim-markdown.git'
Bundle 'matthias-guenther/hammer.vim.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'petdance/ack.git'
" making Tables
Bundle 'Tabular'
" summarize
Bundle 'visSum.vim'
Bundle 'chrisbra/changesPlugin'
Bundle 'surround.vim'
Bundle 'git://github.com/glidenote/memolist.vim.git'
Bundle 'vim-pandoc'
Bundle 'ack.vim'
Bundle 'TableTab.vim'
Bundle 'table.vim'
Bundle 'Table-Helper'
Bundle 'git://github.com/suan/vim-instant-markdown.git'
Bundle 'http://github.com/davidoc/taskpaper.vim.git'
Bundle 'autocomp.vim'
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""""""""""""""""""""""""""""""""""""""""""""""""

" 명령어 기록을 남길 갯수 지정
set history=1000
"백스페이스 사용
set backspace=indent,eol,start
"에러 발생시에 소리대신 화면이 깜빡이도록함 (disable)
"set visualbell

"백업파일을 만들지 않음
set nobackup

" 홈 디렉토리가 존재할 때에만 사용할 수 있는 기능들
if exists("$HOME")
" 홈 디렉토리를 구한다.
" 특정 시스템에서는 홈 디렉토리 경로 끝에 / 또는 \ 문자가
" 붙어 있기 때문에, 그것들을 제거한다.
        let s:home_dir = $HOME
        let s:temp = strpart(s:home_dir,strlen(s:home_dir)-1,1)
        if s:temp == "/" || s:temp == "\\"
                let s:home_dir = strpart(s:home_dir,0,strlen(s:home_dir)-1)
        endif
endif

" 경로 설정
if has("win32")
    let s:dir_tmp = s:home_dir."/_vim/tmp"
    let s:dir_backup = s:home_dir."/_vim/backup"
else
    let s:dir_tmp = s:home_dir."/.vim/tmp"
    let s:dir_backup = s:home_dir."/.vim/backup"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편집 기능 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 커서의 위치를 항상 보이게 함.
set ruler

" 완성중인 명령을 표시
set sc

" 줄 번호 표시
set number
" 줄 번호 표시 너비 설정
set nuw=5

" 탭 크기 설정
set tabstop=8
set shiftwidth=8

autocmd Filetype python setlocal tabstop=4 shiftwidth=4 sts=4 expandtab

" 탭 -> 공백 변환 기능 (사용 안함)
"set expandtab
set noexpandtab
set softtabstop=0

" 자동 줄바꿈 안함
set nowrap

" gVim 을 사용중일 경우 클립보드를 unnamed 레지스터로 매핑
" xterm_clipboard 기능이 있을 때에도 매핑 가능
if has("gui_running") || has("xterm_clipboard")
        set cb=unnamed
endif

" magic 기능 사용 Allows pattern matching with special characters
set magic

" 여러 가지 이동 동작시 줄의 시작으로 자동 이동
set sol

" 비주얼 모드에서의 동작 설정
set sel=exclusive

" SHIFT 키로 선택 영역을 만드는 것을 허용
" 영역 상태에서 Ctrl+F,B 로 이동하면 영역이 해제되어 버려서 해제
set km=startsel,stopsel

" 괄호짝 찾기 기능에 사용자 괄호 종류를 더한다.
set mps+=<:>

" 새로 추가된 괄호의 짝을 보여주는 기능
set sm

" 현재 커서 줄 강조
set cursorline
" For detail cusorline color setting
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" For Folding
highlight Folded guibg=grey guifg=blue
set foldtext=MyFoldText()
function MyFoldText()
        let line = getline(v:foldstart)
        let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
        return v:folddashes . sub
endfunction

if exists('+colorcolumn')
"        set colorcolumn=80
else
        au BufWinEnter *.c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        au BufWinEnter *.h let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" 한글 문서 encoding
" set fencs=ucs-bom,utf-8,cp949
" Origin
" set paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 모양 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 항상 status 라인을 표시하도록 함.
set ls=2

" Status Line 설정
set statusline=\ %f\ %m%r%h%y\ %w\%=\Line:\%8.(%l%)/%-8.(%L%)\ Colume\ %4.(%c%)%6.([%p%%]%)\

if has("gui_running")
    set lines=150
    set co=171
    winp 580 4
endif

" 폰트 설정
if has("gui_running")
    if has("win32")
        set gfn=나눔고딕코딩:h10:cHANGEUL
"        set gfn=GulimChe:h9:cHANGEUL
    elseif has("unix")
        set gfn=NanumGothicCoding\ 11
    else
        set gfn=consolas\ 9
    endif
"    set gfn=Jung9\ 9
"    set gfn=Fixedsys:h12:cHANGEUL
endif

"Putty를 통해 접속한 경우에도 color scheme이 적용되도록
if &term =~ "xterm"
  "256 color --
let &t_Co=256
"restore screen after quitting
set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
if has("terminfo")
  let &t_Sf="\ESC[3%p1%dm"
  let &t_Sb="\ESC[4%p1%dm"
else
  let &t_Sf="\ESC[3%dm"
  let &t_Sb="\ESC[4%dm"
endif
endif

set background=dark
"colorscheme morning
colorscheme railscasts

"Enable Word wrap
set wrap
set linebreak
set nolist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype 기능 & Syntax Highlighting 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 파일의 종류를 자동으로 인식
filetype plugin indent on

" 파일 형식에 따른 Syntax Highlighting 기능을 켠다
sy enable

filetype on

if has("syntax")
        syntax on
endif

set omnifunc=syntaxcomplete#Complete
highlight Pmenu ctermbg=238 gui=bold


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indent 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 자동 들여쓰기 사용
set autoindent
" C indent 사용
set cindent
"Smart indent 사용
"set smartindent

" 내장된 indent 파일이 없어서 C indent 를 사용하는 경우
au FileType ,jsp setl cin

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 편리한 기능
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"새로운 buffer를 열기전에 이전 buffer를 반드시 저장하지v않아도(hidden) 된다 
set hidden

" Tab 자동 완성시 가능한 목록을 보여줌
set wmnu

set fdl=3
set fdc=5

" /를 입력하여 검색을 시작할 때 자동으로 영문사태로 만들어준다
set iminsert=0
set imsearch=0

set comments=sl:/*,mb:\ *,elx:*/

"unix format으로 변경하고,"trailing space 지우기
func! FUNC_dos2unix()
    %s///g
    %s/\s\+$//
endfunc
nmap  <LocalLeader>unix :call FUNC_dos2unix()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 기타 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 매크로 실행중에 화면을 다시 그리지 않음
set lz

" set mouse=a
function ShowMouseMode()
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMD alias
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quitall<bang>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>

let g:CommandTMaxFiles=1000000
let g:CommandTMaxDepth=25
let g:CommandTMaxCachedDirectories=5 "1 " multiple cache size 
" For my terminal. <C-H> and <BS> has same keymap in my terminal.
let g:CommandTCursorLeftMap='<Left>'
" let g:CommandTBackspaceMap='<C-H>'
let g:CommandTBackspaceMap='<BS>'

set wildignore+=*.o,*.obj,.git,*.cmd,*.builtin,*.d,*~,*.module,tags,cscope.*,vmlinux,System.map,*.bak
set wildignore+=*.jar,*.so,*.a,*.class,*.apk,*.
set wildignore+=*.js,*.html,*.jpg,*.png,*.gif,*.htm,*.jd,*.txvi,*.zip,*.exe,*.swp
set wildignore+=cts/**,docs/**,ndk/**,sdk/**,external/**,out/product/**,
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag List
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Tlist_Inc_Winwidth=0
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
map <F11> :TlistToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Files = '*.bak *~ *.o *.cmd .git *.obj *.builtin *.d *.module tags cscope.* vmlinux *System.map *.patch *.a Image .tmp* *.ko *.swp'
map <C-/> :Rgrep <cword><CR>
map <F9> :RgrepAdd <cword><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bufexplorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F12> <leader>be
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EnhancedJumps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-9> :<Plug>EnhancedJumpsFarFallbackChangeNewer
map <C-0> :<Plug>EnhancedJumpsFarFallbackChangeOlder

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
" Memolist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:memolist_path = "$HOME/wiki/"
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "$HOME/wiki/"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Memolist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:memolist_path = "$HOME/wiki/"
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "markdown"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_prompt_tags = 1
let g:memolist_prompt_categories = 1
let g:memolist_qfixgrep = 1
let g:memolist_vimfiler = 1
let g:memolist_template_dir_path = "$HOME/wiki/"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" changesPlugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:changes_hl_lines=1
let g:changes_autocmd=0
let g:changes_verbose=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_leader_key = '<SPACE>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 그외 단축키 설정
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Using Vim as wiki
nnoremap <F8>	vi[gf<ESC>
inoremap <F8>	[<C-F><C-X>

"Tab 열기/닫기
map <silent><C-N> :tabnew<CR>
map <silent><C-H> :tabp<CR>
map <silent><C-L> :tabn<CR>

" Ctrl + j,k 키로 현재 라인을 위아래로 move
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

cnoremap <C-D> <cword>
cnoreab W w
cnoreab rmblank g/^$/d
cnoreab Wq wq

imap jk <Esc>   
cmap jk <Esc>
