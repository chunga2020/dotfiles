set confirm

set formatoptions=tcq
set textwidth=80
set wrap

set nomodeline

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set number numberwidth=2
set relativenumber
set cmdheight=2

set linebreak

set hlsearch
set ignorecase
set incsearch

set foldmethod=indent
set foldlevelstart=20

set backspace=2

" persistent statusline
set laststatus=2

" filename
set statusline=%f

" filetype
set statusline+=\ %y

" read-only
set statusline+=%r

" file format (ending type)
set statusline+=[%{&ff}]

" modified and buffer number
set statusline+=[%M%n]\ \ \ \ 

" current line and column
set statusline+=%=%l.%c\ 

" percent of file
set statusline+=\ \ \ \ %p%%\ 

syntax on
filetype indent plugin on

nnoremap Y y$

nnoremap <localleader>ev :badd ~/.vimrc<cr>:bn<cr>
nnoremap <localleader>sv :so ~/.vimrc<cr>

nnoremap <Tab> :bn<cr>
nnoremap <S-Tab> :bp<cr>

nnoremap j gj
nnoremap k gk

nnoremap p ]p
nnoremap P ]P

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

nnoremap <Left> <nop>
nnoremap <Right> <nop>
nnoremap <Up> <nop>
nnoremap <Down> <nop>

if &term =~ "xterm"
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
endif

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

function! ClearSearch()
    let @/=""
endfunction

function! CreateLilyHeader()
    call append(0, '\version "2.18.2"')
    call append(1, '\language "english"')
    call append(2, '\pointAndClickOff')
    call append(3, "")
endfunction

augroup filetype lilypond
    autocmd!
    autocmd FileType lilypond setlocal tabstop=2
    autocmd FileType lilypond setlocal shiftwidth=2
    autocmd FileType lilypond inoremap <buffer> < <><Left>
    autocmd FileType lilypond setlocal makeprg='/usr/bin/lilypond'
    autocmd BufNewFile *.ly call CreateLilyHeader()
augroup END
