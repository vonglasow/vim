if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif
syntax on

if &diff
    colorscheme koehler
endif

colorscheme koehler

set autoindent
set backspace=indent,eol,start
set browsedir=buffer
set cmdheight=1
set completeopt=menu,preview
"set cursorcolumn
"set cursorline
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
set lcs=tab:\|\ ,trail:-,precedes:←,extends:➜,nbsp:˽,eol:¬
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
set nospell
set spelllang=en_us

filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
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
Plugin 'joonty/vdebug.git'
Plugin 'chase/vim-ansible-yaml'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'matze/vim-move'
Plugin 'alvan/vim-phpmanual'
Plugin 'vim-scripts/toggle'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimproc.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'Shougo/neocomplete.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'othree/xml.vim'
Plugin 'hoaproject/Contributions-Vim-Pp'
Plugin 'rust-lang/rust.vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'vim-scripts/LanguageTool'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'https://github.com/fwip/vim-jira.git'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'morhetz/gruvbox'
Plugin 'w0ng/vim-hybrid.git'

call vundle#end()            " required
filetype plugin indent on    " required

let maplocalleader = ','

"LanguageTool

let g:languagetool_jar='/opt/LanguageTool-3.6-SNAPSHOT/languagetool-commandline.jar'

"BufferGator
nnoremap <silent> <S-Tab> :BuffergatorToggle<CR>

nnoremap <silent> <C-Up> <C-W>W
nnoremap <silent> <C-Left> <C-W>h
nnoremap <silent> <C-Down> <C-W>w
nnoremap <silent> <C-Right> <C-W>l
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :NERDTreeFind<CR>
nnoremap <silent> <C-b> :Gblame<CR>
" nnoremap <silent> <F2> :Calendar<CR>

let g:solarized_termcolors= 16
let g:solarized_termtrans = 0
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility= "normal"

"Format code
nnoremap <localleader>fj :%!python -m json.tool<CR>
nnoremap <silent> <C-Space> :%s/\s\+$//e<CR>
nnoremap <silent> <C-t> xph
"nnoremap <silent> <C-t> "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:noh<CR>

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

let g:airline#extensions#tabline#enabled = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if executable('ag')
  let g:ackprg = 'ag -i --nogroup --nocolor --column -p ~/.agignore'
endif

let g:calendar_google_calendar = 1

let g:syntastic_aggregate_erros = 0
let g:syntastic_php_phpcs_args='--standard=PSR2'
let g:syntastic_php_checkers = ["php", "phpmd", "phpcs"]

let php_phpdoc_folding = 1
let php_folding = 1

let g:easytags_file = '~/.tags'
let g:easytags_async = 1
let g:easytags_autorecurse = 1
let g:easytags_auto_update = 0

let g:move_key_modifier = 'C'

let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_level = "all"

let g:gitgutter_highlight_lines = 1

nnoremap <silent><localleader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><localleader>pcf :call PhpCsFixerFixFile()<CR>

"Mapping
inoremap <localleader>alpha   α
inoremap <localleader>beta    β
inoremap <localleader>gamma   γ
inoremap <localleader>delta   δ
inoremap <localleader>epsilon ε
inoremap <localleader>zeta    ζ
inoremap <localleader>eta     η
inoremap <localleader>theta   θ
inoremap <localleader>iota    ι
inoremap <localleader>kappa   κ
inoremap <localleader>lambda  λ
inoremap <localleader>mu      μ
inoremap <localleader>nu      ν
inoremap <localleader>xi      ξ
inoremap <localleader>omicron ο
inoremap <localleader>pi      π
inoremap <localleader>rho     ρ
inoremap <localleader>sigma   σ
inoremap <localleader>tau     τ
inoremap <localleader>upsilon υ
inoremap <localleader>phi     φ
inoremap <localleader>chi     χ
inoremap <localleader>psi     ψ
inoremap <localleader>omega   ω

inoremap <localleader>Alpha   Α
inoremap <localleader>Beta    Β
inoremap <localleader>Gamma   Γ
inoremap <localleader>Delta   Δ
inoremap <localleader>Epsilon Ε
inoremap <localleader>Zeta    Ζ
inoremap <localleader>Eta     Η
inoremap <localleader>Theta   Θ
inoremap <localleader>Iota    Ι
inoremap <localleader>Kappa   Κ
inoremap <localleader>Lambda  Λ
inoremap <localleader>Mu      Μ
inoremap <localleader>Nu      Ν
inoremap <localleader>Xi      Ξ
inoremap <localleader>Omicron Ο
inoremap <localleader>Pi      Π
inoremap <localleader>Rho     Ρ
inoremap <localleader>Sigma   Σ
inoremap <localleader>Tau     Τ
inoremap <localleader>Upsilon Υ
inoremap <localleader>Phi     Φ
inoremap <localleader>Chi     Χ
inoremap <localleader>Psi     Ψ
inoremap <localleader>Omega   Ω

inoremap <localleader>in     ∈
inoremap <localleader>forall ∀
inoremap <localleader>exists ∃
inoremap <localleader>C      ℂ
inoremap <localleader>N      ℕ
inoremap <localleader>P      ℙ
inoremap <localleader>Q      ℚ
inoremap <localleader>R      ℝ
inoremap <localleader>Z      ℤ
inoremap <localleader>+-     ±
inoremap <localleader>/=     ≠
inoremap <localleader>t      ⊤
inoremap <localleader>b      ⊥
inoremap <localleader><      〱
inoremap <localleader>plus   +
inoremap <localleader>minus  −
inoremap <localleader>times  ×
inoremap <localleader>and    ⋀
inoremap <localleader>or     ⋁
inoremap <localleader>union  ∪
inoremap <localleader>intersection ∩

inoremap <localleader>up        ↑
inoremap <localleader>right     →
inoremap <localleader>down      ↓
inoremap <localleader>left      ←
inoremap <localleader>leftright ↔
inoremap <localleader>updown    ↕

inoremap <localleader>check   ✔️
inoremap <localleader>uncheck ❌
inoremap <localleader>+1      👍
inoremap <localleader>-1      👎
inoremap <localleader>then    👉
inoremap <localleader>pin     📌
inoremap <localleader>book    📖
inoremap <localleader>;-)     😉
inoremap <localleader>:-)     😄
inoremap <localleader>:-(     😞
inoremap <localleader>love    ❤
inoremap <localleader>poo     💩
inoremap <localleader>qed     ￭
inoremap <localleader>lock    🔒
inoremap <localleader>warning ⚠️
inoremap <localleader>etc     …
