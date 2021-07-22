" Key to start custom mappings with.
let mapleader=" "

map <c-c> <esc><esc>
map! <C-c> <esc><esc>

" Only write.
nnoremap <leader>w <esc>:w<cr>

" Write and quit.
nnoremap <leader>s <esc>:x<cr>

" Quit without writing.
nnoremap <leader>q <esc>:q!<cr>

" Copy and paste paragraph.
noremap cp yap<S-}>p

" Cycle to previous file.
map [a <esc>:prev<cr>

" Cycle to next file.
map ]a <esc>:next<cr>

" Insert open/closing parentheses, then enter insert mode in-between.
inoremap (<cr> (<cr>)<esc>O

" Insert open/closing braces, then enter insert mode in-between.
inoremap {<cr> {<cr>}<esc>O

" Same as above, but for structs in C.
inoremap {;<cr> {<cr>};<esc>O

" Same as above, but for Javascript :(
inoremap (;<cr> (<cr>);<esc>O

" Stop highlighting.
nnoremap <leader>h :noh<cr>

" Enter a space in normal mode.
nnoremap <space><space> i<space><esc>

" Move current line down.
nnoremap <silent> <c-j> :m .+1<cr>==
inoremap <silent> <c-j> <Esc>:m .+1<cr>==gi
vnoremap <silent> <c-j> :m '>+1<cr>gv=gv
xnoremap <silent> <c-j> :move'>+<cr>gv

" Move current line up.
nnoremap <silent> <c-k> :m .-2<cr>==
inoremap <silent> <c-k> <Esc>:m .-2<cr>==gi
vnoremap <silent> <c-k> :m '<-2<cr>gv=gv
xnoremap <silent> <c-k> :move-2<cr>gv

" Unindent line.
nnoremap <c-h> <<
xnoremap <c-h> <gv
xnoremap < <gv

" Indent line.
nnoremap <c-l> >>
xnoremap <c-l> >gv
xnoremap > >gv

" Quickly start up a macro.
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Yank until end of line.
nnoremap Y y$

" Change current word and highlight all other occurrences.
nnoremap c* /\<<c-r>=expand('<cword>')<cr>\>\C<cr>``cgn

" Delete current word and highlight all other occurrences.
nnoremap d* /\<<c-r>=expand('<cword>')<cr>\>\C<cr>``dgn

" Increase window size.
nnoremap <leader>+ 10<c-w>+<cr>

" Decrease window size.
nnoremap <leader>- 10<c-w>-<cr>

" Run default Makefile target.
nnoremap <leader>m :make!<cr>

" Toggle NERDTree sidebar.
map <c-n> <Esc>:NERDTreeToggle<cr>

" Toggle ALE linting.
map <leader>l :ALEToggle<cr>

" Toggle Goyo.
map <leader>g :Goyo<cr>

" FZF.
nmap <c-f> :Files<cr>
nmap <c-g> :Rg<cr>
nmap <c-p> :Buffers<cr>

" Sign column off initially.
set signcolumn=no

function! ToggleSignColumn()
  if (&signcolumn == "yes")
    set signcolumn=no
  else
    set signcolumn=yes
  endif
endfunction

" Toggle sign column.
nnoremap <leader>e :call ToggleSignColumn()<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'vim-vsnip'