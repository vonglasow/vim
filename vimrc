if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

set autoindent
set backspace=indent,eol,start
set browsedir=buffer
set cmdheight=1
set completeopt=menu,preview
set cursorcolumn
set cursorline
set encoding=utf-8
set expandtab
set fileencodings=utf-8
set fileformats=unix,mac,dos
set fillchars+=vert:\+
set fillchars-=vert:\|
set foldclose=
set foldmethod=syntax
set hlsearch
set ignorecase
set incsearch
set keymodel=startsel
set laststatus=2
set lcs=tab:\|\ ,trail:-,precedes:←,extends:➜,nbsp:˽
set list
set modeline
set nobackup
set nobomb
set nocompatible
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nrformats=octal,hex,alpha
set nu
set selection=inclusive
set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=4
set title
set ttyfast
"set viminfo='20,\"50,:20,%,n~/.viminfo
set wildmenu
set wildmode=longest:full
set wildchar=<Tab>
set wildcharm=<C-Z>
set winminheight=0
set winminwidth=0
set whichwrap=<,>,h,l,[,]
set tags=.tags;/

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'tyok/nerdtree-ack'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/calendar.vim'
Plugin 'tpope/vim-surround'
Bundle 'joonty/vdebug.git'
Bundle 'chase/vim-ansible-yaml'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-notes'
Plugin 'matze/vim-move'
Plugin 'alvan/vim-phpmanual'
Plugin 'vim-scripts/toggle'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin '2072/PHP-Indenting-for-VIm'

call vundle#end()            " required
filetype plugin indent on    " required

let maplocalleader = ','

nnoremap <silent> <C-Up> <C-W>W
nnoremap <silent> <C-Left> <C-W>h
nnoremap <silent> <C-Down> <C-W>w
nnoremap <silent> <C-Right> <C-W>l
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-b> :Gblame<CR>
" nnoremap <silent> <F2> :Calendar<CR>

"Format code
nnoremap <localleader>fj :%!python -m json.tool<CR>
nnoremap <silent> <C-Space> :%s/\s\+$//e<CR>

" Tabular.
nnoremap <localleader>a=  :Tabularize /=<CR>
vnoremap <localleader>a=  :Tabularize /=<CR>
nnoremap <localleader>a:  :Tabularize /:<CR>
vnoremap <localleader>a:  :Tabularize /:<CR>
nnoremap <localleader>a=> :Tabularize /=><CR>
vnoremap <localleader>a=> :Tabularize /=><CR>
nnoremap <localleader>a-> :Tabularize /-><CR>
vnoremap <localleader>a-> :Tabularize /-><CR>
nnoremap <localleader>a(  :Tabularize /(<CR>
vnoremap <localleader>a(  :Tabularize /(<CR>
nnoremap <localleader>a)  :Tabularize /)<CR>
vnoremap <localleader>a)  :Tabularize /)<CR>
nnoremap <localleader>a[  :Tabularize /[<CR>
vnoremap <localleader>a[  :Tabularize /[<CR>
nnoremap <localleader>a]  :Tabularize /]<CR>
vnoremap <localleader>a]  :Tabularize /]<CR>

" vimrc
nnoremap <localleader>sv :source $MYVIMRC<CR>
nnoremap <localleader>ev :vsplit $MYVIMRC<CR>

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

if executable('ag')
  let g:ackprg = 'ag -i --nogroup --nocolor --column -p ~/.agignore'
endif

let g:calendar_google_calendar = 1

let g:syntastic_aggregate_erros = 0
let g:syntastic_php_phpcs_args='--standard=PSR2'
let g:syntastic_php_checkers = ["php", "phpmd", "phpcs"]

let php_phpdoc_folding = 1
let php_folding = 1

let g:easytags_file = '/var/www/tags'
let g:easytags_async = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_autorecurse = 1
let g:easytags_auto_update = 0

let g:move_key_modifier = 'C'
