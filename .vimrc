" source $VIMRUNTIME/vimrc_example.vim
" if has("gui_win32")
"    source $VIMRUNTIME/mswin.vim
"    behave mswin
"endif

set nocompatible
filetype off

set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim
" set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/syntastic'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'christoomey/vim-tmux-navigator'


let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <h> :TmuxNavigateLeft<cr>
nnoremap <silent> <j> :TmuxNavigateDown<cr>
nnoremap <silent> <k> :TmuxNavigateUp<cr>
nnoremap <silent> <l> :TmuxNavigateRight<cr>
nnoremap <silent> <\> :TmuxNavigatePrevious<cr>


imap ;; <Esc>
imap jk <Esc>
imap kj <Esc>

set tabpagemax=50

hi clear

colorscheme mydark

" autocmd FileType sql        nnoremap <buffer> <silent> <f5> :!psql --file=%:p<cr>
autocmd FileType sql        nnoremap <buffer> <silent> <f5> :!psqlccze %<cr><cr>
" autocmd FileType python         nnoremap <buffer> <silent> <f5> :!pyccze %<cr><cr>
autocmd FileType python         nnoremap <buffer> <silent> <f5> :!pygo %<cr><cr>
autocmd FileType c         nnoremap <buffer> <silent> <f5> :!clear;cgo % <cr>


highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" some plugins over-write my textwidth setting
autocmd BufRead     * set textwidth=0
autocmd VimEnter    * set   cursorline
autocmd VimLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set   cursorline
autocmd BufEnter    * set   cursorline
autocmd BufLeave    * set nocursorline

set nocompatible
set showcmd
set wildmenu
set incsearch
set hlsearch
set textwidth=0
set wrapmargin=0
set nowrap
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set noerrorbells
set novisualbell
set showmode
set laststatus=2
set t_Co=256




" both of these relate to NERDTree https://github.com/scrooloose/nerdtree
map <F3> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endi

" tagbar http://majutsushi.github.com/tagbar/
nmap <F8> :TagbarToggle<CR>


set showcmd
set wildmenu
set incsearch
set hlsearch
set nocul

set textwidth=0
set wrapmargin=0
set nowrap
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set encoding=utf-8
set term=screen-256color

set laststatus=2


" augroup CursorLine
"    au!
"    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"    au WinLeave * setlocal nocursorline
"augroup END

" filetype off
" http://dotshare.it/dots/158/
" https://github.com/tpope/vim-pathogen
" call pathogen#infect()
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()
" syntax on
" filetype plugin indent on


let g:Powerline_symbols = 'fancy'

syntax enable
set background=dark

" from http://vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" https://gist.github.com/jkkii1973419
" still doesn't work for me
if exists('$TMUX')
    "let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    "let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"  https://groups.google.com/forum/#!msg/vim_use/9U0QBp8w1N4/boTv5vYBh38J
"  if &term =~ "xterm\\|rxvt"  " Only apply this in xterm or rxvt-* terminals
"      silent !echo -ne "\033]12;white\007"    " Initialize the cursor to white at startup
"      let &t_SI = "\033]12;red\007" " Turn the cursor green when entering insert mode
"      let &t_EI = "\033]12;grey\007" " Turn the cursor white again when leaving insert mode
"      autocmd VimLeave * !echo -ne "\033]12;white\007"    " Make sure the cursor is back to white when Vim exits
"  endif
 
"  set guicursor=a:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guicursor=i-r-c:ver10
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
"  this is what my guicursor has been for years
"  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,ve:ver35-Cursor-blinkon0,o:hor50-Cursor-blinkon0,i-ci:ver25-Cursor/lCursor-blinkon0,r-cr:hor20-Cursor/lCursor-blinkon0,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guifont=Bitstream\ Vera\ Sans\ Mono\ 8,MiscFixed\ 10,Lucida_Console:h7:cANSI,Lucida_Console:h8:cANSI
" set guifont=MiscFixed\ 8,Lucida_Console:h7:cANSI,Lucida_Console:h8:cANSI

