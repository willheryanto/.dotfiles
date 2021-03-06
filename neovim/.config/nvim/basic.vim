" Filetypes
" This enables file type detection (like filetype on)
" and also loading plugins and indentation per filetype
filetype plugin indent on
syntax enable    " enable syntax highlighting

set autoindent   " Copy indent from current line when starting a new line

set clipboard+=unnamedplus " use system clipboard
set showcmd      " display incomplete commands
set showmode     " display the mode you're in
set backspace=indent,eol,start "intuitive backspacing"
set hidden       " Handle multiple buffers better
set wildmenu     " enhanced command line completion
set wildmode=list:longest " complete files like a shell

" Search
set ignorecase   " case-insensitive search
set smartcase    " but case-sensitive if expression contains a capital letter
set relativenumber "show relative line number
set number         "show the line number of the current line
set ruler        " show cursor position
set incsearch    " highlight matches as you type
set hlsearch     " highlight matches

" Regex
set gdefault     " use global option in regex by default

set nowrap         " turn off line wrapping
set scrolloff=3  " show 3 lines of context around cursor
set display+=lastline "Display as much as possible of a window's last line
set list         " show invisible characters
set title        " show terminal title
set visualbell   " no beeping

" Global tabs/spaces
set smarttab     " use spaces instead of tabs
set tabstop=4    " global tab width
set shiftwidth=4
set expandtab    " use spaces instead of tabs
set smarttab
set laststatus=2 " Always show a status line

set nobackup " no backups
set nowritebackup " No backups
set noswapfile " No swap files
set autoread " Automatically re-read files changed outside of vim
set nofoldenable " Disable folding

"set formatoptions-=cro

set encoding=utf-8

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Showing image in terminal in iTerm2
"autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

" Jenkins file syntax
au BufNewFile,BufRead Jenkinsfile setf groovy
