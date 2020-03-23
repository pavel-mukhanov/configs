let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-twilight

set nocompatible

"Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in lower right corner.
set ruler

"Want a different map leader than \
let mapleader = ","

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

"Switch between buffers without saving
set hidden

"clear selection
nnoremap <cr> :noh<CR><CR>:<backspace>

"Set font type and size. Depends on the resolution. Larger screens, prefer h20
"set guifont=Menlo:h14

"Tab stuff
set tabstop=3
set shiftwidth=3
set softtabstop=3

"Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number
set relativenumber

"Allows to change cursor position by mouse click
" set mouse=a
set mouse=

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

" case insensitive search
set ignorecase
set smartcase

set showmatch " show matching brackets

" print empty <a> tag

" standatr copy and paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

if $VIM_CRONTAB == "true"
set nobackup
set nowritebackup
endif

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <C-;> <Plug>(easymotion-bd-f)
nmap  <C-;> <Plug>(easymotion-overwin-f)

" Split tab below current
set splitbelow

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;‘zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\“ZXCVBNM<>
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" works only for OS X
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  set clipboard^=unnamed
  set clipboard^=unnamedplus"
endif

call plug#begin('~/.vim/plugged')
Plug 'herrbischoff/cobalt2.vim'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'raichoo/purescript-vim'
Plug 'easymotion/vim-easymotion'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim' 
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'aklt/plantuml-syntax'
Plug 'scrooloose/vim-slumlord'
Plug 'axvr/photon.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'mbbill/undotree'
Plug 'takac/vim-hardtime'
Plug 'majutsushi/tagbar'
Plug 'wakatime/vim-wakatime'
Plug 'chriskempson/base16-vim'
Plug 'udalov/kotlin-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'altercation/vim-colors-solarized'
Plug 'dense-analysis/ale'
Plug 'vifm/vifm.vim'
call plug#end()

" RUST
autocmd BufReadPost *.rs setlocal filetype=rust

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1
let g:rustfmt_autosave = 0
let g:LanguageClient_loggingLevel = 'DEBUG'

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
nnoremap <silent> <D-o> :call LanguageClient_workspace_symbol() <CR>
nnoremap <silent> <D-b> :call LanguageClient_textDocument_references() <CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <D-d> :call LanguageClient#debugInfo() <CR> 
noremap <silent> S :call LanguageClient_textDocument_documentSymbol()<CR>

" au FileType rust nmap gd <Plug>(rust-def)

" vim wiki:
let g:vimwiki_list = [{'path': '~/Dropbox/notes', 'syntax': 'markdown'}, {'path': '~/Dropbox/notes/diary/'}]

" NERDTree
map <D-1> :NERDTreeToggle<CR>
map <D-l> :NERDTreeFind<CR>

" Vim hardtime
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 0
let g:hardtime_timeout = 1000
let g:hardtime_showmsg = 1

" Tagbar
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nmap <D-2> :TagbarToggle<CR>

" Fzf
set rtp+=/usr/local/bin/fzf
set wildignore+=*.class
set wildignore+=*/target/*,target/*
set wildignore+=*/node_modules/*
nmap <D-p> :Files<CR>
nmap <D-e> :Buffers<CR>
nmap <D-[> :Buffers<CR>

" let g:ag_working_path_mode="r"
nnoremap \  :Ag<space>

" Vim fugitive
set diffopt+=vertical

" Haskell related
nnoremap <Leader>th :sp<CR>:term<CR>:set syntax=haskell<CR><C-W>J:resize 8<CR>ighcid -c "stack ghci main.hs" -T "main"<CR>
