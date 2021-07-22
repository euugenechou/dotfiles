call plug#begin(stdpath('config') . '/plugged')

Plug 'Townk/vim-autoclose'
Plug 'Yggdroot/indentLine'
Plug 'gisraptor/vim-lilypond-integrator'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'rafamadriz/friendly-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" IndentLine.
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['json', 'tex', 'markdown']

" LightLine.
let g:lightline={ 'colorscheme': 'sonokai' }

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

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" Rust
let g:rustfmt_autosave = 1