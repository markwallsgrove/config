execute pathogen#infect()

" wW               -> jump forwards to the start of the word
" eE               -> jump forwards to the end of the word
" bB               -> jump backwards to the start of the word
" ge gE            -> jump backwards to the end of the word
" f*               -> jump foward to a certain character on the line
" F*               -> jump backward to a certain character on the line
" t*               -> jump forward before a certain character on the line
" T*               -> jump backward to a certain character on the line
" ?*               -> search backwards with a pattern

" find file        -> ctrl+\
" comment line     -> \ci
" change ' to <p>  -> cs'<q>
" remove <p> to '  -> cst'
" remove '         -> ds'
" alignment        -> Tabularize/=
" rename           -> :rename newname
" gitk on text     -> :gitv!
" gitk global      -> :gitv
" file browser     -> :VimFiler
" paste into vim   -> :set paste, set nopaste
" split horizontal -> :split
" split vertical   -> :vsplit
" format json      -> :%!python -mjson.tool

" general settings
set number
set nowrap
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch

" ctrlp
nnoremap <c-\> :CtrlP<CR>

" ctrlsf
nmap     <C-f>f <Plug>CtrlSFPrompt

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_javascript_jshint_args = '--config '. $HOME .'/.jshintrc'
let g:syntastic_puppet_checkers = ['puppet', 'puppetlint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme gruvbox

" VimFiler
let g:vimfiler_as_default_explorer = 1

" dwm
nnoremap <A-SJ> <A-SW>w
nnoremap <A-SK> <A-SW>W
nmap <A-S,> <Plug>DWMRotateCounterclockwise
nmap <A-S.> <Plug>DWMRotateClockwise
nmap <A-SN> <Plug>DWMNew
nmap <A-SC> <Plug>DWMClose
nmap <A-S@> <Plug>DWMFocus
nmap <A-SSpace> <Plug>DWMFocus
nmap <A-SL> <Plug>DWMGrowMaster
nmap <A-SH> <Plug>DWMShrinkMaster

" airline
let g:airline#extensions#tabline#enabled = 1

" tidy json
command! -range -nargs=0 -bar Tidyjson <line1>,<line2>!python -m json.tool

" puppet
let g:puppet_align_hashes = 0
