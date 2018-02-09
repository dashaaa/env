syntax on

" Autoread !!! usefull in case of using CVS
set ar

" Auto update opened file when it changes externaly
set autoread

" For fast terminals !!!
set ruler
set ttyfast
set showcmd
set incsearch

" Show line numbers 
set number

" Print on one side
set printoptions=duplex:off

"map -      <Up><Up><C-Y><C-Y>
"map =      <Down><Down><C-E><C-E>

" scroll started on 5 lines before screen border
set so=5

" Tab and indent
set tabstop=8
set expandtab
set softtabstop=4
set smartindent
set autoindent
set shiftwidth=4
set shiftround
set nosmarttab
" right tabs in new line
set cindent

set hidden

set laststatus=2
set splitbelow
"autocmd BufEnter * lcd %:p:h
autocmd BufRead *.c,*.h,*.pl,*.asm set tag=./tags,tags,../tags,../../tags,../../../tags,../../../../tags,/usr/include/osipparser2/tags
autocmd BufRead *.pl,*.asm set syntax=perl

" move cursor to Nth window below current one. (CTRL-W j) 
" down
map <C-Down> j
imap <C-Down> j<ESC>
map <C-j> j
imap <C-j> j<ESC>
" up
map <C-Up> k
imap <C-Up> k<ESC>
map <C-k> k
imap <C-k> k<ESC>
" left
map <C-Left> h
imap <C-Left> h<ESC>
map <C-h> h
imap <C-h> h<ESC>
" right
map <C-Right> l
imap <C-Right> l<ESC>
map <C-l> l
imap <C-l> l<ESC>
map - _

" F2 move cursor to Nth window below current one. (CTRL-W j) 
map <F2> j
imap <F2> j

" F1 move cursor to Nth window above current one. (CTRL-W CTRL-K) 
map <F1> 

imap <F1> 
" F2 move cursor to Nth window below current one. (CTRL-W j) 
map <F2> j
imap <F2> j
" F3 decrease current window height by N. (CTRL-W -) 
map <F3> -
imap <F3> -
" F4 increase current window height by N. (CTRL-W +) 
map <F4> +
imap <F4> +
" F5 set in local .vimrc for compiling
" F6 for search and show all results
map <F6> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
imap <F6> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" F7 set in local vimrc for ctags
map <F8> :set hlsearch!<CR>
map <F9> _
imap <F9> _

" open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR> 
map <C-_> :vsplit<CR> <C-W>l:exec("tag ".expand("<cword>"))<CR>

" replace all words in a line (:h gdefault)
set gdefault
set wildignore=*.o

set nohls
set completeopt=
let g:loaded_matchparen=1

set bs=2
set whichwrap=<,>,[,]
set sidescroll=1

" Выключаем перенос строк
set nowrap
" Перенос строк по словам, а не по буквам
set linebreak

autocmd BufRead *.c,*.h ia if_ if ( ){}?if?e+3
autocmd BufRead *.c,*.h ia ife_ if ( ){}else{}?if?e+3
autocmd BufRead *.c,*.h ia {_ {}<End><BS>
autocmd BufRead *.c,*.h ia for_ for (;;){}?for?e+3

" set t_Co=256
" colorscheme desert

" Enables the reading of .vimrc, .exrc and .gvimrc in the current directory. 
set exrc
" When secure on, :autocmd, shell and write commands are not allowed in .vimrc and .exrc in the current directory and map commands are displayed. 
set secure

" Настраиваем переключение раскладок клавиатуры по <C-^>
set keymap=russian-jcukenwin

" Раскладка по умолчанию - английская
set iminsert=0
" Раскладка поиска совпадает с раскладкой ввода (iminsert) 
set imsearch=-1

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

" -->
" Переключение раскладок и индикация выбранной
" в данный момент раскладки.
" Переключение раскладок будет производиться по <C-F>
"
" При английской раскладке статусная строка текущего окна будет синего
" цвета, а при русской - зеленого.

function MyKeyMapHighlight()
if &iminsert == 0
    hi StatusLine ctermfg=Cyan guifg=Cyan
else
    hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
endif
endfunction

" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()

cmap <silent> <C-G> <C-^>
imap <silent> <C-G> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<BS>
nmap <silent> <C-G> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
vmap <silent> <C-G> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
" <--

" set color scheme
syntax enable
"set background=dark
"colorscheme solarized

"set make util
set mp=./asm

" taglist
let Tlist_Use_Right_Window = 1

" pathogen for easy viw plugins setup
execute pathogen#infect()
filetype plugin indent on
