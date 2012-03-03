" Boilerplate
if (exists("b:did_ftplugin"))
    finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

function! Toggle_task_status_remove()
    let line = getline('.')
    if match(line, '^\(\s*\)-') == 0
        let line = substitute(line, '^\(\s*\)-', '\1', '')
    else 
        let line = substitute(line, '^\(\s*\)✓', '\1', '')
    endif
    call setline('.', line)
endfunction

function! Toggle_task_status()
    let line = getline('.')
    if match(line, '^\(\s*\)-') == 0
        let line = substitute(line, '^\(\s*\)-', '\1✓', '')
    elseif match(line, '^\(\s*\)✓') == 0
        let line = substitute(line, '^\(\s*\)✓', '\1-', '')
    else 
        let line = substitute(line, '^\(\s*\)', '\1-', '')
    endif
    call setline('.', line)
endfunction

inoremap <silent> <buffer> <M-z> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <M-z> :call Toggle_task_status()<CR>
inoremap <silent> <buffer> <M-Z> :call Toggle_task_status_remove()<CR>i
noremap <silent> <buffer> <M-Z> :call Toggle_task_status_remove()<CR>

" Boilerplate
let &cpo = s:cpo_save
unlet s:cpo_save

