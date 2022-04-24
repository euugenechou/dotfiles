" Clear last used command (force a redraw).
augroup cmdline
  autocmd!
  autocmd CmdlineLeave : echo ''
augroup end

" Colorize text past column 100.
match Error /\%101v.\+/

" Clear out messages after idling.
autocmd CursorHold * echo

" Fix NeoVim floating window.
" function! MyClapOnEnter() abort
"   augroup ClapEnsureAllClosed
"     autocmd!
"     autocmd BufEnter,WinEnter,WinLeave * ++once call clap#floating_win#close()
"   augroup END
" endfunction
" autocmd User ClapOnEnter call MyClapOnEnter()

" Custom filetype detection.
augroup filetypedetect
  autocmd!
  autocmd BufNewFile,BufRead *.arl setl filetype=ariel
  autocmd BufNewFile,BufRead *.gleam setl filetype=gleam
augroup END

" Disable comments on next line.
" augroup prereads
"   autocmd!
"   autocmd BufNewFile,BufWinEnter,BufRead * setl formatoptions-=c
"   autocmd BufNewFile,BufWinEnter,BufRead * setl formatoptions-=r
"   autocmd BufNewFile,BufWinEnter,BufRead * setl formatoptions-=o
"   autocmd BufNewFile,BufWinEnter,BufRead * setl conceallevel=0
"   autocmd BufNewFile,BufWinEnter,BufRead *.arl set filetype=ariel
"   autocmd BufNewFile,BufWinEnter,BufRead *.arl setl syntax=cpp
" augroup END

" Trim whitespace.
augroup prewrite
  autocmd!
  autocmd BufWritePre,FileWritePre, * :%s/\s\+$//e
augroup END
