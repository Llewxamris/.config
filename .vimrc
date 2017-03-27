" Used alongside vim-sensible.
" Sorry Vi, going with the big kid on the block
set nocompatible
" Enable the Pathogen to spread
execute pathogen#infect()

" Colours {{{
syntax on                       " Enable syntax colourization
set background=dark             " Use solarized 'Dark' version
colorscheme solarized           " Enable colourscheme 'Solarized'
"}}}

" UI {{{
filetype plugin indent on   " Extention specific indenting
set cursorline              " Highlights the current line
set showcmd                 " Show last entered command
set number                  " Show line numbers
set relativenumber          " Show line numbers relative to current line
set wildmenu                " Visual autocompletion for Command mode
set lazyredraw              " More efficient redrawing
set showmatch               " Shows matching open/closing symbols
set vb                      " Disable the bell
set modelines=1
set mouse=a
noremap K :Superman <cword><CR>
" Airline {{{
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline#extentions#hunks#non_zero_only = 1
" }}}za
" NERDTree {{{
" Toggle NERDTree with leader + t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1 " Open NERDTree on startup
" }}}
" Syntastic {{{
hi clear SignColumn
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol = "▲"
augroup Syntastic
    au!
    au FileType tex let b:syntastic_mode = 'passive'
augroup END
" }}}
" Easytags/Tagbar {{{
set tags=./tags;~/.vimtags "Tag locations
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
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
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
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
let mapleader=","   " Set <leader> to the comma key
                    " Move by visual line, not by actual line
                    " Highlight the last inserted text
                    " Toggle Gundo undo tree
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
nnoremap <leader>u :GundoToggle<CR>
" }}}

" Tmux Settings {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" JS Libraries {{{
let g:used_javascript_libs='jquery'
" }}}

" Beautify {{{
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript     noremap     <buffer>    <c-f> :call JsBeautify()<cr>
autocmd FileType html           noremap     <buffer>    <c-f> :call HtmlBeautify()<cr>
autocmd FileType php            noremap     <buffer>    <c-f> :call HtmlBeautify()<cr>
autocmd FileType css            noremap     <buffer>    <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript     vnoremap    <buffer>    <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html           vnoremap    <buffer>    <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType php            vnoremap    <buffer>    <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css            vnoremap    <buffer>    <c-f> :call RangeCSSBeautify()<cr>
" }}}

" EasyMotion {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" }}}

" vim:foldmethod=marker:foldlevel=0
