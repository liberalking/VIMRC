set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line


"----------------------以下配置的插件来源于网络第三方--------- "
" YouCompleteMe:语句补全插件
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	    " 离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"      " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"
Plugin 'vim-airline/vim-airline'
"vim-airline配置:优化vim界面"
"let g:airline#extensions#tabline#enabled = 1
" airline设置
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" vim-scripts 中的插件 "
Plugin 'taglist.vim'
"ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25

Plugin 'The-NERD-tree'
"NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25 

Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
"
" 非 github 仓库的插件"
" Plugin 'git://git.wincent.com/command-t.git'
" 本地仓库的插件 "
"------------------------------------------------------------"

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-------------------------------------------------------------------------------

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

func SetTitle() 
"	> File Name:.vimrc
"	> Author: amoscykl
"	> Mail: amoscykl@163.com
"	> CreatedTime:Tue 11 Feb 2025 04:52:49 PM CST
"************************************************************************/"

if &filetype == 'sh' 
	call setline(1,"##########################################################################") 
	call append(line("."), "# File Name: ".expand("%")) 
	call append(line(".")+1, "# Author: amoscykl") 
	call append(line(".")+2, "# mail: amoscykl980629@163.com") 
	call append(line(".")+3, "# Created Time: ".strftime("%c")) 
	call append(line(".")+4,"#########################################################################") 
	call append(line(".")+5, "#!/bin/zsh")
	call append(line(".")+6,"PATH=/home/edison/bin:/home/edison/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/work/tools/gcc-3.4.5-glibc-2.3.6/bin")
	call append(line(".")+7, "export PATH")
	call append(line(".")+8, "")
else 
	call setline(1,"/*************************************************************************") 
	call append(line("."), "> FileName: ".expand("%")) 
	call append(line(".")+1,"> Author: FuNing Wang") 
	call append(line(".")+2,"> Mail: 422565640@qq..com") 
	call append(line(".")+3,"> CreatedTime:". strftime("%c")) 
	call append(line(".")+4,"*************************************************************************/") 
	call append(line(".")+5,"")
endif
if &filetype == 'cpp'
	call append(line(".")+6,"#include <iostream>")
	call append(line(".")+7,"using namespace std;")
	call append(line(".")+8,"")
endif
if &filetype == 'c'
	call append(line(".")+6,"#include <stdio.h>")
	call append(line(".")+7,"")
endif
if &filetype == 'java'
	call append(line(".")+6,"public class".expand("%"))
	call append(line(".")+7,"")
endif
autocmd BufNewFile * normal G
endfunc
"-----------------------------------------------------------------------------

"interface configuration
"vim program install dirtory:usr/share/vim/vim74

colorscheme evening
syntax enable
syntax on
  
set ignorecase		"Ignore captial letter during search
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set number
set hlsearch
set background=dark
hi Normal	ctermbg=black
hi Search 	cterm=bold	ctermfg=7	ctermbg=2
hi Visual	ctermbg=2
hi LineNr	cterm=bold	ctermfg=7
set cursorline cursorcolumn
hi CursorLine	cterm=bold	ctermfg=7	ctermbg=236
hi CursorLineNr	cterm=bold	ctermfg=7	ctermbg=236
hi CursorColumn	cterm=bold	ctermfg=7	ctermbg=236

" Set cursor shape and color
if &term =~ "xterm"
	let &t_SI = "\<Esc>[1 q" . "\<Esc>]12;orange\x7"			"insert mode
"	let &t_SR = "\<Esc>[3 q" . "\<Esc>]12;white\x7"			"replace mode
	let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;00/FF/00\x7"			"normal mode
endif
" 0 -> blinking block
" 1 -> blinking block(default)  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线
