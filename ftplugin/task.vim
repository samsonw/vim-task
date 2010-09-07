" Boilerplate
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim


function! Toggle_task_status()
ruby << EOS
  line = VIM::Buffer.current.line
  line = line.gsub(/^(\s*)([-✓])/u) { $1 + ( $2 == '-' ? '✓' : '-' ) }
  VIM::Buffer.current.line = line
EOS
endfunction

inoremap <silent> <buffer> <C-D-CR> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-D-CR> :call Toggle_task_status()<CR>

" Boilerplate
let &cpo = s:cpo_save
unlet s:cpo_save

