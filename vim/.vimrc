""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Author:
"   Eugene Chou (euchou@ucsc.edu)
"
" Sections:
"   General
"   VIM Interface
"   Plugins
"   Colors
"   Undo/Backup/SWP
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-Plug"
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                        " Vi compatibility!
set encoding=utf-8                      " Set UTF-8 encoding
set history=1000                        " Set how many lines of history
set autoread                            " Set auto read when a file is changed
set noshowmode                          " Hide default status bar
let mapleader=","                       " Extra key combination
set pastetoggle=<leader>z
set fileformats=unix,dos,mac            " Open files from mac/dos
set exrc                                " Enable per-directory .vimrc files
set secure                              " Disable unsafe commands in .vimrc
set laststatus=2                        " Enable more on status line
set clipboard=unnamed
syntax on                               " Enable syntax


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>w <Esc>:w<CR>
nnoremap <leader>s <Esc>:x<CR>
nnoremap <leader>q <Esc>:q!<CR>
nnoremap <leader>tq <Esc>:qa!<CR>
nnoremap <leader>ts <Esc>:wqa<CR>
nnoremap <leader>tw <Esc>:wa<CR>
nnoremap <leader>tt <Esc>:term<CR>
noremap cp yap<S-}>p
noremap <leader>a =ip
map <leader>a <Esc>:prev<CR>
map <leader>f <Esc>:next<CR>
map <C-T> <Esc>:NERDTreeToggle<CR>
map <C-G> <Esc>:GitGutterToggle<CR>
inoremap (<CR> (<CR>)<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
nnoremap <esc><esc> :noh<return>
nnoremap <space><space> i<space><esc>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-H> <<
nnoremap <C-L> >>
xnoremap <C-K> :move-2<cr>gv
xnoremap <C-J> :move'>+<cr>gv
xnoremap <C-H> <gv
xnoremap <C-L> >gv
xnoremap < <gv
xnoremap > >gv
nnoremap Q @q
vnoremap Q :norm @q<cr>
nnoremap Y y$
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
nnoremap <leader>x* :%s/\<<C-r>=expand('<cword>')<CR>\>//g<CR>
nnoremap <leader>+ 10<C-W>+<CR>
nnoremap <leader>- 10<C-W>-<CR>
nnoremap <leader>m :make!<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>l :Limelight!!<CR>

autocmd! User GoyoLeave Limelight!

augroup prewrites
    autocmd!
    autocmd BufWritePre,FileWritePre * :%s/\s\+$//e | %s/\r$//e
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 VIM Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmenu                            " Turn on wild menu
set wildignore=*.o,*~,*.pyc             " Ignored compiled files
set wildmode=list:longest,full          " Auto-completes longest common command
set ruler                               " Always show current position
set showcmd                             " Shows what command you are typing
set cmdheight=1                         " Height of the command bar
set mouse=a                             " Enable mouse usage
set modeline                            " Show what I'm doing
set backspace=eol,start,indent          " Allow backpaces
set ignorecase                          " Ignore case when searching
set hlsearch                            " Highlight search results
set showmatch                           " Display matching brackets
set mat=2                               " Blink when matching brackets
set noerrorbells                        " Turn off error bell sounds
set novisualbell                        " Turn off bell sounds
set visualbell
set t_vb=                               " Disable beeping
set tm=500                              " Disable annoying sounds
set hidden                              " Don't unload buffer
set number                              " Line numbers
set scrolloff=8                         " 8 lines above and below cursor
set textwidth=80                        " Text width is 80
set bs=2                                " Fix backspacing in insert mode
set smartindent                         " Enable smart indent
set relativenumber                      " Enable relative line numbers
set ruler
set shiftwidth=4                        " Enable shift width in 4 spaces
set tabstop=4                           " Tab is 4 spaces
set expandtab                           " Expand the tab
set wrap                                " Wrap lines
set cursorline
set termguicolors
set conceallevel=0
set splitright
match Error /\%81v.\+/                  " Error out text past column 80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType c setl sw=2 sts=2 tw=80 et
au FileType cpp setl sw=2 sts=2 tw=80 et
au FileType tex setl sw=2 sts=2 tw=80 et
au FileType python setl sw=4 sts=4 tw=80 et
au FileType julia setl sw=4 sts=4 tw=80 et
au FileType javascript setl sw=2 sts=2 tw=80 et
au FileType html setl sw=2 sts=2 tw=80 et
au FileType sql setl sw=2 sts=2 tw=80 et


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'Townk/vim-autoclose'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'godlygeek/tabular'
Plug 'Yggdroot/indentLine'
Plug 'vim-python/python-syntax'
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'ryanoasis/vim-devicons'

call plug#end()
filetype plugin indent on

if vim_plug_just_installed
    echo "Installing Plugins, please ignore key map error messages"
    :PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme monokai


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Undo/Backup/SWP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                            " Undo's file
set undodir=$HOME/.vim/undo             " Need a directory in ~./vim
set undolevels=1000                     " Maximum number of changes
set undoreload=10000                    " Maximum number lines to save for undo
set noswapfile                          " No swap file


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeNodeDelimiter="\u00a0"
let g:NERDTreeQuitOnOpen=1
let g:gitgutter_enabled=0
let g:lightline={ 'colorscheme':'wombat' }
let g:python_highlight_all=1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"
let g:indentLine_char = '▏'
let g:tex_conceal=''
let g:SuperTabCrMapping=0
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:goyo_width=80
let g:goyo_height='90%'
let g:goyo_linenr=1
let g:limelight_paragraph_span=0
