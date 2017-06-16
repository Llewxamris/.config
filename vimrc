" Title: Vim Configuration File
" Author: Maxwell Haley
" Description: My personal configuration for Vim.
" Built using information I've learnt along the way. Special thanks to the
" following guides:
" - Doug Black's "A Good Vimrc": https://dougblack.io/words/a-good-vimrc.html
" - Jake Zimmerman's "Vim as an IDE": https://github.com/jez/vim-as-an-ide
" - Denis B's "Vim Tips & Tracks":
"       https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" Assumes the following plugins are installed:
" - Vundle
" - Solarized Colour Theme
" - Airline
" - NERDTree + NERDTreeTab
" - Syntastic
" - Easytags + Tagbar
" - delimitMate
" - SuperMan
" - Easymotion
" This file is licensed under UNLICENSE, see UNLICENSE for more details or
" visit http://unlicense.org

" Sorry Vi, going with the big kid on the block
set nocompatible

" Modern encoding for fancy airline fonts
set encoding=utf8

" Enable Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {{{

Plugin 'VundleVim/Vundle.vim'           " Vundle manages itself
Plugin 'tpope/vim-fugitive'             " Git integration
Plugin 'vim-airline/vim-airline'        " Airline Statusbar
Plugin 'vim-airline/vim-airline-themes' " Airline Statusbar Themes
Plugin 'scrooloose/nerdtree'            " Tree-style file explorer
Plugin 'jistr/vim-nerdtree-tabs'        " Tabs for Nerdtree
Plugin 'vim-syntastic/syntastic'        " Better Syntax checking
Plugin 'xolox/vim-easytags'             " Automatic tag generation
Plugin 'xolox/vim-misc'                 " Misc tools for vim-easytags
Plugin 'majutsushi/tagbar'              " Sidebar for tags
Plugin 'Raimondi/delimitMate'           " Autoclosing \"([{
Plugin 'jez/vim-superman'               " Read Manpages in Vim
Plugin 'easymotion/vim-easymotion'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'goldfeld/vim-seek'
Plugin 'airblade/vim-gitgutter'

" End Vundle loading
call vundle#end()

" }}}

" Colours {{{
" Better colours
set t_Co=256

" Enable Syntax highlighting
syntax on

" Enable colourscheme 'Lucius'
colorscheme lucius
LuciusBlackHighContrast

"}}}

" UI {{{
filetype plugin indent on               " Extention specific indenting
set cursorline                          " Highlights the current line
set showcmd                             " Show last entered command
set number                              " Show line numbers
set relativenumber                      " Show line numbers relative to current line
set wildmenu                            " Visual autocompletion for Command mode
set lazyredraw                          " More efficient redrawing
set showmatch                           " Shows matching open/closing symbols
set vb                                  " Disable the bell
set modelines=1                         " Allows modelines to be enabled
set mouse=a                             " Enable mouse support
set breakindent                         " Indent on linebreak
set showbreak=\ \ \ \                   " Use symbols to show the indent
set synmaxcol=200                       " Syntax highlighting stops after col 200
autocmd VimResized * wincmd =           " Auto resize splits
set colorcolumn=80
" Airline {{{
set laststatus=2                                 " Always show status line
let g:airline_detect_paste = 1                   " Detect if in Paste mode
let g:airline#extensions#tabline#enabled = 1     " Enable tabline extention
let g:airline_theme = 'lucius'                   " Use 'Lucius' colour theme
let g:airline_powerline_fonts = 1                " Enable use of patch fonts
let g:airline#extentions#hunks#non_zero_only = 1 " No Hunks plz
" }}}
" NERDTree {{{
" Toggle NERDTree with leader + t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" Do not open NERDTree on startup
let g:nerdtree_tabs_open_on_console_startup=0
" }}}
" Syntastic {{{
hi clear SignColumn                             " Clear SignColumn
let g:syntastic_error_symbol='✘'                " Use custom error symbol
let g:syntastic_warning_symbol = "▲"            " Use custom warning symbol
" }}}
" Easytags/Tagbar {{{
set tags=./tags;~/.vimtags                       " Tag locations
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1                         " Update tags Async
let g:easytags_dynamic_files = 2                 " Dynamically load files
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1        " Suppress warning thrown by ctags

" Toggle with <leader>b
nmap <silent> <leader>b :TagbarToggle<CR>
" }}}
" delimitMate {{{
let delimitMate_expand_cr = 1
augroup delimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType python let b:delimitMate_nesting_quotes   = ['"', "'"]
augroup END
" }}}
" }}}

" Tabs & Spaces {{{
set softtabstop=4 " How many cols used to Tab
set shiftwidth=4  " How many cols indented with reindent
set tabstop=4     " How many cols used visually to Tab
set expandtab     " Use Spaces instead of Tabs
" }}}

" Searching {{{
set incsearch   " Search as characters are entered
set hlsearch    " Highlight all matches
                " Remove search highlight with Leader + Space
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable          " Enable folding
set foldlevelstart=10   " Folds nested blocks of code
set foldnestmax=10      " Cap at 10 fold levels
set foldmethod=indent   " Fold based on indentation level
" }}}

" Movement/Editing {{{
" Disable the arrowkeys
noremap  <up> <nop>
inoremap <up> <nop>

noremap  <down> <nop>
inoremap <down> <nop>

noremap  <left> <nop>
inoremap <left> <nop>

noremap  <right> <nop>
inoremap <right> <nop>

" Set <leader> to the comma key
let mapleader=","

" Move by visual line, not by actual line
nnoremap j gj
nnoremap k gk

" Highlight the last inserted text
nnoremap gV `[v`]

" Toggle Gundo undo tree
noremap <leader>u :GundoToggle<CR>

" Enable autoread and autosave
set autoread
augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END
" }}}

" Tmux Settings {{{
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
" }}}

" JS Libraries {{{
let g:used_javascript_libs='jquery' " Assumes only lib is JQuery
" }}}

" EasyMotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Bind easymotion to 'f'
nmap f <Plug>(easymotion-overwin-f)
nmap F <Plug>(easymotion-overwin-f2)

" Use easymotion smartcase
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

" vim:foldmethod=marker:foldlevel=0
