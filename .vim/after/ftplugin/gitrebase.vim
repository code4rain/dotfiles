"p, pick = use commit
"r, reword = use commit, but edit the commit message
"e, edit = use commit, but stop for amending
"s, squash = use commit, but meld into previous commit
"f, fixup = like "squash", but discard this commit's log message
"
function RebaseAction(param)
    let transitions = {'s': 'squash', 'e': 'edit', 'f': 'fixup', 'p': 'pick', 'r': 'reword'}
    execute "normal! ^cw" . transitions[a:param]
endfunction

function RebaseActionToggle()
    let line = getline(".")
    let result = matchstr(line, "^\\a")
    let transitions = {'p': 'squash', 's': 'edit', 'e': 'fixup', 'f': 'pick'}
    execute "normal! ^cw" . transitions[result]
endfunction

noremap <Cr> :call RebaseActionToggle()<Cr>
noremap p :call RebaseAction('p')<Cr>
noremap r :call RebaseAction('r')<Cr>
noremap e :call RebaseAction('e')<Cr>
noremap s :call RebaseAction('s')<Cr>
noremap f :call RebaseAction('f')<Cr>
noremap q :wq<CR>
