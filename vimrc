" 更新时间：2022-10-03 22:35:21

" 关闭兼容模式
set nocompatible
" 定义快捷键的前缀，即 <Leader>
let mapleader=","

" >>
" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on 
" <<

" >>
" vim 自身（非插件）快捷键

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
let &t_TI = ""
let &t_TE = ""
" >>
" 其他

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmenu

set path+=**

" >>>>
" 插件安装

" vundle 环境设置
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'voldikss/vim-translator'
Plugin 'troydm/zoomwintab.vim'
Plugin 'basilgor/vim-autotags'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'vim-airline/vim-airline'
Plugin 'rhysd/vim-clang-format'
Plugin 'DoxygenToolkit.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}

" 插件列表结束
call vundle#end()

filetype plugin indent on
" <<<<

" 配色方案
set background=dark
colorscheme molokai

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set relativenumber

" 高亮显示当前行/列
" set cursorline
" set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 设置状态栏主题风格
" let g:Powerline_colorscheme='solarized256'

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
" set expandtab
" 设置编辑时制表符占用空格数
" set tabstop=4
" 设置格式化时制表符占用空格数
" set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
" set softtabstop=4

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["vendor"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" >>
" YCM 补全

" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
" 选中项
"highlight PmenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,rust': ['re!\w{2}'],
  \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \            're!\[.*\]\s'],
  \   'ocaml': ['.', '#'],
  \   'cuda,objcpp': ['->', '.', '::'],
  \   'perl': ['->'],
  \   'php': ['->', '::'],
  \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
  \   'ruby': ['.', '::'],
  \   'lua': ['.', ':'],
  \   'erlang': [':'],
  \ }

" " 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
let g:ycm_use_clangd=1
let g:ycm_clangd_binary_path='/home/goodyb/bin/llvm/bin/clangd'
let g:ycm_confirm_extra_conf=0

" " 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_enable_semantic_highlighting = 1

" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_max_diagnostics_to_display = 0

" " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" " 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_auto_trigger=1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_args=['--header-insertion=never']

" <<
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>rn :YcmCompleter RefactorRename
nnoremap <leader>rf :YcmCompleter FixTt<CR>
nnoremap <leader>c :YcmCompleter GoToCallers<CR>
nnoremap <leader>s <Plug>(YCMFindSymbolInWorkspace)
nnoremap <leader>i <Plug>(YCMFindSymbolInDocument)

" << fzf
set rtp+=~/.fzf
nnoremap <leader>a :Ag <C-R><C-W><CR>
nnoremap <leader>f :Files <CR>
nnoremap <leader>m :Marks <CR>
nnoremap <silent> <leader>t <Plug>TranslateW
vnoremap <silent> <leader>t <Plug>TranslateWV
