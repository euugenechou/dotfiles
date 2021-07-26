call plug#begin(stdpath('config') . '/plugged')

Plug 'Townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'euugenechou/sonokai'
Plug 'gabrielelana/vim-markdown'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'mhinz/vim-sayonara'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'rafamadriz/friendly-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" IndentLine.
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['json', 'tex', 'markdown']

" LightLine.
" let g:lightline={ 'colorscheme': 'sonokai' }
let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" LaTex.
let g:tex_flavor = 'tex'

" Remove stupid included NeoVim SQL bindings.
let g:omni_sql_no_default_maps = 1

" clang-format
let g:clang_format#auto_format = 0
let g:clang_format#style_options = {
  \   "BasedOnStyle": "LLVM",
  \   "IndentWidth": 4,
  \ }

" FZF
let $BAT_THEME='Monokai Extended Bright'
let $FZF_DEFAULT_OPTS='--layout=reverse -m'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Goyo
let g:goyo_width = 101
let g:goyo_linenr = 1

function! s:goyo_enter()
  set relativenumber
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" Rust
let g:rustfmt_autosave = 1
