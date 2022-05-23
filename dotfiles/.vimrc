" vim: nowrap sw=2 sts=2 ts=2 et:
" leaders
let mapleader=","
let maplocalleader="_"

" filetype and intent
filetype plugin indent on

" optional plugins coming with Vim
if has('syntax') && has('eval')
  packadd! matchit
end

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
       silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
       autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'yko/mojo.vim'
call plug#end()

" Misc configuration
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

" theme
syntax on
set t_Co=256
colorscheme gruvbox
set background=dark

" do not mess my working directories
set backupdir=~/.vimbackup

" fuzzy searching
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader><leader> :FZF<cr>
" Uncmment if you prefer CtrlP file searching instead of FZF
"let g:ctrlp_map = '<leader><leader>'
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>f :CtrlPBufTag<cr>
nnoremap <leader>q :CtrlPQuickfix<cr>
nnoremap <leader>m :CtrlPMRU<cr>

" buffers and quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <leader>w :call ToggleQuickFix()<cr>
nnoremap <leader>d :bd<cr>

" searching ang grepping
nnoremap <leader>g :copen<cr>:Ggrep!<SPACE>
nnoremap K :Ggrep "\b<C-R><C-W>\b"<cr>:cw<cr>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>

" ctags generation
nnoremap <leader>c :!ctags -R .<cr><cr>

" per-project configs
set exrc
set secure

" --- CUT HERE ---
" The rest are very much personal settings which are specific
" to my needs or keyboard layout. You unlikely need those.

" be SSD friendly (use with care!)
set directory=/tmp

" fine-tune MRU and cache settings of CtrlP
let g:ctrlp_cache_dir = '/tmp/ctrlp-cache'
let g:ctrlp_mruf_save_on_update = 0

" CTRL-] is hard on my keyboard layout
map <C-K> <C-]>

" CTRL-^ is hard on my keyboard layout
nnoremap <F1> :b#<cr>
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>

" I hate entering Ex mode by accient
map Q <Nop>

nnoremap <leader>ot :call OT(input("ot: ", "", "file"))<cr>

function! OT(fname)
    let res = system("ot --editor vim --print " . shellescape(a:fname))
    if v:shell_error
        echo "\n" . res
    else
        execute "e " res
    endif
    call histadd(':', printf('call OT("%s")', escape(a:fname, '"\')))
endfunction

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif
augroup DIRCHANGE
  au!
  autocmd DirChanged global :NERDTreeCWD
augroup END
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
