if exists('g:loaded_gitbranch') || v:version < 700
    finish
endif
let g:loaded_gitbranch = 1

let s:save_cpo = &cpo
set cpo&vim

augroup GitBranch
    autocmd!
    autocmd BufNewFile,BufReadPost * call gitbranch#detect(expand('<amatch>:p:h'))
    autocmd BufEnter * call gitbranch#detect(expand('%:p:h'))
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
