if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')
" Lint
Plug 'w0rp/ale'

" Include
Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'galooshi/vim-import-js', { 'do': 'npm install -g import-js' }

" Add or remove your plugins here like this:
Plug 'HerringtonDarkholme/yats.vim'

" Theme
Plug 'morhetz/gruvbox'

" Layout
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'Yggdroot/indentLine'

" Typescript Plugins
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" IDE stuff
"Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'dyng/ctrlsf.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'diepm/vim-rest-console'
Plug 'farmergreg/vim-lastplace'
Plug 'mbbill/undotree'
Plug 'tpope/vim-rhubarb'

"master Languages
Plug 'vim-perl/vim-perl'

" Misc
Plug 'vimwiki/vimwiki'
call plug#end()
