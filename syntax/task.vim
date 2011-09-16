if exists("b:current_syntax")
  finish
endif

syntax keyword taskKeyword New new Working working Done done Todo TODO todo bug Bug

syntax match taskWorkingIcon "^-" contained
syntax match taskWorkingIcon "^\s*-" contained
syntax match taskDoneIcon "^✓" contained
syntax match taskDoneIcon "^\s*✓" contained

syntax match taskWorkingItem "^-.*" contains=taskWorkingIcon,taskKeyword
syntax match taskWorkingItem "^\s*-.*" contains=taskWorkingIcon,taskKeyword
syntax match taskDoneItem "^✓.*" contains=taskDoneIcon,taskKeyword
syntax match taskDoneItem "^\s*✓.*" contains=taskDoneIcon,taskKeyword

highlight taskKeyword guifg=#96CBFE guibg=NONE gui=NONE ctermfg=blue ctermbg=NONE cterm=NONE

highlight taskWorkingItem guifg=#f6f3e8 guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
highlight taskDoneItem guifg=#A8FF60 guibg=NONE gui=italic ctermfg=green ctermbg=NONE cterm=NONE

highlight taskWorkingIcon guifg=#FF6C60 guibg=NONE gui=NONE ctermfg=red ctermbg=NONE cterm=NONE
highlight taskDoneIcon guifg=#A8FF60 guibg=NONE gui=italic ctermfg=green ctermbg=NONE cterm=NONE

syntax match sectionTitleLine "^.*:\s*$" contains=sectionTitle
syntax match sectionTitle "\S.*:\s*$"
highlight sectionTitle guifg=#96CBFE guibg=NONE gui=bold,underline ctermfg=blue ctermbg=NONE cterm=bold,underline

let b:current_syntax = "task"

