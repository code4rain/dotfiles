if exists('g:landscape_syntax_vimfiler') && g:landscape_syntax_vimfiler == 0
  finish
endif

if version < 700
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:leaf_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_leaf_icon)
let s:opened_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_opened_icon)
let s:closed_icon = vimfiler#util#escape_pattern(g:vimfiler_tree_closed_icon)
let s:file_icon = vimfiler#util#escape_pattern(g:vimfiler_file_icon)
let s:marked_file_icon = vimfiler#util#escape_pattern(g:vimfiler_marked_file_icon)
let s:ro_file_icon = vimfiler#util#escape_pattern(g:vimfiler_readonly_file_icon)

syntax match vimfilerNonMarkedFile '.*'
      \ contains=vimfilerNonMark,vimfilerTypeText,vimfilerTypeImage,vimfilerTypeArchive,
      \vimfilerTypeExecute,vimfilerTypeMultimedia,vimfilerTypeDirectory,vimfilerTypeSystem,vimfilerTypeLink,vimfilerImportant,
      \vimfilerSize,vimfilerDateWeek,vimfilerDate,vimfilerDateToday
execute 'syntax match vimfilerMarkedFile' '''^\s*\%(' . s:leaf_icon .'\)\?'
      \ . s:marked_file_icon . ' .*$'''
      \ 'contains=vimfilerDateWeek,vimfilerDate,vimfilerDateToday'
syntax match vimfilerDirectory '^..$'

syntax match vimfilerPrompt '^\[in\]: .*$' contains=vimfilerSpecial,vimfilerCurrentDirectory
syntax match vimfilerPromptUnSafe '^! \[in\]: .*$' contains=vimfilerSpecial,vimfilerSpecialUnSafe,vimfilerCurrentDirectory
syntax match vimfilerSpecialUnSafe '^! ' contained
syntax match vimfilerSpecial '\[in\]:' contained
syntax match vimfilerCurrentDirectory '\s\zs.*$' contained contains=vimfilerMask
syntax match vimfilerMask '\[\(safe\|\.:\)\]' contained
syntax match vimfilerFileLine '\[.*\]$' contained

syntax region vimfilerTypeText start=' '
      \ end='\[T\]\|\.\(txt\|cfg\|ini\)\s*$'
      \ contained oneline
syntax region vimfilerTypeImage start=' '
      \ end='\[I\]\|\.\(bmp\|png\|gif\|jpg\|jpeg\|jp2\|tif\|ico\|wdp\|cur\|ani\)\s*$'
      \ contained oneline
syntax region vimfilerTypeArchive start=' '
      \ end='\[A\]\|\.\(lzh\|zip\|gz\|bz2\|cab\|rar\|7z\|tgz\|tar\)\s*$'
      \ contained oneline
syntax region vimfilerTypeExecute start=' '
      \ end='\[X\]\|\.\(exe\)\s*$'
      \ contained oneline
syntax region vimfilerTypeMultimedia start=' '
      \ end='\[M\]\|\.\(
      \.avi\|asf\|wmv\|flv\|swf\|divx\|mov\|m1a\|
      \.m2[ap]\|mpe\?g\|m[12]v\|mp2v\|mp[34a]\|qt\|ra\|rm\|ram\|
      \.rmvb\|rpm\|smi\|mkv\|mid\|wav\|ogg\|wma\|au\|flac\)\s*$'
      \ contained oneline
syntax region vimfilerTypeDirectory start=' '
      \ end='\[D\]\|/\s*$'
      \ contained oneline contains=vimfilerImportant
syntax region vimfilerTypeSystem start=' '
      \ end='\[S\]\|\.\(o\|hi\|inf\|sys\|reg\|dat\|spi\|a\|so\|lib\|dll\|log\)\s*$'
      \ contained oneline
syntax region vimfilerTypeLink start=' ' end='\[L\]' contained oneline
if has_key(g:, 'landscape_vimfiler_important')
  exec "syntax match vimfilerImportant " . string(g:landscape_vimfiler_important) . " contained oneline"
