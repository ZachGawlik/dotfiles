set nocompatible

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

set scrolloff=4         " 4 line context for scrolling up/down at edge
set wildmenu
set wildmode=longest:list,full

" following sensible.vim
set ttimeout
set ttimeoutlen=100     " shorten timeout when typing partial commands
set complete-=i
set laststatus=2        " Keep status line on bottom. Req. for airplane

set ignorecase          " ignore case when / searching
set smartcase           " respect case when / search with capitals
set gdefault            " append g to replace all in line  %s/foo/bar/g
set showmatch
set hlsearch

nnoremap <leader><space> :nohl<cr>  " clear search highlight

set wrap
set textwidth=79
set formatoptions=qrn1
set list
set listchars=tab:▸\ 


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set visualbell
set noerrorbells
set number

set directory=~/.vim/tmp,.
set nobackup		" do not keep a backup file, use versions instead
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler   		" show the cursor position all the time
set showcmd 		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on
syntax on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.

  autocmd Filetype html setlocal ts=2 sts=2 sw=2
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

  " Prevent creating another comment line on carriage return / o from comment
  autocmd BufNewFile, BufRead * setlocal formatoptions-=r
  autocmd BufNewFile, BufRead * setlocal formatoptions-=o

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on

endif " has("autocmd")
