" Author: Eugene Chou (euchou@ucsc.edu)

" Enable plugins, among other things.
filetype plugin indent on

" Setup plugins on fresh install.
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

" Automatically install missing plugins.
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" Source config files.
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/augroups.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/settings.vim

" Syntax highlighting and colors.
syntax on
let g:sonokai_style = 'shusia'
let g:sonokai_disable_italic_comment = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai
