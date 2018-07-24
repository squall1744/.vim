" 基本设置
set number
set hls

"语法高亮
syntax on
syntax enable

" 缩进设置
set shiftwidth=2                " 设置格式化时代码缩进为2个空格
set tabstop=2                   " tab键缩进为4格子
set expandtab                   " tab键转换为空格
set smartindent                 " 智能缩进
set incsearch                   " 开启实时搜索功能
set ignorecase                  " 搜索时大小写不敏感
set wildmenu                    " vim 自身命令行模式智能补全
let mapleader="\<Space>"

" 代码折叠
set nofoldenable
"set foldmethod=indent
set foldmethod=syntax

" 主题设置
set background=dark
colorscheme solarized

set nocompatible              " be iMproved, required

" vim-plug
call plug#begin('~/.vim/bundle')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe'
" Plug 'vim-syntastic/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

call plug#end()

" NERDTree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" 关闭NERDTree快捷键
" map <leader>t :NERDTreeToggle<CR>
" 显示行号
" let NERDTreeShowLineNumbers=1
" let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<CR>

" airline
"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Exuberant ctags
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1

" Syntastics
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
let g:tagbar_type_javascript = {
      \ 'ctagsbin' : 'jsctags'
      \ }
" let g:tagbar_type_typescript = {
"   \ 'ctagsbin' : 'tstags',
"  \ 'ctagsargs' : '-f-',
"  \ 'kinds': [
"   \ 'e:enums:0:1',
"  \ 'f:function:0:1',
"  \ 't:typealias:0:1',
"  \ 'M:Module:0:1',
"  \ 'I:import:0:1',
"  \ 'i:interface:0:1',
"  \ 'C:class:0:1',
"  \ 'm:method:0:1',
"  \ 'p:property:0:1',
"  \ 'v:variable:0:1',
"  \ 'c:const:0:1',
"  \ ],
"  \ 'sort' : 0
" \ }
let g:tagbar_type_typescript = {
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
      \ 'c:classes',
      \ 'n:modules',
      \ 'f:functions',
      \ 'v:variables',
      \ 'v:varlambdas',
      \ 'm:members',
      \ 'i:interfaces',
      \ 'e:enums',
      \ ]
      \ }

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
 let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"ctrlp
let g:ctrlp_show_hidden=1 "显示隐藏文件
" 忽略一下文件类型
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" autoformat
noremap <F3> :Autoformat<CR>

" vim-indentline
let g:indentLine_color_term = 239 "对齐线颜色
" let g:indentLine_char = 'c' "对齐线符号, c表示任意ASCII码字符, 你还可以用下面这几个符号之一:  ¦, ┆, │, ⎸, 或 ▏  

" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
" let g:ale_lint_on_enter = 0

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\   'javascript': ['eslint'],
\}
" }}}

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
