" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'c9s/perlomni.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mannih/vim-perl-variable-highlighter'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'oalders/vim-perl', { 'branch': 'dev', 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'skaji/syntax-check-perl'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'vim-syntastic/syntastic'
call plug#end()

let mapleader=","

filetype plugin on

set autochdir                   " Set the working directory to wherever the open file lives
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set binary                      " encoding
set bomb                        " encoding
set browsedir=current           " which directory to use for the file browser
set cindent
set cmdheight=2
set complete+=k                 " scan the files given with the 'dictionary' option
set encoding=utf-8              " encoding
set expandtab                   " tabs
set fileencoding=utf-8          " encoding
set fileformats=unix,dos,mac    " file formats
set hidden                      " enable hidden buffers
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlightthe last used search pattern
set ignorecase                  " ignore case
set incsearch                   " do incremental searching
set laststatus=2                " set statusline to appear all the time
set modelines=10                " use moduline overrides
set mouse=a                     " enable the use of the mouse
set mousemodel=popup
set noerrorbells
set nowrap                      " do not wrap lines
set number                      " display line numbers
set numberwidth=4
set pastetoggle=<F2>            " do not autoindent when pasting
set path+=**                    " work on directories recursively
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set sessionoptions-=options
set shell=/bin/zsh              " shell preference
set shiftwidth=2                " number of spaces to use for each step of indent
set shortmess+=c
set showcmd                     " display incomplete commands
set showmatch                   " show the matching part of the pair for [] {} and ()
set showmode                    " show current working mode
set signcolumn=yes
set smartcase                   " searching
set smartindent                 " smart autoindenting when starting a new line
set smarttab                    " tabs
set softtabstop=2               " tabs
set splitbelow                  " split below when horizontal
set splitright                  " split to the right when vertical
set tabstop=2                   " number of spaces that a <Tab> counts for
set title
set titleold="Terminal"
set titlestring=%F
set ttyfast                     " encoding
set undolevels=1000
set updatetime=3000
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=node_modules/*,bower_components/*
set wildignore+=*.pdf,*.psd,*.pyc
set wildmenu                    " Display all matching files when we tab complete

syntax on
set t_Co=256
colorscheme gruvbox
set background=dark

" Expose extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

autocmd BufWinLeave * call clearmatches()

let g:indentLine_color_term = 68
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = ''

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*', 'scp://.\*']

" Ale configuration
let g:airline#extensions#ale#enabled = 1
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = 'w'
let g:ale_perl_perl_options = '-c -Mwarnings -I. -Ilib'
let g:ale_perl_perltidy_options = '-pro=/home/dkl/devel/github/mozilla/bmo/master/.perltidyrc'
let g:ale_perl_perlcritic_showrules = 1
let g:ale_type_map = {
\ 'perlcritic': {'ES': 'WS', 'E': 'W'},
\}
let g:ale_linters = {
\   'perl': ['syntax-check', 'perlcritic']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'perl': ['perltidy']
\}

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
