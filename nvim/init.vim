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

" Handle plugins first.
source $HOME/.config/nvim/plugins.vim

" Then load the colorscheme.
syntax on
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_background = 'soft'
colorscheme gruvbox-material

" Source the rest of the config, ending with settings.
source $HOME/.config/nvim/augroups.vim
source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/settings.vim
