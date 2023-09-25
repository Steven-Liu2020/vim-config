"""" Enable Plug-Vim: vim plugin manager

call plug#begin('~/.vim/plugged')
"Plug 'itchyny/lightline.vim'
"Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'Yggdroot/indentLine' 
Plug 'preservim/tagbar'
call plug#end()

"""" Basic Behavior

set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
"set statusline+=%F
""set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping
set t_Co=256
set backspace=2         "use backspace to delete character


"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk


"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
colorscheme molokai     " good colorschemes: murphy, slate, molokai, badwolf, solarized

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>


"""" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')


"""" Cursor motion settings

set scrolloff=3
set textwidth=120


"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase


"""" Miscellaneous settings that might be worth enabling

set cursorline         " highlight current line
set cursorcolumn       " highlight current column

set background=dark    " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim
set autochdir          " auto change current work dir base on edit file
 

"""" Auto remove trailing spaces
autocmd BufWritePre *.c,*cpp,*.h,*.s :%s/\s\+$//e
"autocmd BufWrite * if ! &bin | silent ! %s/\s\+$//ge | endif    

"""" Configure taglist
let Tlist_Show_One_File=1        "only show the tags on current file
let Tlist_Exit_OnlyWindow=1      "exit vim when the taglist is the last wind
let Tlist_Auto_Open=0            "auto open Tlist when open vim if set 1
let Tlist_Use_Right_Window = 0   "show tlist window on the right if set 1
let Tlist_Ctags_Cmd="/home/apple/bin/ctags" "set your ctags cmd path
 "alt + l map Tlist open/close
noremap l :Tlist<CR>          

"""" Gutentags settings

" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

let g:rehash268 = 1

cscope add $HOME/workspace/cscope.out "设置你的cscope tag路径
set tags=tags

""" 树形结构 nerdtree
noremap <leader>t :NERDTreeToggle<CR>
"alt + f map
noremap f :NERDTreeFind<CR>

"vim airline
let g:airline#extensions#tabline#enabled = 1  "enabale tabline
nnoremap <C-N> :bn<CR>
nnoremap <C-B> :bp<CR>


"vim indentline
let g:indentLine_enabled = 1			" 使插件生效
let g:indentLine_char = '¦'				" 设置缩进线字符，也可以为 '|', '┆', '┊' 等
let g:indentLine_conceallevel = 2 		" 使插件正常运行

"vim tagbar
nmap <c-u> :TagbarToggle<CR>

"vim fzf config
nnoremap <silent> <c-p> :GFiles<CR>
nnoremap <silent> <Leader>f :Files <CR>
nnoremap <silent> <Leader>l :Lines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>g :Tags<CR>
"nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>


