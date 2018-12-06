"
"author : git@liuyue.me
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
set wrap
set nocp
set number
set cursorline
set foldmethod=indent
set foldmethod=syntax
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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
"Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
"Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tsaleh/vim-tmux'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'taglist.vim'
Plugin 'a.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/cpp.vim--Skvirsky'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'fatih/vim-go'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()
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

let g:airline_theme='bubblegum'
let g:airline#extensions#hunks#enabled = 0

augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set ts=4 sts=4 sw=4 expandtab
	autocmd FileType python set textwidth=79 nowrap
	autocmd FileType c,cpp,h set ts=4 sw=4 sts=4 noexpandtab
	autocmd FileType c,cpp,h set cinoptions+=g0-N-s
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