"  from amix.dk/vim/vimrc.html
set noerrorbells
set novisualbell
"  set t_vb=
"  set tm=500

set mouse-=a
set mousemodel=popup
set visualbell
set guioptions-=T
set guioptions+=m
set backupdir+=./.gvimbackup

set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set nowrap

set showmode

set backspace=indent,eol,start

"  I'm trying to follow vim tip #989 http://www.vim.org/tips/tip.php?tip_id=989 and adding formatoptions=l
    " au BufRead,BufWrite,BufNewFile *.txt setl formatoptions=ltcroqan1
augroup text
    au!
    au BufRead,BufWrite,BufNewFile *.txt setl formatoptions=lb
    au BufRead,BufWrite,BufNewFile *.txt setl comments=fb:-,fb:*
    au BufRead,BufWrite,BufNewFile *.txt setl wrap
    au BufRead,BufWrite,BufNewFile *.txt setl linebreak 
    au BufRead,BufWrite,BufNewFile *.txt setl autoindent
    au BufRead,BufWrite,BufNewFile *.txt setl textwidth=0
    au BufRead,BufWrite,BufNewFile *.txt setl wrapmargin=0
    au BufRead,BufWrite,BufNewFile *.txt setl expandtab
    au BufRead,BufWrite,BufNewFile *.txt setl shiftwidth=4
    au BufRead,BufWrite,BufNewFile *.txt setl softtabstop=4
    au BufRead,BufWrite,BufNewFile *.txt setl smarttab
    au BufRead,BufWrite,BufNewFile *.txt setf text
augroup END

augroup mail
    au!
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl formatoptions=lb
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl comments=fb:-,fb:*
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl wrap
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl linebreak 
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl autoindent
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl textwidth=0
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl wrapmargin=0
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl expandtab
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl shiftwidth=4
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl softtabstop=4
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl smarttab
    au BufRead,BufWrite,BufNewFile .letter,mutt*,/tmp/mutt* setl nomodeline
augroup END

filetype plugin indent on

"  source ~/.gvim/plugin/VimNotes.vim
"  - highlighter.vim is really cool but it issues error messages for files it
"  can't write to
"  source ~/.gvim/plugin/highlighter.vim


if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"  http://vim.1045645.n5.nabble.com/Changing-the-shape-of-the-cursor-td1183905.html
let &t_SI = "\033]12;red\007"
let &t_EI = "\033]12;white\007"
autocmd VimLeave * :!echo -ne "\033]12;white\007"

" let &t_SI = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=3\x7"

" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul

" hi cursorline is there because changing the cursor shape for insert mode doesn't work from the console
" highlight clear Cursorline
" highlight CursorLine ctermbg=236
autocmd InsertEnter * set nocul
autocmd InsertLeave * set cul
autocmd VimLeave * set nocul
autocmd BufEnter * set cul
autocmd BufLeave * set nocul
autocmd VimEnter * set cul

set t_Co=256


" colorscheme stuff has to be done after vim plugins because some plugins muck with colorscheme
if &g:background == "dark"
    colorscheme mydark
    set nocursorline
    highlight clear CursorLine
    highlight CursorLine cterm=none ctermbg=239
    set cursorline
else
    set nocursorline
    highlight clear CursorLine
    highlight CursorLine cterm=none ctermbg=255
    set cursorline
endif


syntax on
filetype on
filetype plugin indent on

nmap <silent> <F3> :NERDTreeToggle<CR>
nmap <silent> <F8> :TagbarToggle<CR>

" syntastic
let g:syntastic_python_checkers = ['pyflakes']
" let g:syntastic_python_checkers = ['flake8']
let g:syntastic_mode_map        = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': [] }
let g:syntastic_mode            = 'active'
let g:syntastic_check_on_open   = 1
