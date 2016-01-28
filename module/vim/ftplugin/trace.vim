setlocal nosmartindent
setlocal shiftwidth=4
setlocal tabstop=4
setlocal foldmethod=indent
setlocal indentexpr=GetTraceIndent()
"setlocal nocindent

function! GetTraceIndent(...)
	let clnum = a:0 ? a:1 : v:lnum

	let line = getline(clnum)
	let previousNum = prevnonblank(clnum - 1)
	while getline(previousNum) =~ '^\S\+:'
		let previousNum = prevnonblank(previousNum - 1)
	endwhile
	let previous = getline(previousNum)
	let cindent = cindent(clnum)
	let previousIndent = indent(previousNum)

	if line =~ '^\S\+:'
		return 0
	endif
	if previous =~? '^\s*if' && line !~ '^\s*('
		return indent(previousNum) + shiftwidth()
	endif
	if previous =~? '^\s*else' && line !~ '^\s*('
		return indent(previousNum) + shiftwidth()
	endif
	if previous =~? '^\s*while\s*$' && line !~ '^\s*('
		return indent(previousNum) + shiftwidth()
	endif
	let column = col(".")
	call cursor(line("."), 1)
	let openingBracket = searchpair("(", "", ")", "bWn")
	call cursor(line("."), column)

	if openingBracket == 0
		return -1
	endif

	if line =~ '^\s*)'
		return indent(openingBracket)
	endif

	return indent(openingBracket) + shiftwidth()
endfunction
" vim: ts=8
