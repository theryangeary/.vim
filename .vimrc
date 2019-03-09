" basic settings {{{
set nocompatible " Don't try to be backwards compatible with vi

set path+=** " subfolder fuzzy-file tab completion

set number " show line numbers
set relativenumber " show relative line numbers
set cursorline " show line under cursor

set showcmd " show incomplete commands in bottom bar
set ruler " show cursor coordinates in bottom bar
set laststatus=2 " Always show statusline

" Scream if lines are too long
highlight ColorColumn ctermbg=magenta guibg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set wildmenu " autocomplete by tabbing
set wildignore+=.git
set wildignore+=a.out,*.o
set lazyredraw " don't redraw in the middle of macros
set showmatch " highlight matching [{()}]

set incsearch
set hlsearch

set expandtab
set smarttab
set shiftwidth=2
set tabstop=4
set softtabstop=4

set list
set listchars=tab:\ \ ,extends:❯,precedes:❮
set showbreak=↪

set splitbelow
set splitright

" }}}

" autocommands {{{

"execute "autocmd InsertLeave" g:leader_location ":SortLeaderCommands"

augroup vimrc
  autocmd!
  autocmd InsertLeave * :FixWhitespace " Always strip trailing whitespace

  "autocmd BufWritePost ~/.vimrc :source ~/.vimrc

  autocmd FocusLost * :wa

  autocmd VimResized * exe "normal! \<c-w>="

  autocmd VimEnter * :call airline#add_statusline_func('WindowNumber')
  autocmd VimEnter * :call airline#add_inactive_statusline_func('WindowNumber')
augroup END

augroup cursorlinectl
  autocmd!
  autocmd WinEnter * :set cursorline
  autocmd WinLeave * :set nocursorline
augroup END

augroup ctagsautogenerate
  autocmd!
  autocmd BufWrite *.c,*.cpp,*.h,*.hpp :silent! !ctags -R .
augroup END

" }}}

" basic mappings {{{

nnoremap <Esc> :noh<cr>:echo<cr><Esc>

" escape is too far
inoremap jk <Esc>
inoremap kj <Esc>

" don't move to enter key to finish a command
cnoremap fj <Enter>
cnoremap jf <Enter>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>

" }}}

" leader mappings {{{
let g:leader_location = expand("<sfile>:p")

let mapleader = " "
" leader-begin

" Buffers
nnoremap <leader><TAB> | " Go to previous buffer
nnoremap <leader>bd :bdelete<cr>|
nnoremap <leader>bl :ls<cr>:buffer<space>|

" Emacs
nnoremap <leader><leader><leader> :silent !emacs<cr>

" Files
nnoremap <leader>fe :edit |
nnoremap <leader>ff :find<space>| " Find file
nnoremap <leader>fs :write|
nnoremap <leader>fve :edit ~/.vimrc|
nnoremap <leader>fvs :source ~/.vimrc|
nnoremap <leader>qq :q<cr>|

" Fold
nnoremap <leader>fom :set foldmethod=|

" Git (fugitive, rhubarb)
nnoremap <leader>gb :Gbrowse<cr>| " Open current github project in browser
nnoremap <leader>gd :Gdiff<cr>| " Diff current file
nnoremap <leader>gf :Gpull<cr>| " Open fugitive git status buffer
nnoremap <leader>gp :Gpush<cr>| " Push project to remote
nnoremap <leader>gs :Gstatus<cr>| " Open fugitive git status buffer

" Make
nnoremap <leader>mc :make clean<cr><cr>|
nnoremap <leader>md :make<cr>| " make (default)
nnoremap <leader>sop :source %| " source current file

" NERDTree
nnoremap <leader>nt :NERDTreeToggle| " NERDTreeToggle

" Presenting (slides start with ">$)
"nnoremap <leader>sn nzt|
"nnoremap <leader>sp Nzt|
"nnoremap <leader>ss /">\$<cr>zt| " Select slide marker

" Spelling
nnoremap <leader>sp 1z=

" Tabs
nnoremap <leader><leader>0 10gt
nnoremap <leader><leader>1 1gt
nnoremap <leader><leader>2 2gt
nnoremap <leader><leader>3 3gt
nnoremap <leader><leader>4 4gt
nnoremap <leader><leader>5 5gt
nnoremap <leader><leader>6 6gt
nnoremap <leader><leader>7 7gt
nnoremap <leader><leader>8 8gt
nnoremap <leader><leader>9 9gt
nnoremap <leader>tc :tabc| " close tab
nnoremap <leader>te :tabe| " new tab

