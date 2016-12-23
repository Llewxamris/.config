" Enable the Pathogen to spread
execute pathogen#infect()

" Colours {{{
syntax on                       " Enable syntax colourization
colorscheme badwolf             " Enable colourscheme 'Badwolf'
let g:badwolf_darkgutter = 1    " Use Badwolfs darker gutter
let g:badwolf_css_props_highlight = 1
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

" Functions {{{ 
function! StripTrailingWhitespaces()
    "save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
