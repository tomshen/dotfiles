" === General Config ===
set nocompatible               " Use Vim settings
set number                     " Line numbers
set backspace=indent,eol,start " Allow backspace in insert mode
set history=1000               " Store more :cmdline history
set showcmd                    " Show incomplete cmds at bottom
set showmode                   " Show current mode at bottom
set visualbell                 " No sounds
set autoread                   " Reload changed files
set hidden                     " Better background buffer management
syntax on                      " Syntax highlighting
set nowrap                     " Don't wrap lines
set linebreak                  " Wrap lines at convenient points
set hlsearch                   " Highlight search terms
set mouse=a                    " Enable mouse
let mapleader=","              " Use comma as leader
runtime macros/matchit.vim     " Extended % matching

" Remember last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" === Disable Swap Files ===
set noswapfile
set nobackup
set nowb

" === Indentation ===
let tabsize = 4
set autoindent
set smartindent
set smarttab
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize
set list listchars=tab:\ \ ,trail:· " Display tailing whitespace visually

" === Folds ===
set foldmethod=indent " Fold based on indent
set foldnestmax=3     " Deepest fold is 3 levels deep
set nofoldenable      " Don't fold by default

" === File Type Specific ===
filetype plugin on
filetype indent on

" === Completion ===
set wildmode=list:longest
set wildmenu " Enable ctrl-n and ctrl-p to scroll thru matches
" Ignore when tab completing:
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" === Scrolling ===
set scrolloff=8      " Start scrolling when 8 lines from margins
set sidescrolloff=15
set sidescroll=1
set laststatus=2     " Always show status line

" === Persistent Undo ===
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
