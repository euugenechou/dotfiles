 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap <leader>s <Esc>:wq<CR>
nnoremap <leader>q <Esc>:q<CR>
noremap cp yap<S-}>p
noremap <leader>a =ip
set pastetoggle=<leader>z
map <C-F> <Esc>:next<CR>                    " Go to next file using ctrl + F "
map <C-A> <Esc>:prev<CR>                    " Go to previous file using ctrl + A "
map <C-T> <Esc>:NERDTreeToggle<CR>           " Toggle NERDtree with ctrl + n "
map <C-G> <Esc>:GitGutterToggle<CR>          " Toggle GitGutter with ctrl + g "
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O{
nnoremap <esc><esc> :noh<return>        " Escape highlights with <ESC><ESC> "
nnoremap <space><space> i<space><esc>   " Insert space with <space><space> "
nnoremap <C-K> :move-2<cr>              " Move line up  "
nnoremap <C-J> :move+<cr>               " Move line down  "
nnoremap <C-H> <<                       " De-indent line  "
nnoremap <C-L> >>                       " Indent line  "
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
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
autocmd BufWritePre * :%s/\s\+$//e      " Remove trailing whitespace on save


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
set guifont=Fira\ Code:h11:cANSI            " Set font
set hlsearch                            " Highlight search results
set showmatch                           " Display matching brackets
set mat=2                               " Blink when matching brackets
set noerrorbells                        " Turn off error bell sounds
set novisualbell                        " Turn off bell sounds
set t_vb=                               " Disable beeping
set tm=500                              " Disable annoying sounds
set hidden                              " Don't unload buffer
set number                              " Line numbers
set scrolloff=10                        " 10 lines above and below cursor
set textwidth=100                       " Text width is 80
set bs=2                                " Fix backspacing in insert mode
set smartindent                         " Enable smart indent
set relativenumber                      " Enable relative line numbers
set ruler
set shiftwidth=4                        " Enable shift width in 4 spaces
set tabstop=4                           " Tab is 4 spaces
set expandtab                           " Expand the tab
set wrap                                " Wrap lines
match Error /\%101v.\+/                  " Error out text past column 80


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType c setl sw=4 sts=4 tw=80 et
au FileType cpp setl sw=4 sts=4 tw=80 et
au FileType python setl sw=4 sts=4 tw=80 et


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
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'tpope/vim-abolish'
Plug 'Townk/vim-autoclose'
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

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
set rtp+=/usr/local/opt/fzf
let NERDTreeIgnore = ['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = 'µ'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'gµ'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
let g:gitgutter_enabled = 0
let g:lightline = { 'colorscheme':'wombat' }
let g:python_highlight_all = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/snippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234
