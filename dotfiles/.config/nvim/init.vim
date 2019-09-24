set nocompatible " enter the current millenium
filetype off     " required

"" PLUGIN MANAGEMENT
packadd minpac
call minpac#init()

" Managed plugins (automatically installed and updated via "Pu" and "Pc")
call minpac#add('RRethy/vim-illuminate')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('bronson/vim-trailing-whitespace')
call minpac#add('diepm/vim-rest-console')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('ekalinin/Dockerfile.vim')
call minpac#add('farmergreg/vim-lastplace')
call minpac#add('haya14busa/incsearch.vim')
"call minpac#add('honza/vim-snippets')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('jlanzarotta/bufexplorer')
call minpac#add('kien/ctrlp.vim')
call minpac#add('lilydjwg/colorizer')
call minpac#add('majutsushi/tagbar')
call minpac#add('mannih/vim-perl-variable-highlighter')
call minpac#add('morhetz/gruvbox')
call minpac#add('osfameron/perl-tags')
call minpac#add('rsrchboy/mojo.vim')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('scrooloose/nerdtree')
" call minpac#add('SirVer/ultisnips')
call minpac#add('skaji/syntax-check-perl')
call minpac#add('stephpy/vim-yaml')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-perl/vim-perl')
call minpac#add('w0rp/ale')
call minpac#add('vimwiki/vimwiki')

command! Pu call minpac#update()
command! Pc call minpac#clean()

let mapleader = ","

" enable syntax
syntax enable

set autochdir                   " Set the working directory to wherever the open file lives
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set binary                      " encoding
set bomb                        " encoding
set browsedir=current           " which directory to use for the file browser
set cindent
set complete+=k                 " scan the files given with the 'dictionary' option
"set cursorcolumn                " highlight column where cursor is
"set cursorline                  " highlight line where cursor is
set encoding=utf-8              " encoding
set expandtab                   " tabs
set fileformats=unix,dos,mac    " file formats
set fileencoding=utf-8          " encoding
set fileencodings=utf-8         " encoding
set hidden                      " enable hidden buffers
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlightthe last used search pattern
set ignorecase                  " ignore case
set incsearch                   " do incremental searching
set laststatus=2                " set statusline to appear all the time
set modeline                    " use modeline overrides
set modelines=10                " use moduline overrides
set mouse=a                     " enable the use of the mouse
set mousemodel=popup
set nowrap                      " do not wrap lines
set number                      " display line numbers
set pastetoggle=<F2>            " do not autoindent when pasting
set path+=**                    " work on directories recursively
set numberwidth=4
set path+=**                    " Search down into subfolders
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set sessionoptions-=options
set shell=/bin/bash             " shell preference
set shiftwidth=4                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set showmatch                   " show the matching part of the pair for [] {} and ()
set showmode                    " show current working mode
set smartcase                   " searching
set smartindent                 " smart autoindenting when starting a new line
set smarttab                    " tabs
set softtabstop=4               " tabs
set splitbelow                  " split below when horizontal
set splitright                  " split to the right when vertical
set tabstop=4                   " number of spaces that a <Tab> counts for
set title
set titleold="Terminal"
set titlestring=%F
set ttyfast                     " encoding
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd,*.pyc
set wildignore+=node_modules/*,bower_components/*
set wildmenu                    " Display all matching files when we tab complete

set t_Co=256
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=None

" Clipboard functionality (paste from system)
vnoremap  <leader>y "+y
nnoremap  <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Spelling
nnoremap <leader>sp :set spell<CR>
nnoremap <leader>s ]s
nnoremap <leader>f 1z=

" Line numbers
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>

" Clear highlighting
nnoremap <leader>c :nohl<CR>

" Paste mode
nnoremap <leader>pa :set nopaste!<CR>

" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
