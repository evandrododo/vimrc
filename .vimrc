" ---------------------- USABILITY CONFIGURATION ----------------------
"
"  Basic and pretty much needed settings to provide a solid base for
"  source code editting

" don't make vim compatible with vi 
set nocompatible

" turn on syntax highlighting
syntax on
colorscheme dracula
" and show line numbers
set number

" ---------------------- PLUGIN CONFIGURATION ----------------------
" initiate vim-plug
call plug#begin('~/.vim/bundle')
" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" start plugin defintion
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'itchyny/lightline.vim'      
Plug 'Lokaltog/vim-easymotion'    
Plug 'tpope/vim-surround'         
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'moll/vim-bbye'       
Plug 'Raimondi/delimitMate'
Plug 'kien/ctrlp.vim'       
Plug 'Shougo/deoplete.nvim'
" -- Web Development
Plug 'othree/html5.vim'
Plug 'Shutnik/jshint2.vim'        
Plug 'mattn/emmet-vim'            
Plug 'groenewege/vim-less'        
Plug 'skammer/vim-css-color'      
Plug 'hail2u/vim-css3-syntax'     
Plug 'pangloss/vim-javascript'
Plug 'shawncplus/phpcomplete.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'

" -- Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" -- Eye Candy 
Plug 'ryanoasis/vim-devicons'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" end plugin definition
call plug#end() 

let $TERM = "xterm-256color"
set t_Co=256

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim
set autoread         

" encoding is utf 8
set fileencoding=utf8

" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" by default, in insert mode backspace won't delete over line breaks, or 
" automatically-inserted indentation, let's change that
" NeoVim adiciona automaticamente
" set backspace=indent,eol,start

" dont't unload buffers when they are abandoned, instead stay in the
" background
set hidden

" set case insensitive por padrão
set smartcase

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new
" buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other
" non-typed comments
set lazyredraw

" Ativa o fold 
set foldenable
set foldcolumn=4
set foldmethod=syntax
set foldlevelstart=3
nnoremap <space> za

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Move através da linha visivel
nnoremap j gj
nnoremap k gk

" save session
nnoremap <leader>s :mksession<CR>

let javaScript_fold=1         " JavaScript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

" ---------------------- CUSTOMIZATION ----------------------
"  The following are some extra mappings/configs to enhance my personal
"  VIM experience

" set , as mapleader
let mapleader = ","


" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

function SwitchBuffer()
    b#
endfunction

nmap <Tab> :call SwitchBuffer()<CR>

" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

set clipboard=unnamedplus

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" hide unnecessary gui in gVim
if has("gui_running")
    set guioptions-=m  " remove menu bar
    set guioptions-=T  " remove toolbar
    set guioptions-=r  " remove right-hand scroll bar
    set guioptions-=L  " remove left-hand scroll bar
end

" Set font Inconsolata com Powerline e ícones  
set guifont=Inconsolata\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Plus\ Font\ Awesome\ Plus\ Octicons\ 12

" allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 

" remove the .ext~ files, but not the swapfiles
set nobackup
set writebackup
set noswapfile

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default
" use ESC to remove search higlight
"nnoremap <esc> :noh<return><esc>

" most of the time I should use ` instead of ' but typing it with my keyabord
" is a pain, so just toggle them
nnoremap ' `
nnoremap ` '

" suggestion for normal mode commands
set wildmode=list:longest

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces

" no lines longer than 80 cols
set textwidth=80

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
"   .twig files use html syntax
autocmd BufNewFile,BufRead *.twig setlocal ft=html
"   .less files use less syntax
autocmd BufNewFile,BufRead *.less setlocal ft=less
"   .jade files use jade syntax
autocmd BufNewFile,BufRead *.jade setlocal ft=jade

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>


" Personaliza a lightline
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" -- Personaliza o airline
let g:airline_theme='bubblegum'

let g:airline_powerline_fonts = 1
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

noremap <C-Q> :Bdelete<cr>

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" start NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
"autocmd VimEnter * wincmd v

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" use zencoding with <C-E>
let g:user_emmet_leader_key = '<c-e>'

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
" autocmd BufWritePost *.js silent :JSHint


" " Seção para neocomplete
" "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 
" " Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }
" 
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" 
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" 
" 
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" " Close popup by <Space>
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" 
" " Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" 
" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
