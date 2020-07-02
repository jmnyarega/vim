" ################################################################################

" BASIC VIM SETTINGS

" ###############################################################################
filetype on
set nocompatible
set noswapfile

set nobackup
set cmdheight=2
set signcolumn=yes
set nowritebackup

"Set 'tabstop' and 'shiftwidth' to whatever you prefer and use
"'expandtab' This way you will always insert spaces
set tabstop=2 "Number of spaces that a <Tab> in the file counts for"
set shiftwidth=2
set expandtab

set ruler
set backspace=2

set path=;
set wildignore=*.o,*~,*.pyc
set wildmode=list:longest,list:full
set wildmenu
set matchpairs+=<:> "Characters that form pairs"
set autoindent
set cindent
set showbreak=↪
set confirm
" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

set synmaxcol=300 "Will stop highlighting content after 300 cols"
set completeopt="menu, preview" "A comma separated list of options for Insert mode completion"
set copyindent "Copy the structure of the existing lines indent when autoindenting a new line"

set spelllang=en_us
set encoding=utf-8 " String-encoding used internally and for \|RPC\| communication"
set clipboard=unnamed
set ffs=unix,dos,mac
set lazyredraw

set linebreak
set wrap


set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

if has('mouse')
  set mouse=a
endif

set number
set t_Co=256
hi SpellBad ctermbg=red guibg=white
set shortmess+=c

set incsearch
" set nohlsearch
set ignorecase
set smartcase
set showmatch "Note: Use of the short form is rated PG. 😀"
set dictionary=/usr/share/dict/words
highlight ColorColumn ctermbg=white
highlight Comment cterm=italic

set tags=./tags,tags,~/.vim/commontags/*
set autochdir
set autoread "When a file has been detected to have been changed outside of Vim and automatically read it again"
au FocusGained,BufEnter * checktime

set ttyfast

set splitright

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set notimeout
set ttimeout
set timeoutlen=2000
set ttimeoutlen=30

syntime on

set omnifunc=syntaxcomplete#Complete
let g:rainbow_active = 1

if has('gui_running')
    set background=light
else
    set background=dark
endif


" ################################################################################
"
" autoloads and autocommands

" ###############################################################################

au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" ################################################################################

" AIRLINE SETTINGS

" ###############################################################################
" let g:Powerline_symbols='unicode'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:solarized_termcolors=256

syntax enable
set background=dark
colorscheme onedark

" ################################################################################

" SYNTASTIC SETTINGS

" ###############################################################################
set statusline+=%w " shows total numbers of errors & Warnings
let g:syntastic_javascript_checkers = ['eslint']
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:javascript_plugin_ngdoc = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_cursor_column = 0
let g:syntastic_filetype_map = { "jsx": "js" }

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-git',
  \ 'coc-css',
  \ 'coc-html',
  \ ]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
let g:ale_completion_enabled = 1
let g:ale_cpp_ccls_init_options = {
\   'cache': {
\       'directory': '/tmp/ccls/cache'
\   }
\ }

" ################################################################################
" NERDTree VIM SETTINGS

" ###############################################################################
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.aux$', '\.fdb_latexmk$', '\.fls$','\.log', 'node_modules', 'dist', '_generated_', 'out', '\.class$', '\~$', '^\.git$[[dir]]']
let g:notes_directories = ['~/.config/notes']

" Increase tree explorer split a bit (default is 31)
let NERDTreeWinSize=32
" Automatically delete buffer when file is deleted from the tree explorer
let NERDTreeAutoDeleteBuffer=1

" Open and preview in splits
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeMapPreviewSplit="S"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapPreviewVSplit="V"

" Open and preview in current window
let g:NERDTreeMapActivateNode="o"
let g:NERDTreeMapPreview="O"
let g:fzf_layout = { 'down': '~25%' }

let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
      \,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
  " disable background color erase
  set t_ut=
endif

" enable 24 bit color support if supported
if (has("termguicolors"))
  if (!(has("nvim")))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
