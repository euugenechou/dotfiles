" General
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
set laststatus=2
set mat=2
set modeline
set mouse=a
set nocompatible
set noerrorbells
set nofoldenable
set nohlsearch
set nojoinspaces
set noshowmode
set noswapfile
set novisualbell
set number
set pastetoggle=<leader>z
set relativenumber
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
set updatetime=300
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=list:longest,full
set wrap

" IndentLine.
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['json', 'tex', 'markdown']

" LightLine.
let g:lightline =
  \ {
  \   'colorscheme': 'gruvbox_material',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \               [ 'readonly', 'filename', 'modified' ],
  \               [ 'gitbranch' ] ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead'
  \   },
  \ }

" LaTex.
let g:tex_flavor = 'tex'

" Remove stupid included NeoVim SQL bindings.
let g:omni_sql_no_default_maps = 1

" Goyo
let g:goyo_width = 101

" Emmet
let g:user_emmet_leader_key = '<c-e>'

" Rust
let g:rustfmt_autosave = 1

" FZF
let $BAT_THEME='gruvbox-dark'
let $FZF_DEFAULT_OPTS='--layout=reverse -m'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
let g:fzf_colors =
  \ {
  \   'fg':      ['fg', 'Normal'],
  \   'bg':      ['bg', 'Normal'],
  \   'hl':      ['fg', 'Comment'],
  \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \   'hl+':     ['fg', 'Statement'],
  \   'info':    ['fg', 'PreProc'],
  \   'border':  ['bg', 'Comment'],
  \   'prompt':  ['fg', 'Conditional'],
  \   'pointer': ['fg', 'Exception'],
  \   'marker':  ['fg', 'Keyword'],
  \   'spinner': ['fg', 'Label'],
  \   'header':  ['fg', 'Comment']
  \ }

" asciidoctor
let g:asciidoctor_executable = 'asciidoctor'
let g:asciidoctor_pdf_executable = 'asciidoctor-pdf'
let g:asciidoctor_syntax_conceal = 0
let g:asciidoctor_syntax_indented = 0

" clang-format
let g:clang_format#auto_format = 1
let g:clang_format#command = 'clang-format'
let g:clang_format#style_options =
  \ {
  \   "BasedOnStyle" : "LLVM",
  \   "IndentWidth" : 4,
  \   "UseTab" : "Never",
  \   "AllowShortIfStatementsOnASingleLine" : "false",
  \   "AllowShortFunctionsOnASingleLine" : "None",
  \   "AlignArrayOfStructures" : "Left",
  \   "AlignConsecutiveMacros" : "Consecutive",
  \   "AlignTrailingComments" : "true",
  \   "BreakBeforeBraces" : "Linux",
  \   "IndentCaseLabels" : "false"
  \ }
