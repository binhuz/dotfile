set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

behave mswin

syntax enable
syntax on
filetype on
filetype plugin on
filetype indent on
color molokai

set nu
set autoindent
set cindent
set smartindent
set autochdir
set ignorecase
set smarttab
set showmatch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
set guifont=Consolas:h10:cANSI
set guitablabel=%M%t
set incsearch
set hlsearch
set history=600

set nobackup 
"set noswapfile
set fenc=chinese
set encoding=utf-8
set fileencoding=chinese
set fileencodings=utf-8,gbk,gb312,big5,latin1
language messages zh_CN.utf-8

let mapleader=","

inoremap ( ()<Esc>i
inoremap ) <C-r>=ClosePair(')')<CR>
inoremap { {<CR>}<Esc>O
inoremap } <C-r>=ClosePair('}')<CR>
inoremap [ []<Esc>i
inoremap ] <C-r>=ClosePair(']')<CR>
inoremap " ""<Esc>i
inoremap ' ''<Esc>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction


imap <C-h> <Esc>i
imap <C-j> <Esc>ja
imap <C-k> <Esc>ka
imap <C-l> <Esc>la
imap <C-w> <Esc>A
imap <C-o> <CR><Esc>ko

map <C-Tab> gt
map <C-S-Tab> gT
inoremap <C-Tab> <Esc>gt
inoremap <C-S-Tab> <Esc>gT
map <F1> :tabnew .<CR>
nmap <Tab> V>
nmap <S-Tab> V<
nmap <Leader>m :%s///gn<CR>
nmap n nzz
nmap N Nzz
nnoremap G Gzz
nnoremap <Leader>li :tabe $MYVIMRC <CR>
nnoremap <leader>ll :call LoadSession()<CR>

vmap <Tab> >gv
vmap <S-Tab> <gv

"ctags
"ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q *
set tags=tags;


"taglist plugin
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1 
map <F2> :TlistToggle<CR>

"OmniComplete
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1 " autocomplete with .
let OmniCpp_MayCompleteArrow=1 " autocomplete with ->
let OmniCpp_MayCompleteScope=1 " autocomplete with ::
let OmniCpp_SelectFirstItem=2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch=2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr=1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]


"session
function! SaveSession()
	set sessionoptions+=slash
	mksession! $VIM/_s
endf

function! LoadSession()
	let b:sessionFile = $VIM . "\\_s"
	if(filereadable(b:sessionFile))
		exec 'source' b:sessionFile
	endif
endf

au! VimLeave * :call SaveSession()
au! bufwritepost  $MYVIMRC source $MYVIMRC  

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim



