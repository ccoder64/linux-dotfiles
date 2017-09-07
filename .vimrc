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
set expandtab ts=4 sts=4 sw=4
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=usc-bom,utf-8,chinese,gb18030
set termencoding=utf-8
let mapleader = ";"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tyru/open-browser.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
"Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tsaleh/vim-tmux'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'junegunn/vim-easy-align'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'taglist.vim'
Plugin 'a.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
syntax on

if !empty(findfile("colors/Tomorrow-Night.vim", &rtp))
   colorscheme Tomorrow-Night
endif

nmap ga <Plug>(EasyAlign)

augroup vimrcEx
   au!
   autocmd FileType text setlocal textwidth=78
   autocmd FileType python set omnifunc=pythoncomplete#Complete
   autocmd FileType python set noexpandtab

   autocmd BufReadPost *
               \ if line("'\"") > 1 && line("'\"") <= line("$") |
               \   exe "normal! g`\"" |
               \ endif
augroup END

