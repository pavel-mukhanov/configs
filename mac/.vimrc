call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'preservim/nerdcommenter'
Plug 'ayu-theme/ayu-vim'
Plug 'elzr/vim-json'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'lervag/vimtex'
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
let base16colorspace=256
let ayucolor="mirage"
colorscheme ayu

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


" au FileType rust nmap gd <Plug>(rust-def)

" coc
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)
" /end coc

autocmd BufReadPost *.java setlocal filetype=java
let java_highlight_functions = 1
let java_highlight_all = 1

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

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

 "NERd commenter
nmap <D-/> :call NERDComment(0, 'Toggle')<CR>

" semshi
g:semshi#filetypes ['python']

" deoplete
let g:deoplete#auto_complete_delay = 100