endif

syntax match vimfilerSize '\s\zs[[:digit:].]\+[GMKB]' contained

execute 'syntax match vimfilerNonMark'
      \ '''^\s*\%('. s:leaf_icon .'\)\?\%('. s:opened_icon . '\|'
      \ . s:closed_icon . '\|' . s:ro_file_icon . '\|' . s:file_icon .'\)\s\@='' contained'

syntax match vimfilerDateWeek '\s\zs#[^#]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDate '\s\zs\~[^~]\+$' contains=vimfilerDateIgnore contained
syntax match vimfilerDateToday '\s\zs![^!]\+$' contains=vimfilerDateIgnore contained
if has('conceal')
  " Supported conceal features.
  syntax match vimfilerDateIgnore '[#~!]' contained conceal
  syntax match vimfilerMarker '[~!@#$%^&]$' contained conceal
else
  syntax match vimfilerDateIgnore '[#~!]' contained
  syntax match vimfilerMarker '[~!@#$%^&]$' contained
endif

highlight default link vimfilerCurrentDirectory Path
highlight default link vimfilerMask Statement

highlight default link vimfilerSpecial Special
highlight default link vimfilerSpecialUnSafe Statement

highlight default link vimfilerNonMark Icon
highlight default link vimfilerMarkedFile Marked
highlight default link vimfilerDirectory Path
highlight default link vimfilerSize Constant

highlight default link vimfilerDateToday DateToday
highlight default link vimfilerDateWeek DateWeek
highlight default link vimfilerDateIgnore Ignore
highlight default link vimfilerDate DateOld

execute 'syntax match vimfilerPdfHtml ' string('^ *'.g:vimfiler_file_icon.' .*\.\(pdf\|html\)[ \n]') ' contains=vimfilerIcon,vimfilerImportant'
execute 'syntax match vimfilerTypeImage ' string('^ *'.g:vimfiler_file_icon.' .*\.\(eps\|EPS\)[ \n]') ' contains=vimfilerIcon,vimfilerImportant'
execute "syntax match vimfilerIcon '^ *".g:vimfiler_file_icon." ' contained"
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \(#\S\+#\|Makefile\.in\|configure\|aclocal\.m4\|Makefile\|stamp-h1\|config\.\(status\|log\)\|config\.h\|config\.h\.in\~\?\|output\.[0-9]\S\?\|requests\|traces\.[0-9]\S\?\|install-sh\|missing\|compile\|depcomp\|ar-lib\|mdate-sh\|mkinstalldirs\|config\.guess\|py-compile\|test-driver\|ylwrap\|config.sub\)[ \n]') ' contains=vimfilerIcon,vimfilerImportant'
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \(y\.tab\.c\|y\.output\|lex\.yy\.c\|y\.tab\.h\)[ \n]') ' contains=vimfilerIcon,vimfilerImportant'
execute 'syntax match vimfilerTypeSystem ' string('^ *'.g:vimfiler_file_icon.' \([A-Za-z0-9_-]*\(\.o\|\.hi\)\)[ \n]') ' contains=vimfilerIcon,vimfilerImportant'

highlight default link vimfilerTypeText Text
highlight default link vimfilerTypeDirectory Path
highlight default link vimfilerImportant SpecialChar
highlight default link vimfilerMarker Ignore
highlight default link vimfilerDateIgnore Ignore
highlight default link vimfilerPdfHtml PdfHtml
highlight default link vimfilerTypeLink Link
highlight default link vimfilerTypeExecute Exe
highlight default link vimfilerTypeArchive Archive
highlight default link vimfilerTypeImage Image
highlight default link vimfilerTypeMultimedia Multimedia
highlight default link vimfilerTypeSystem System
highlight default link vimfilerIcon Icon

unlet s:opened_icon
unlet s:closed_icon
unlet s:ro_file_icon
unlet s:file_icon
unlet s:marked_file_icon

let b:current_syntax = 'vimfiler'

