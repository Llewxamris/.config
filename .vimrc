"Pathogen start
execute pathogen#infect()

"User Preferances
syntax on
filetype plugin indent on
set number
set relativenumber
""TabsToSpaces
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

"Set JavaScript Libraries
let g:used_javascript_libs='jquery'

"Map Ctrl+F to  Beautify
map <c-f> :call JsBeautify()<cr>
autocmd FileType javascript     noremap     <buffer>    <c-f> :call JsBeautify()<cr>
autocmd FileType html           noremap     <buffer>    <c-f> :call HtmlBeautify()<cr>
autocmd FileType css            noremap     <buffer>    <c-f> :call CSSBeautify()<cr>
autocmd FileType javascript     vnoremap    <buffer>    <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html           vnoremap    <buffer>    <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css            vnoremap    <buffer>    <c-f> :call RangeCSSBeautify()<cr>

"Solarized ColourScheme
set background=dark
colorscheme solarized

"EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
