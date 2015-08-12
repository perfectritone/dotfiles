" Minimal remapping for Colemak
" All combination commands involving these keys persist.

" noremap j k
" noremap k j

" Make a new line with Enter o
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Show line numbers
set relativenumber

" Ensure that our plugins work properly
set nocompatible
 
" Enable detection, plugins and indenting in one step
filetype plugin indent on      
 
" Turn syntax highlighting on
syntax on
 
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
 
" Set the number of undo levels
set undolevels=1000
 
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
 
" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile
 
" Use UTF-8 as the default buffer encoding
set encoding=utf-8
 
" Underline the current line, for quick orientation
set cursorline
 
" Always show what mode we're currently editing in
set showmode
 
" Jump 5 lines when running out of screen real estate
set scrolljump=5
 
" Keep 3 lines off the edges of the screen when scrolling
set scrolloff=3
 
" Use menu to show command-line completion (in 'full' case)
set wildmenu
 
" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full
 
" Ignore node_modules files
set wildignore+=node_modules/**
 
" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"80 - save 50 lines for each register
" :100  - remember 80 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"80,:100,%,n~/.viminfo
 
" Search/replace "globally" (on a line) by default
set gdefault
 
" Use incremental searching
set incsearch
 
" Do not highlight search results
set nohlsearch
 
" Show line and column number of cursor position in status window
set ruler
set laststatus=2
 
" Editing settings
 
" Convert tabs to 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
 
" Allow backspacing over everything
set backspace=indent,eol,start
 
" Word wrap
set nowrap
set textwidth=0
 
" Visual shifting
vnoremap < <gv
vnoremap > >gv 
 
" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
 
" Jump to matching pairs easily with Tab
nnoremap <Tab> %
vnoremap <Tab> %
 
" No longer need to press the Shift key for commands
nnoremap ; :
 
" Source the vimrc file after saving it
autocmd bufwritepost .vimrc,vimrc source $MYVIMRC

fun! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfun
 
" Autostrip trailing whitespace
autocmd BufWritePre *.tcl :call <SID>StripTrailingWhitespaces()
 
" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

colorscheme wombat
