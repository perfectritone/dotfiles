" Coloring
set background=dark

" Minimal remapping for Colemak
" All combination commands involving these keys persist.

noremap j k
noremap k j

" Make a new line with Enter o
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

set autoindent

" Insert one character with a space followed by the character
nmap <Space> i_<Esc>r

" to switch between tabs like in Firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Show line numbers
set number

" Ensure that our plugins work properly
set nocompatible
 
 
" Enable detection, plugins and indenting in one step
filetype plugin indent on      
 
 
" Set the <Leader> for combo commands
let mapleader = ","
 
 
" Turn syntax highlighting on
syntax on
 
 
" Hide buffers instead of closing them
set hidden
 
 
" Ignore case when searching
set ignorecase
" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
 
" Set the number of undo levels
set undolevels=1000
 
" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha
 
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
 
" Disable swap files and backups
set nobackup
set nowritebackup
set noswapfile
 
" Write contents of the file, if it has been modified, on buffer exit
set autowrite
 
 
" Use UTF-8 as the default buffer encoding
set encoding=utf-8
 
" Underline the current line, for quick orientation
set cursorline
 
" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd
 
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
 
 
" Easily edit the vimrc file with ,ev
nmap <leader>ev :e $MYVIMRC<CR>
 
" Indent cursor in block after {[( characters
inoremap {<CR> {<CR>}<C-O>O
inoremap [<CR> [<CR>]<C-O>O
inoremap (<CR> (<CR>)<C-O>O
 
 
" Remap filetab controls
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-t> :tabnew<CR>
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
 
" Visual shifting
vnoremap < <gv
vnoremap > >gv 
 
" Bubble lines
nmap <C-A-k> [e
nmap <C-A-j> ]e
vmap <C-A-k> [egv
vmap <C-A-j> ]egv
 
" map ,f to display all lines with keyword under cursor and ask which one to jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
 
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
 
" Alt-x/z deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><A-x> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-z> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
 
" Auto-select text that was just pasted in
nnoremap <leader>v V`]
 
" Vertically split a window and go to it
nnoremap <leader>s <C-w>v<C-w>l
 
" Sorts CSS (content between the braces)
nmap <F7> :g#\({\n\)\@<=#.,/}/sort<CR>
 
" Source the vimrc file after saving it
autocmd bufwritepost .vimrc,vimrc source $MYVIMRC
 
" Highlight lines with more than 80 columns
"if exists('+colorcolumn')
"  set colorcolumn=80
"else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif
 
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
 
" Enable folding without the use of markers
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
