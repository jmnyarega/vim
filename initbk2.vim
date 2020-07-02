set runtimepath+=~/.config/nvim/

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/vim-hug-neovim-rpc')
    call dein#add('roxma/nvim-yarp')
  endif

  call dein#add('tpope/vim-surround')
  call dein#add('styled-components/vim-styled-components')
  call dein#add('mattn/emmet-vim')
  call dein#add('mileszs/ack.vim')
  call dein#add('scrooloose/nerdtree', { 'on_cmd': ['NERDTreeToggle'] })
  call dein#add('tomtom/tcomment_vim.git')
  call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}})
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] })
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('elzr/vim-json', { 'for': 'json' })
  let g:vim_json_syntax_conceal = 1
  let g:WebDevIconsOS = 'Darwin'
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:DevIconsEnableFoldersOpenClose = 1
  let g:DevIconsEnableFolderExtensionPatternMatching = 1
  let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
  let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
  let NERDTreeNodeDelimiter = "\u263a" " smiley face
  call dein#add('vim-airline/vim-airline')
  call dein#add('https://github.com/joshdick/onedark.vim.git')
  call dein#add('https://github.com/sheerun/vim-polyglot.git')
  call dein#add('neoclide/coc.nvim', {'merged':0, 'build': 'yarn install --frozen-lockfile'}, {'on_i': 1})
  call dein#add('moll/vim-node')
  call dein#add('tpope/vim-fugitive' , { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', 'Gcd', 'Gvdiffsplit!', 'Ggrep', 'Glcd' ] })
  call dein#add('https://github.com/xolox/vim-notes', { 'on_cmd' : [
        \ 'SearchNotes',
        \ 'Note',
        \ 'DeleteNote',
        \ 'RelatedNotes',
        \ 'NoteFromSelectedText',
        \ 'SplitNoteFromSelectedText',
        \ 'TabNoteFromSelectedText',
        \ 'MostRecentNote',
        \ 'ShowTaggedNotes',
        \ 'IndexTaggedNotes',
        \ 'NoteToHtml',
        \ 'NoteToMarkdown',
        \ 'NoteToMediawiki' ] })
  call dein#add('xolox/vim-misc')
  call dein#end()
  call dein#save_state()
endif

runtime bindings.vim
runtime settings.vim
