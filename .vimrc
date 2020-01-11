"
"author : ccoder64
"
set t_Co=256
set nocompatible
set backspace=indent,eol,start
set nobackup
set noundofile
set history=500
set ruler
set showcmd
set mouse=a
set laststatus=2
set hidden
set nowrap
set nocp
set number
set cursorline
set foldmethod=indent
set nofoldenable
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set smartindent
set autowrite
set gcr=a:block-blinkon0
set lcs=tab:>-,trail:-
let mapleader = ";"

set ts=4 sts=4 sw=4
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,chinese,gb18030
set termencoding=utf-8
set ff=unix

filetype off

call plug#begin('~/.vim/plugged')

Plug 'vimscript/a.vim'
Plug 'vimscript/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'fholgado/minibufexpl.vim'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tsaleh/vim-tmux'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline-themes'
Plug 'google/yapf', { 'rtp': 'plugins/vim' }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Plug 'tyru/open-browser.vim'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'SirVer/ultisnips'
" Plug 'fatih/vim-go'
" Plug 'Valloric/YouCompleteMe'

call plug#end()

filetype plugin indent on
syntax enable

if !empty(findfile("colors/Tomorrow-Night.vim", &rtp))
    colorscheme Tomorrow-Night
endif

nmap <F4> @q
nmap <slient> <F8> :WMToggle<cr>
nmap <C-N> :tn<CR>
nmap <leader>ch :A<C>
map <C-]> g<C-]>
vmap <Enter> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap s <Plug>(easymotion-s2)
nmap mm :GitGutterNextHunk<CR>
nmap mn :GitGutterPrevHunk<CR>
nmap mr :GitGutterRevertHunk<CR>
map <F6> :vimgrep <cword> *.cpp *.h<CR>
map <F7> :vimgrep <cword> **/*.h **/*.cpp<CR>
map <C-J> :call yapf#YAPF()<cr>
imap <C-J> <c-o>:call yapf#YAPF()<cr>

let g:airline_theme='bubblegum'
let g:airline#extensions#hunks#enabled = 0
let g:NERDSpaceDelims = 1

augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set ts=4 sts=4 sw=4 expandtab textwidth=0 nowrap
	autocmd FileType c,cpp,h set ts=4 sw=4 sts=4 noexpandtab cinoptions+=g0-N-s
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

command! JsonFormat :execute '%!python -m json.tool'
  \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)), sys.stdin.read()))"'
  \ | :%s/ \+$//ge
  \ | :set ft=javascript
  \ | :1

if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	let g:ctrlp_use_caching = 0
	let g:ackprg = 'ag --vimgrep'
endif

nnoremap <C-G> :Ack<CR>
let g:Lf_ShortcutF = "<C-P>"
