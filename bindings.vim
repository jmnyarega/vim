" #################################################################################
" WINDOW SWITCH MAPPING
"
" ###############################################################################
let mapleader = ","
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
nnoremap j gj
nnoremap k gk
noremap <C-m> :SClose <CR>
nnoremap <C-x> :bdelete <CR>
nmap <leader>f :CocCommand prettier.formatFile<cr>

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

function! ToggleNerdTree()
  if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
    :NERDTreeFind
  else
    :NERDTreeToggle
  endif
endfunction

nmap <silent> <leader>n :call ToggleNerdTree()<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

nnoremap <Leader>lt :Ag <CR>
nnoremap <Leader>w :Windows <CR>
command! SearchTerm execute 'Ag ' expand("<cfile>")
map <Leader>ls :vertical wincmd f<CR>
nnoremap <Leader>lu :SearchTerm<CR>
" ################################################################################

" SAVE MAPPINGS

" ###############################################################################
noremap s :w<CR>

" ###############################################################################

" SEARC MAPPINGS

" ###############################################################################"

" Fugitive Conflict Resolution
nnoremap <F2> :Gvdiffsplit!<CR>
nnoremap <F2>2 :diffget //2<CR>
nnoremap <F2>3 :diffget //3<CR>

" ################################################################################

" WINDOW NAVIGATIONS

" ###############################################################################
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap Q :q<CR>

" ################################################################################

" TAB NAVIGATIONS

" ###############################################################################"
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<SPACE>

" ################################################################################

" BUFFER MAPPINGS

" ###############################################################################
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>


" ################################################################################
"
" MOVE FROM FUCTION TO FUCTION
"
" ################################################################################


" ################################################################################

" DISABLE ARROW KEYS MOVEMENT IN NORMAL MODE

" ###############################################################################
no <up> ddkP
no <down> ddp

ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
" ################################################################################

" MISCELLANEOUS

" ###############################################################################
map  <F10> :set rnu! <CR>
map <F6> :setlocal spell!<cr>
autocmd FileType tex map <silent> <F5> :!pdflatex %  <CR>
autocmd FileType javascript map r<F5> :!node % <CR>
autocmd FileType javascript map t<F5> :!yarn test % <CR>
autocmd FileType html map r<F5> :!open % <CR>
autocmd FileType python map r<F5> :!python % <CR>
autocmd FileType java map b<F5> :!javac % <CR>
autocmd FileType java map r<F5> :!java %:r <CR>
autocmd FileType cpp map r<F5> :!./%:r <CR>
autocmd FileType cpp map b<F5> :make %:r <CR>

vnoremap < <gv
vnoremap > >gv

"####################################################################################
"
" SPLITS
"
"####################################################################################

nnoremap <right> :vertical resize -10 <CR>
nnoremap <left> :vertical resize +10 <CR>
nnoremap <Leader>v :vsplit % <CR>
nnoremap <Leader>h :split % <CR>
nnoremap <Leader>t :terminal <CR>
map <Leader>= <c-w>=

let g:fzf_layout = { 'window': { 'width': 1.9, 'height': 0.6 } }
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'FZF' s:find_git_root()
map <C-p> :ProjectFiles <CR>
