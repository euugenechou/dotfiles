" Author: Eugene Chou (euchou@ucsc.edu)

" Setup on fresh install.
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif


"
" Plugins.
"

call plug#begin('~/.config/nvim/plugged')

Plug 'JuliaEditorSupport/julia-vim'
Plug 'Townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex'
Plug 'maximbaz/lightline-ale'
Plug 'mlr-msft/vim-loves-dafny'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-python/python-syntax'
Plug 'voldikss/vim-floaterm'

call plug#end()

" Enable plugins.
filetype plugin indent on

" Automatically install missing plugins.
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"
" Mappings.
"

" Key to start custom mappings with.
let mapleader=" "

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

" Clear last used command (force a redraw).
augroup cmdline
  autocmd!
  autocmd CmdlineLeave : echo ''
augroup end

" Colorize text past column 100.
match Error /\%101v.\+/

" Clear out messages after idling.
" autocmd CursorHold * echo

" Fix NeoVim floating window.
function! MyClapOnEnter() abort
  augroup ClapEnsureAllClosed
    autocmd!
    autocmd BufEnter,WinEnter,WinLeave * ++once call clap#floating_win#close()
  augroup END
endfunction
autocmd User ClapOnEnter call MyClapOnEnter()


"
" Global plugin variables (and other miscaellaneous things).
"

" NERDTree.
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeNodeDelimiter="\u00a0"
let g:NERDTreeQuitOnOpen=1

" IndentLine.
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['json', 'tex', 'markdown']

" LightLine.
let g:lightline={ 'colorscheme': 'sonokai' }
let g:lightline.component_expand = {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_infos': 'lightline#ale#infos',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok',
  \ }
let g:lightline.component_type = {
  \   'linter_checking': 'right',
  \   'linter_infos': 'right',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'right',
  \ }
let g:lightline.active = {
  \   'right': [
  \     [
  \       'linter_errors',
  \       'linter_warnings',
  \       'linter_ok'
  \     ],
  \     [ 'lineinfo' ],
  \     [ 'fileformat', 'fileencoding', 'filetype' ],
  \   ]
  \ }
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e\ "
let g:lightline#ale#indicator_ok = "\uf00c"

" ALE.
let g:ale_linters = { 'c':    [ 'clang' ]    }
let g:ale_linters = { 'cpp':  [ 'cppcheck' ] }
let g:ale_linters = { 'rust': [ 'rustc' ]    }

" Python.
let g:python_highlight_all=1

" LaTex.
let g:tex_flavor = 'tex'

" Floaterm.
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_title = ''
let g:floaterm_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']

" Goyo.
let g:goyo_width=76
let g:goyo_height='95%'

" Remove stupid included NeoVim SQL bindings.
let g:omni_sql_no_default_maps = 1

" Semshi
let g:semshi#excluded_hl_groups = ['local', 'parameter']

" Haskell
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_fields = 1
let g:go_fmt_autosave = 1
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1

" clang-format
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
  \   "BasedOnStyle": "WebKit",
  \   "IndentWidth": 4,
  \   "Language": "Cpp",
  \   "AlignConsecutiveMacros": "true",
  \   "AlignEscapedNewlines": "Left",
  \   "AlignOperands": "true",
  \   "AlignTrailingComments": "true",
  \   "AllowShortBlocksOnASingleLine": "Never",
  \   "AllowShortEnumsOnASingleLine": "true",
  \   "AllowShortCaseLabelsOnASingleLine": "false",
  \   "AllowShortFunctionsOnASingleLine": "None",
  \   "AllowShortIfStatementsOnASingleLine": "Never",
  \   "BreakBeforeBraces": "Attach",
  \   "ColumnLimit": 100,
  \   "IncludeBlocks": "Regroup",
  \   "IndentCaseLabels": "false",
  \   "IndentWrappedFunctionNames": "true",
  \   "KeepEmptyLinesAtTheStartOfBlocks": "false",
  \   "PointerAlignment": "Right",
  \   "ReflowComments": "false",
  \   "SortIncludes": "false",
  \   "SpaceAfterCStyleCast": "false",
  \   "SpaceAfterLogicalNot": "false",
  \   "SpaceBeforeAssignmentOperators": "true",
  \   "SpaceAfterControlStatementKeyword": "true",
  \   "SpaceBeforeCpp11BracedList": "true"
  \ }

" FZF
let $BAT_THEME='Monokai Extended Bright'
let $FZF_DEFAULT_OPTS='--layout=reverse -m'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }


"
" Syntax highlighting and colors.
"

syntax on
let g:sonokai_transparent_background = 1
colorscheme sonokai


"
" Customize filetypes.
"

au FileType c setl sw=4 sts=4 tw=100 et commentstring=//\ %s
au FileType cpp setl sw=4 sts=4 tw=80 et commentstring=//\ %s
au FileType tex setl sw=2 sts=2 tw=72 et
au FileType python setl sw=4 sts=4 tw=100 et
au FileType julia setl sw=4 sts=4 tw=80 et
au FileType javascript setl sw=2 sts=2 tw=80 et
au FileType html setl sw=2 sts=2 tw=80 et
au FileType sql setl sw=2 sts=2 tw=80 et
au FileType lilypond setl sw=2 sts=2 tw=100 et commentstring=%\ %s
au FileType go setl ts=4 sw=4 sts=4 tw=100 et
au FileType markdown setl ts=4 sw=4 sts=4 tw=80 et
au FileType yacc setl ts=4 sw=4 sts=4 tw=76 et
au FileType ariel setl ts=4 sw=4 sts=4 tw=76 et commentstring=//\ %s
au FileType dafny setl ts=4 sw=4 sts=4 tw=110 et
au FileType make set ts=4 sw=4 sts=4 noexpandtab


"
" General settings.
"

set autoread
set backspace=eol,start,indent
set bs=2
set clipboard=unnamed
set cmdheight=1
set conceallevel=0
set cursorline
set encoding=utf-8
set expandtab
set exrc
set fileformats=unix,dos,mac
set formatoptions-=cro
set hidden
set history=1000
set hlsearch
set ignorecase
set laststatus=2
set mat=2
set modeline
set mouse=a
set nocompatible
set noerrorbells
set noshowmode
set noswapfile
set novisualbell
set nofoldenable
set number
set pastetoggle=<leader>z
set relativenumber
set ruler
set ruler
set scrolloff=4
set secure
set shiftwidth=2
set showcmd
set showmatch
set smartindent
set splitright
set t_vb=
set tabstop=2
set termguicolors
set textwidth=80
set tm=500
set undodir=/tmp
set undofile
set undolevels=1000
set undoreload=10000
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=list:longest,full
set wrap


"
" Load other plugin-related settings.
"

source $HOME/.config/nvim/coc.vim
