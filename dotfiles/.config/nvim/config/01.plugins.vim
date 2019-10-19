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

" Add or remove your plugins here like this:
Plug 'HerringtonDarkholme/yats.vim'

" Theme
Plug 'morhetz/gruvbox'

" Layout
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'

" IDE stuff
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'diepm/vim-rest-console'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'farmergreg/vim-lastplace'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'

" Languages
Plug 'vim-perl/vim-perl'
Plug 'docunext/closetag.vim'

" Misc
Plug 'vimwiki/vimwiki'
call plug#end()