" Tags
nnoremap <leader>tg :!ctags -R .<cr><leader>| " Silently generate tags

" Terminal
nnoremap <leader>td :bdelete!| " delete terminal
nnoremap <leader>tt :terminal| " new terminal
tnoremap <leader><Esc> | " prefer this over plain <Esc> for TUI applications
tnoremap <leader><TAB> | " change to prev buffer

" Toggle
nnoremap <leader>tolw :set wrap!<cr>

" Vundle
nnoremap <leader>vap :call VundleAppendPlugin()

" Window
nnoremap <leader>0 :exe 10 . "wincmd w"| " Go to window number 10
nnoremap <leader>1 :exe 1  . "wincmd w"| " Go to window number 1
nnoremap <leader>2 :exe 2  . "wincmd w"| " Go to window number 2
nnoremap <leader>3 :exe 3  . "wincmd w"| " Go to window number 3
nnoremap <leader>4 :exe 4  . "wincmd w"| " Go to window number 4
nnoremap <leader>5 :exe 5  . "wincmd w"| " Go to window number 5
nnoremap <leader>6 :exe 6  . "wincmd w"| " Go to window number 6
nnoremap <leader>7 :exe 7  . "wincmd w"| " Go to window number 7
nnoremap <leader>8 :exe 8  . "wincmd w"| " Go to window number 8
nnoremap <leader>9 :exe 9  . "wincmd w"| " Go to window number 9
nnoremap <leader>w | " Make all window bindings easily available

" leader-end }}}

" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'https://github.com/bronson/vim-trailing-whitespace'
Plugin 'https://github.com/ervandew/supertab'
Plugin 'https://github.com/flazz/vim-colorschemes'
Plugin 'https://github.com/JamshedVesuna/vim-markdown-preview'
Plugin 'https://github.com/qpkorr/vim-renamer'
Plugin 'https://github.com/scrooloose/nerdcommenter'
Plugin 'https://github.com/scrooloose/nerdtree'
Plugin 'https://github.com/sickill/vim-pasta'
Plugin 'https://github.com/terryma/vim-multiple-cursors'
Plugin 'https://github.com/tpope/vim-abolish'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'https://github.com/tpope/vim-rhubarb'
Plugin 'https://github.com/tpope/vim-surround'
Plugin 'https://github.com/Valloric/YouCompleteMe'
Plugin 'https://github.com/vim-airline/vim-airline'
Plugin 'https://github.com/vim-airline/vim-airline-themes'
Plugin 'https://github.com/VundleVim/Vundle.vim'
Plugin 'https://github.com/theryangeary/take-me-to-your-leader'
Plugin 'https://github.com/kassio/neoterm'

call vundle#end()

" }}}

" Post-Vundle stuff {{{
" Config that has to come after Vundle
colorscheme xoria256
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256


" unicode symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''

syntax enable " enable syntax processing
filetype plugin indent on " load filetype-specific indent files

" Nerdtree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim-markdown-preview config
let vim_markdown_preview_github=1

" }}}

" Functions {{{

" Airline statusbar config
function! WindowNumber(...)
  let builder = a:1
  let context = a:2
  call builder.add_section('airline_b', ' %{tabpagewinnr(tabpagenr())} ')
  return 0
endfunction

function! RangedCommand(start, end, command)
  silent! execute a:start . "," . a:end . a:command
endfunction

function! SortVundlePlugins()
  let l:save_view = winsaveview()
  norm gg
  " the 2's are assuming there is a blank line after and begore #begin and #end
  let start_pos = search("vundle\#begin") + 2
  let end_pos = search("vundle\#end") - 2
  " sort in range, case insensitive
  call RangedCommand(start_pos, end_pos, "sort i")
  " restore cursor position
  call winrestview(l:save_view)
endfunction

function! VundleAppendPlugin()
  normal mM
  edit! ~/.vimrc
  normal /Plugin/call\ vundle#end()?Pluginyypci'+
  VundleInstall
  close
  write
  normal `M
endfunction

" }}}

" vim: set fdm=marker:
