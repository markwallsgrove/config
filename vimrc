" vip              -> select paragraph
" 0                -> go to character 0
" gU               -> selection to uppercase
" gu               -> selection to lowercase
" %                -> find matching bracket
" *                -> highlight current word
" :nohls           -> clear search
"
" wW               -> jump forwards to the start of the word
" eE               -> jump forwards to the end of the word
" bB               -> jump backwards to the start of the word
" ge gE            -> jump backwards to the end of the word
" f*               -> jump foward to a certain character on the line
" F*               -> jump backward to a certain character on the line
" ;                -> repeat last search going fowards
" ,                -> repeat last search going backwards
" t*               -> jump forward before a certain character on the line
" T*               -> jump backward to a certain character on the line
" ?*               -> search backwards with a pattern
" ctrl+o           -> marks file for opening (in ctrln)

" comment out line -> gc
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

" vundle
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on            " required by gocode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'

" lean & mean status/tabline for vim thatś light as air
Plugin 'bling/vim-airline'

" precision colorscheme for the vim text editor
Plugin 'altercation/vim-colors-solarized'
Plugin 'pangloss/vim-javascript'

" A vim plguin which shows a git diff in the gutter (sign column) and stages/reverts hunks
Plugin 'airblade/vim-gitgutter'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular.git'

" Perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'

" vim-snipmate default snippets
Plugin 'honza/vim-snippets'

" interactive command execution in Vim
Plugin 'Shougo/vimproc.vim'

" Go development plugin for Vim
Plugin 'fatih/vim-go'

" Retro groove color scheme for Vim
Plugin 'morhetz/gruvbox'

" Vim plugin for the Perl module / CLI script 'ack'
Plugin 'mileszs/ack.vim'

" Comment stuff out
Plugin 'tpope/vim-commentary'

" True Sublime Text style multiple selections for Vim
Plugin 'terryma/vim-multiple-cursors'

" Identify and Irradicate unwanted whitespace at the end of the line
Plugin 'csexton/trailertrash.vim'

" Lightening fast left-right movement vim
Plugin 'unblevable/quick-scope'

" Asynchronous keyword completion system
Plugin 'Shougo/deoplete.nvim'

" Golang support
Plugin 'zchee/deoplete-go'

" gocode
Plugin 'nsf/gocode', {'rtp': 'vim/'}

" vim-grepper
Plugin 'mhinz/vim-grepper'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" general settings
set relativenumber
set number

set nowrap
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set incsearch
set hlsearch
set ignorecase
set smartcase

set lazyredraw

" ctrlp
nnoremap <c-\> :CtrlP<CR>

" ctrlsf
nmap     <C-f>f <Plug>CtrlSFPrompt

" syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_puppet_checkers = ['puppet', 'puppetlint']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:go_fmt_command = "goimports"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

let g:python_host_prog = '/usr/bin/python2.7'

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

" search for highlighted text: http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>

" get rid of accidental trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" use the system buffer for copy & paste
set clipboard=unnamedplus

" when switching between buffers open a new tab
set switchbuf+=usetab,newtab

" limit line-length to 80 characters by highlighting column 81 onward
set colorcolumn=81
" ... and forcing the cursor onto a new line after 80 characters
set textwidth=80
" however, in git commit messages, let's use 72 columns
autocmd FileType gitcommit set colorcolumn=73
autocmd FileType gitcommit set textwidth=72

echo "  >^.^<  hello"
