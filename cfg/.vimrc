set backspace=indent,eol,start

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endi

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"let &t_ti.="\e[1 q"
"let &t_SI.="\e[5 q"
"let &t_EI.="\e[1 q"
"let &t_te.="\e[0 q"
set ruler
set is
au BufRead,BufNewFile *.casm,*.cs set filetype=asm

nnoremap zH zt
nnoremap zL zb

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 nosmarttab
noremap p mAp`A
noremap P mAP`A
set mouse=v
set scrolloff=3

set laststatus=2

hi StatusLine term=reverse ctermbg=7 ctermfg=0 gui=bold,reverse

if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=0 ctermfg=1 gui=undercurl
  au InsertLeave * hi StatusLine term=reverse ctermbg=7 ctermfg=0 gui=bold,reverse
endif

set timeoutlen=1000 ttimeoutlen=0

" taglist plugin
nnoremap <silent> <F8> :TlistToggle<CR>
noremap <F9> :make<CR>
let Tlist_WinWidth=50

"autocmd FileType c setlocal foldmethod=syntax
"autocmd VimEnter * norm zR 

:let g:load_doxygen_syntax=1

" persistent lvimrc asking:
set viminfo+=!
let g:localvimrc_persistent=1
let g:localvimrc_sandbox=0

" vimdiff ignore whitespaces:
if &diff
    " diff mode
    set diffopt+=iwhite
endif

nnoremap <silent> [I [I:let nr = input("Item: ")<Bar>if nr != ''<Bar>exe "normal " . nr ."[\t"<Bar>endif<CR>
