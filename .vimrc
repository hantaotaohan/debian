" ================================================================================================================================
"                                                                                                                                 
"                                                             VIMRC                                                            
"                                                                                                                                                                                                 
"                                                       Update: 2023.01.06                                                      
"                                                                                                                                 
" ================================================================================================================================

" ================================================================================================================================
"                                                       GENERAL - Settings
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                Disable Vim Distribution Plugins
" --------------------------------------------------------------o----------------------------------------------------------------o

let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_matchit           = 1
let g:loaded_2html_plugin      = 1
let g:loaded_logiPat           = 1
let g:loaded_rrhelper          = 1
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_rrhelper          = 1
let g:no_mail_maps             = 1
let g:no_status_line           = 1
" let g:loaded_matchparen        = 1

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                     Vim Disable Compatible
" --------------------------------------------------------------o----------------------------------------------------------------o

if &compatible
    set nocompatible
endif

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                  Enables Syntax HighLighting
" --------------------------------------------------------------o----------------------------------------------------------------o

if has("syntax")
    syntax on         " 开启颜色高亮
    syntax enable     " 开启语法高亮
endif

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                        History Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set history=2000      " 保存历史记录行数

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                        Timeing Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set timeout ttimeout  " 开启超时功能
set timeoutlen=500    " 映射超时
set ttimeoutlen=10    " 按键密码超时
set updatetime=400    " 空闲时间以写入交换并触发CursorHold
set redrawtime=20000  " 重画屏幕以毫秒计的时间

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                       Searching Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set ignorecase        " 搜索模式里忽略大小写
set smartcase         " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
set infercase         " 补全模式忽略大小写
set incsearch         " 查找输入时动态增量显示查找结果
set wrapscan          " 开启循环搜索

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                   Auto BreakIndent Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set textwidth=80      " 插入文本的最大宽度
set tabstop=4         " 设置制表符键的宽度
set expandtab         " 将制表符转换为空格
set shiftwidth=4      " 换行时自动缩进宽度,可更改(宽度同tabstop)
set softtabstop=-1    " 自动与shiftwidth保持同步
set autoindent        " 换行时候代码自动缩进
set nosmartindent     " 启用智能对齐方式
set smarttab          " 指定按一次backspace就删除shiftwidth宽度
set shiftround        " 将缩进舍入为shiftwidth的倍数
set breakindent       " 回绕行保持视觉上的缩进

" Breakindent的扩展设定, min:保留最小的文本宽度, shift:回绕行的开始出右移指定数目的字符
if exists('&breakindent')
    set breakindentopt=shift:4,min:20
endif

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                       Clipborad Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

if has('clipboard') && has('vim_starting') && has('unnamedplus')
    set clipboard& clipboard^=unnamed,unnamedplus 
endif

xnoremap p "_dP

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                       Complete Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set complete=.,w,b,k                                                       " 补全设置
set completeopt=menuone,menu,longest,preview                               " 自动补全

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                     Vim Behavior Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

filetype on                                                                " 启用文件类型侦测
filetype plugin on                                                         " 针对不同的文件类型加载对应的插件
filetype plugin indent on                                                  " 开启插件的同时启用缩进

set encoding=utf-8                                                         " Vim 内部使用的字符编码方式
set fileencoding=utf-8                                                     " 打开文件的字符编码
set fileencodings=utf-8,cp936,gb18030,big5,latin1                          " 探测即将打开的文件的字符编码

set nowrap                                                                 " 设置不自动换行
set linebreak                                                              " 在breakat设定的字符上换行
set breakat=\ \	;:,!?                                                      " 换行符号设置
set showbreak=↳                                                            " 设置换行符号

set backspace=indent,eol,start                                             " 删除键行为

set formatoptions+=j                                                       " 合并两行中文时，不在中间加空格
set fileformats=unix,dos,mac                                               " 文件换行符，默认使用 unix 换行符

set tags=./.tags;,.tags                                                    " 设置TAGS
set viminfo='100,<50,s10,h,n~/.vim/cache/.viminfo                          " 设置VIMINFO

set hidden                                                                 " 针对buffer不保存即可切换
set esckeys                                                                " 按Esc并立即退出插入模式
set ttyfast                                                                " 刷新更快
set modeline                                                               " 设置行模式用于在文件末尾添加特定字符检测vim文件类型
set autoread                                                               " 当文件在外部被修改，自动更新该文件
set writebackup                                                            " 保存文件前建立备份，保存成功后删除该备份
set winaltkeys=no                                                          " Windows 禁用 ALT 操作菜单（使得 ALT 可以用到 Vim里）
set regexpengine=1                                                         " 匹配模式 0:默认, 1:老版本, 2:新版本
" set lazyredraw                                                           " 延迟绘制（提升性能）
" set ttyscroll=3                                                          " 鼠标滚轮速度


" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                       Editor UI Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

set notitle                                                                " 无标题模式
set shortmess=aoOTI                                                        " 避免文字信息提示

set showcmd                                                                " 显示命令
set cmdheight=1                                                            " 设置命令行的高度为2，默认为1

set noruler                                                                " 右下角不显示光标位置
set noshowmode                                                             " 任务栏不显示状态
set laststatus=2                                                           " 启用状态栏信息
set showtabline=2                                                          " 永远显示标签页

set splitbelow                                                             " 如果水平拆分, 默认在下面
set splitright                                                             " 如果垂直拆分, 默认在右边

set cursorline                                                             " 突出显示当前行
set scrolloff=6                                                            " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=6                                                        " 光标左右两侧最少保留的屏幕行数

set number                                                                 " 显示行号
set relativenumber                                                         " 显示相对行号
set signcolumn=yes

set pumheight=15                                                           " 弹出窗口高度
set helpheight=12                                                          " 帮助文件最小高度
set previewheight=12                                                       " 预览窗口高度

set hlsearch                                                               " 高亮搜索的关键字
set wildmenu                                                               " 允许下方显示目录
set showmatch                                                              " 匹配模式,括号匹配
set helplang=cn                                                            " 帮助文件语言
set matchtime=2                                                            " 显示括号匹配的时间
set ambiwidth=single                                                       " 设置为双字宽显示默认值double
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m                                " 错误格式
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<                        " 设置分隔符可视

set fillchars=fold:\─
set fillchars+=vert:\│
set diffopt=filler,internal,algorithm:histogram,indent-heuristic,vertical  " 更新diff配置

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                         Fold Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

if has('folding') && has('vim_starting')
    set foldenable
    set foldmethod=manual                                                  " 启用手动折叠
    set foldcolumn=2                                                       " 侧边栏宽度
    set foldlevel=0                                                        " 设置折层所有内容
    set foldnestmax=1                                                      " 设置 indent 和 syntax 方法的最大折叠嵌套层数
    set foldtext=fold#NeatFoldText()
    " set foldclose=all                                                      " 设置为折叠自动关闭
    " set foldopen=all                                                       " 设置为折叠自动打开
endif

" 空格打开关闭折叠视图(在光标自动打开关闭折叠的情况下)
" nnoremap <expr> <Space> &foldlevel ? 'zM' :'zR'                            

" 空格打开关闭折叠视图
vnoremap <Space> zf                                                        

" " 空格打开关闭折叠视图(在不自动打开关闭折叠的情况下)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>           

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                 Vim Directories Path Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~').'/.vim') " 设置 Vim 主目录
set undofile                                                               " 开启撤销功能
set nobackup                                                               " 设置无备份文件
set noswapfile                                                             " 设置无临时文件
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp               " 设置撤销文件目录
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp            " 设置备份文件目录
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp             " 设置临时文件目录
set viewdir=$DATA_PATH/view/                                               " 设置视图文件目录
set viewoptions=folds,cursor,curdir,slash,unix                             " 设置视图文件功能

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                       Wildmenu Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

if has('wildmenu')
    set wildignorecase
    set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
    set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
    set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
    set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
    set wildignore+=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib 
    set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
    set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz 
    set wildignore+=*DS_Store*,*.ipch
    set wildignore+=*.gem
    set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
    set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
    set wildignore+=*/.nx/**,*.app,*.git,.git
    set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
    set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
    set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
    set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
    set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
    set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
    set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
    set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
endif

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                     Sudo User Salf Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

" 设置指定文件夹或文件不能撤销文件
augroup user_persistent_undo
    autocmd!
    au BufWritePre /tmp/*          setlocal noundofile
    au BufWritePre COMMIT_EDITMSG  setlocal noundofile
    au BufWritePre MERGE_MSG       setlocal noundofile
    au BufWritePre *.tmp           setlocal noundofile
    au BufWritePre *.bak           setlocal noundofile
augroup END

" 如果不是管理员就不开启撤销及相关功能
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
    \ && $HOME !=# expand('~'.$USER, 1)
    \ && $HOME ==# expand('~'.$SUDO_USER, 1)
    set noswapfile
    set nobackup
    set nowritebackup
    set noundofile
endif

" 取消对指定目录的备份
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
    set backupskip+=*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif

" ================================================================================================================================
"                                                       GENERAL - Aliases
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" Allow misspellings - Cabbrev
" --------------------------------------------------------------o----------------------------------------------------------------o

" cabbrev tab Tabularize

" --------------------------------------------------------------o----------------------------------------------------------------o
" Allow misspellings - Cnoreabbrev
" --------------------------------------------------------------o----------------------------------------------------------------o

cnoreabbrev qw wq
cnoreabbrev qq wq
cnoreabbrev wQ wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev q1 q!

" ================================================================================================================================
"                                                       GENERAL - Mapping
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" Leader & LocalLeader Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

let mapleader = "\\"
let maplocalleader = ";"

" --------------------------------------------------------------o----------------------------------------------------------------o
" Disable Keymap
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap q <nop>

" --------------------------------------------------------------o----------------------------------------------------------------o
" 映射补全 Keymap
" --------------------------------------------------------------o----------------------------------------------------------------o

" inoremap <expr> <Up> pumvisible() ?"\<C-p>":"\<Up>"
" inoremap <expr> <Down> pumvisible() ?"\<C-n>":"\<Down>"

" --------------------------------------------------------------o----------------------------------------------------------------o
" Keep Cursor Center Of The Screen.
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent> n nzz
nnoremap <silent> N Nzz

nnoremap <silent> { {zz
nnoremap <silent> } }zz

nnoremap <silent> ( (zz
nnoremap <silent> ) )zz

nnoremap <silent> [[ [[zz
nnoremap <silent> ]] ]]zz

nnoremap <silent> <C-u> <C-u>0zz
nnoremap <silent> <C-d> <C-d>0zz

nnoremap <silent> <C-b> <C-b>0zz
nnoremap <silent> <C-f> <C-f>0zz

" --------------------------------------------------------------o----------------------------------------------------------------o
" Clear Highlighted Search
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent> <Esc><Esc> :nohlsearch<Return>

" --------------------------------------------------------------o----------------------------------------------------------------o
" Yank
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap Y y$

" --------------------------------------------------------------o----------------------------------------------------------------o
" SuperF/f-T/t
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap ;; ;
" nnoremap <CR> ;
" nnoremap <BS> ,

" --------------------------------------------------------------o----------------------------------------------------------------o
" Scroll Step Sideways
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap zl z20l
nnoremap zh z20h

" --------------------------------------------------------------o----------------------------------------------------------------o
" Yank Buffer's Relative/Absolute Path To Clipboard
" --------------------------------------------------------------o----------------------------------------------------------------o

" nnoremap <Leader>Y :let @+= expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
" nnoremap <Leader>y :let @+= expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" Select last paste
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" --------------------------------------------------------------o----------------------------------------------------------------o
" Re-Select Blocks After Indenting In Visual/Select Mode
" --------------------------------------------------------------o----------------------------------------------------------------o

xnoremap < <gv
xnoremap > >gv|

nnoremap > >>_
nnoremap < <<_

" --------------------------------------------------------------o----------------------------------------------------------------o
" Smart wrap toggle (breakindent and colorcolumn toggle as-well)
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <Leader>tw :execute('setlocal wrap! breakindent!')<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" 跨终端粘贴 
" --------------------------------------------------------------o----------------------------------------------------------------o

" nnoremap <silent><localleader>y "+yy
" vnoremap <silent><localleader>y "+y

nnoremap <silent><localleader>p "+p
xnoremap <silent><localleader>p "+p

" --------------------------------------------------------------o----------------------------------------------------------------o
" 切换窗口快捷键设置  
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
inoremap <C-h> <ESC><C-w>h
inoremap <C-l> <ESC><C-w>l
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k
tnoremap <C-h> <C-w><C-h>
tnoremap <C-j> <C-w><C-j>
tnoremap <C-k> <C-w><C-k>
tnoremap <C-l> <C-w><C-l>

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快速移动整行  
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent><S-Up>   :m-2<CR>==
nnoremap <silent><S-Down> :m+<CR>==
vnoremap <silent><S-Up>   :m-2<CR>gv=gv
vnoremap <silent><S-Down> :m'>+<CR>gv=gv
inoremap <silent><S-Up>   <Esc>:m-2<CR>==gi
inoremap <silent><S-Down> <Esc>:m+<CR>==gi

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快速复制行
" --------------------------------------------------------------o----------------------------------------------------------------o

" nnoremap <LocalLeader>d m`YP``<esc>
" vnoremap <LocalLeader>d YPgv<esc>

" --------------------------------------------------------------o----------------------------------------------------------------o
" <F2> 行号开关，用于鼠标复制代码用
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent> <F2> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" <F3> 语法开关，关闭语法可以加快大文件的展示
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent><F3> :if exists("syntax_on") <BAR> syntax off <BAR> else <BAR> syntax enable <BAR> endif<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" <F4> 粘贴模式开关
" --------------------------------------------------------------o----------------------------------------------------------------o

set pastetoggle=<F4>     

" --------------------------------------------------------------o----------------------------------------------------------------o
" <F8> 切换边界线（80）
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent> <F8> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" <F10> 搜索光标下的单词并以Previews显示
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent><F10> :<C-u>psearch <C-r>=expand("<cword>")<CR><CR>

" ================================================================================================================================
"                                                       GENERAL - AutoCmd
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" 打开Buffer 自动切换目录(PWD)
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup AutoChdir
    autocmd!
    autocmd BufEnter * silent! lcd %:p:h
augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 禁用换行自动添加注释字符
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup FormatOptions
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 如果显示QuickFix窗口,那么隐藏行编号,并设置行高为6
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup QuickFix
    autocmd!
	autocmd FileType qf setlocal nonumber norelativenumber
	autocmd FileType qf 6wincmd_
augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 打开文件时恢复上一次光标所在位置
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup ReadCursor
    autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自动保存及读取view设置
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup AutoSaveView
	autocmd!
	autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre * nested silent! mkview! 
	autocmd BufWinEnter * silent! loadview                                              
augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 加速语法渲染
" --------------------------------------------------------------o----------------------------------------------------------------o

" augroup AutoSyntax
"     autocmd!
"     autocmd Syntax * syn sync clear | syntax sync minlines=10 | syntax sync maxlines=10
" augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自定义VIM本身及其他插件颜色
" --------------------------------------------------------------o----------------------------------------------------------------o

augroup SystemColors
    autocmd!
    autocmd ColorScheme one call highlights#SystemHighlights()
augroup END

" ================================================================================================================================
"                                                       GENERAL - Fuctions
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快速保存当前窗口内容
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <silent><localleader>w :call save#Save()<CR>
vnoremap <silent><localleader>w <ESC>:call save#Save()<CR>
inoremap <silent><localleader>w <ESC>:call save#Save()<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" Quickly Rename current Files
" --------------------------------------------------------------o----------------------------------------------------------------o

nnoremap <Localleader>rn :call rename#Rename()<CR>
vnoremap <Localleader>rn <ESC>:call rename#Rename()<CR>
inoremap <Localleader>rn <ESC>:call rename#Rename()<CR>

" ================================================================================================================================
"                                                            Termianl
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                               Enables 256 Color In The Terminal
" --------------------------------------------------------------o----------------------------------------------------------------o

if (has("termguicolors"))
    set termguicolors
endif

" --------------------------------------------------------------o----------------------------------------------------------------o
"                                                        内部终端颜色设置
" --------------------------------------------------------------o----------------------------------------------------------------o

let g:terminal_ansi_colors     = repeat([0], 16)
let g:terminal_ansi_colors[0]  = "#282C34" " BLACK
let g:terminal_ansi_colors[8]  = "#3E4452" " BLACK BRIGHT
let g:terminal_ansi_colors[1]  = "#E06C75" " RED
let g:terminal_ansi_colors[9]  = "#BE5046" " RED BRIGHT
let g:terminal_ansi_colors[2]  = "#98C379" " GREEN
let g:terminal_ansi_colors[10] = "#98C379" " GREEN BRIGHT
let g:terminal_ansi_colors[3]  = "#E5C07B" " YELLOW
let g:terminal_ansi_colors[11] = "#D19A66" " YELLOW BRIGHT
let g:terminal_ansi_colors[4]  = "#61AFEF" " BLUE
let g:terminal_ansi_colors[12] = "#61AFEF" " BLUE BRIGHT
let g:terminal_ansi_colors[5]  = "#C678DD" " MAGENTA
let g:terminal_ansi_colors[13] = "#C678DD" " MAGENTA BRIGHt
let g:terminal_ansi_colors[6]  = "#56B6C2" " CYAN
let g:terminal_ansi_colors[14] = "#56B6C2" " CYAN BRIGHT
let g:terminal_ansi_colors[7]  = "#5C6370" " WHITE
let g:terminal_ansi_colors[15] = "#ABB2BF" " WHITE BRIGHT

" ================================================================================================================================
"                                                            插件管理器
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" Vim-Plug-AutoSync 
" --------------------------------------------------------------o----------------------------------------------------------------o

au VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | qa!
    \| endif

" --------------------------------------------------------------o----------------------------------------------------------------o
" Vim-Plug-Config   
" --------------------------------------------------------------o----------------------------------------------------------------o

let g:plug_url_format = 'https://hub.nuaa.cf/%s.git'
" let g:plug_url_format = 'https://hub.fastgit.xyz/%s.git'
" let g:plug_url_format = 'https://github.com/%s.git'
" let g:plug_url_format = 'https://github.com.cnpmjs.org/%s.git'

let g:plug_window = 'enew'

call plug#begin('$HOME/.vim/plugged')

    Plug 'dstein64/vim-startuptime'                                                                     " 启动时间
    Plug 'rakr/vim-one'                                                                                 " 类似ONEDARK
    Plug 'itchyny/lightline.vim'                                                                        " STATUSLINE
    Plug 'albertomontesg/lightline-asyncrun'                                                            " LIGHTLINE-ASYNC
    Plug 'mengelbrecht/lightline-bufferline'                                                            " BUFFER
    Plug 'tpope/vim-fugitive'                                                                           " GIT插件
    Plug 'tpope/vim-commentary'                                                                         " 快速注释插件
    Plug 'tpope/vim-surround'                                                                           " 成对更改删除括号等
    Plug 'junegunn/fzf.vim'                                                                             " 为VIM安装FZF插件
    Plug 'junegunn/fzf',                       { 'dir': '~/.fzf', 'do': './install --all' }             " 为系统安装FZF工具
    Plug 'mhinz/vim-startify'                                                                           " 定制VIM开始页面
    Plug 'mhinz/vim-sayonara'                                                                           " 代替QUIT插件
    Plug 'skywind3000/asyncrun.vim'                                                                     " 配合调测PYTHON插件
    Plug 'skywind3000/vim-auto-popmenu'                                                                 " 自动弹出补全插件
    Plug 'scrooloose/nerdtree',                { 'on': 'NERDTreeToggle' }                               " 文件树插件
    Plug 'Xuyuanp/nerdtree-git-plugin',        { 'on': 'NERDTreeToggle' }                               " 文件数GIT显示插件
    Plug 'airblade/vim-gitgutter'                                                                       " GIT插件
    Plug 'majutsushi/tagbar',                  { 'on': 'TagbarToggle' }                                 " TAG浏览
    Plug 'christoomey/vim-tmux-navigator'                                                               " 同步VIM与TMUX快捷键
    Plug 'Yggdroot/indentLine'                                                                          " 缩进线显示插件
    Plug 'kshenoy/vim-signature'                                                                        " 书签插件
    Plug 'voldikss/vim-floaterm'                                                                        " 终端插件
    Plug 'brooth/far.vim',                     { 'on': 'Far' }                                          " 代码重构
    Plug 'vimwiki/vimwiki',                    { 'branch': 'dev', 'on': 'VimwikiIndex' }                " VIMWIKI插件
    Plug 'michal-h21/vim-zettel',              { 'on': [ 'VimwikiIndex', 'VimwikiMakeDiaryNote'] }      " 配合VIMWIKI的功能插件
    Plug 'cespare/vim-toml',                   { 'for': ['yaml', 'yml'] }                               " TOML支持
    " Plug 'vim-airline/vim-airline'                                                                      " 状态栏
    " Plug 'joshdick/onedark.vim', { 'branch': 'main'  }                                                  " 主题文件
    " Plug 'mg979/vim-visual-multi', {'branch': 'master'}                                                 " 多光标输入
    " Plug 'TaDaa/vimade'                                                                                 " 非聚焦窗口颜色变浅
    " Plug 'preservim/vimux'                                                                              " 配合Tmux运行程序的插件

call plug#end()

" ================================================================================================================================
"                                                            主题配置
" ================================================================================================================================

" --------------------------------------------------------------o----------------------------------------------------------------o
" Themes Settings
" --------------------------------------------------------------o----------------------------------------------------------------o

if has#colorscheme('one')
    colorscheme one
    set background=dark
else
    colorscheme desert
    set background=dark
endif

" ================================================================================================================================
"                                                         各类插件设置
" ================================================================================================================================

" ================================================================================================================================
"							    LightLine
" ================================================================================================================================

if exists('g:plugs["lightline.vim"]')

    let g:lightline = {}
    let g:lightline.colorscheme = 'one'

    let g:lightline#asyncrun#indicator_none = ''
    let g:lightline#asyncrun#indicator_run = 'Running...'

    let g:lightline.active = {
                \ 'left':  [ 
                \          [ 'mode', 'paste'                   ],
                \          [ 'readonly'                        ],  
                \          [ 'filename'                        ], 
                \          [ 'absolutepath'                    ],
                \          ],
                \ 'right': [ 
                \          [ 'lineinfo'                        ],
                \          [ 'percentwin'                      ], 
                \          [ 'filetype'                        ], 
                \          [ 'fileformat'                      ],
                \          [ 'asyncrun', 'asyncrun_status'     ], 
                \          [ 'hunks'                           ], 
                \          ] 
                \ }

    let g:lightline.inactive = {
                \ 'left':  [ 
                \          [ 'mode', 'paste'                   ],
                \          [ 'readonly'                        ],  
                \          [ 'filename'                        ], 
                \          [ 'absolutepath'                    ],
                \          ],
                \ 'right': [ 
                \          [ 'filetype'                        ], 
                \          [ 'fileformat'                      ],
                \          ]
                \ }

    let g:lightline.tabline = {
                \ 'left' : [
                \          [ 'explorer_pad'                    ], 
                \          [ 'buffers'                         ],
                \          ],
                \ 'right': [
                \          [ 'close'                           ],
                \          [ 'gitbranch'                       ],
                \          ]
                \ }

    let g:lightline.component_function = {
                \ 'explorer_pad': 'LightlinePad',
                \ 'gitbranch': 'LightlineFugitive',
                \ 'hunks': 'LightLineGitGutter',
                \ 'readonly': 'LightLineReadonly',
                \ 'mode': 'LightLineMode',
                \ 'fileformat': 'LightLineFileformat',
                \ 'filetype': 'LightLineFiletype',
                \ 'lineinfo': 'LightlineLineInfo',
                \ 'percentwin': 'LightlinePercent',
                \ 'absolutepath': 'LightLineabsolutepath',
                \ 'filename': 'LightLineFilename',
                \ 'modified;': 'LightLineModified',
                \ }

    let g:lightline.component_expand = {
                \ 'linter_checking': 'lightline#ale#checking',
                \ 'linter_warnings': 'lightline#ale#warnings',
                \ 'linter_errors': 'lightline#ale#errors',
                \ 'linter_ok': 'lightline#ale#ok',
                \ 'asyncrun_status': 'lightline#asyncrun#status',
                \ 'buffers': 'lightline#bufferline#buffers',
                \ 'gitdiff': 'lightline#gitdiff#get',
                \ '&statusline': 'lightline#update()'
                \ }

    let g:lightline.component_type = {
                \ 'linter_warnings': 'warning',
                \ 'linter_errors': 'error',
                \ 'buffers': 'tabsel',
                \ }

    let g:lightline.component_raw        = { 'buffers': 1 }
    let g:lightline.separator            = { 'left': '', 'right': '' }
    let g:lightline.subseparator         = { 'left': '╲', 'right': '╲' }
    " let g:lightline.tabline_separator    = { 'left': '', 'right': '' } 
    let g:lightline.tabline_separator    = { 'left': '', 'right': '' } 
    let g:lightline.tabline_subseparator = { 'left': ' ', 'right': ' ' } 

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自定义颜色
" --------------------------------------------------------------o----------------------------------------------------------------o

    let s:p = g:lightline#colorscheme#{g:lightline.colorscheme}#palette

" --------------------------------------------------------------o----------------------------------------------------------------o
    let s:p.tabline.left   = [ [ '#282C34', '#61AFEF' ] ]
    let s:p.tabline.tabsel = [ [ '#E4EBFF', '#3e4452' ] ]
    let s:p.tabline.middle = [ [ '#959ca9', '#2c323d' ] ]
    let s:p.tabline.right  = [ [ '#282C34', '#98c379' ], [ '#ABB2BF', '#3E4452', 'bold' ] ]

" --------------------------------------------------------------o----------------------------------------------------------------o
    let s:p.normal.left   = [ 
                \ [ '#282C34', '#98C379' ],
                \ [ '#282c34', '#5a6378' ],
                \ [ '#abb2bf', '#3E4452' ],
                \ [ '#7d828c', '#2c323c' ],
                \ ]

    let s:p.normal.middle = [ 
                \ [ '#abb2bf', '#2c323c' ],
                \ ]

    let s:p.normal.right  = [ 
                \ [ '#282C34', '#98C379' ],
                \ [ '#abb2bf', '#3E4452' ],
                \ [ '#7d828c', '#2f3541' ],
                \ [ '#7d828c', '#2c323c' ],
                \ [ '#c678dd', '#2c323c' ],
                \ [ '#abb2bf', '#2c323c' ], 
                \ ]
" --------------------------------------------------------------o----------------------------------------------------------------o
    let s:p.insert.left   = [ 
                \ [ '#282c34', '#61AFEF' ],
                \ [ '#282c34', '#5a6378' ],
                \ [ '#abb2bf', '#3E4452' ],
                \ [ '#7ebcef', '#2c323c' ], 
                \ ]

    let s:p.insert.right  = [ 
                \ [ '#282C34', '#61AFEF' ],
                \ [ '#abb2bf', '#3E4452' ],
                \ [ '#7d828c', '#2f3541' ],
                \ [ '#7d828c', '#2c323c' ],
                \ [ '#c678dd', '#2c323c' ],
                \ [ '#7d828c', '#2c323c' ], 
                \ ]
" --------------------------------------------------------------o----------------------------------------------------------------o
    let s:p.inactive.left   = [ 
                \ [ '#25282c', '#3E4452' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ], 
                \ ]

    let s:p.inactive.middle = [ 
                \ [ '#2C323D', '#2C323D' ],
                \ ]

    let s:p.inactive.right  = [ 
                \ [ '#25282c', '#3E4452' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#536C70', '#2C323D' ],
                \ [ '#3E4452', '#3E4452' ], 
                \ ]

    let g:lightline#colorscheme#one#palette = lightline#colorscheme#fill(s:p)

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自定义函数
" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! s:trim(maxlen, str) abort
        let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
        return trimed
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! LightlinePad() abort
        let nr = get(filter(range(winnr()), 'getbufvar(winbufnr(v:val), "&filetype") =~# "nerdtree"'), 0, -1)
        return nr < 0 ? 'BUFFERS' : 'EXPLOER ' . repeat(' ', 21)
        " return 'BUFFERS'
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightLineFileformat() abort
        return winwidth(0) > 70 ? '⭕ ' .  &fileformat : ''
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightLineFiletype() abort
        return winwidth(0) > 70 ? (&filetype !=# '' ? '⭕ '  . &filetype . ' ' : 'no ft') : ''
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightLineReadonly() abort
        let ftmap = {
                    \ 'nerdtree': '',
                    \ 'tagbar': '',
                    \ 'qf': '',
                    \ 'floaterm': '',
                    \ 'fugitive': '',
                    \ 'vista': ''
                    \ }
        let l:char = get(ftmap, &filetype, '')
        return &readonly ? l:char : ''
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightLineModified() abort
        return &ft =~# 'help\|nerdtree' ? '' : &modified ? '+' : &modifiable ? '' : ''
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! LightLineFilename() abort
        let l:prefix = expand('%:p') =~? "fugitive://" ? '(fugitive) ' : ''
        let l:maxlen = winwidth(0) - winwidth(0) / 2
        let l:relative = expand('%:.')
        let l:tail = expand('%:t')
        let l:noname = 'No Name'

        if winwidth(0) < 50
            return ''
        endif

        if winwidth(0) < 86
            return l:tail ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:tail)
        endif

        return l:relative ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:relative)
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! LightlineFugitive() abort
    if exists('*FugitiveHead')
        let maxlen = 20
        let branch = FugitiveHead()
        return branch !=# '' ? ' '. s:trim(maxlen, branch) : ''
    endif
    return FugitiveHead()
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! LightLineMode() abort
            let ftmap = {
                \ 'nerdtree': 'NERDTREE',
                \ 'tagbar': 'TAGBAR',
                \ 'qf': 'QUICKFIX',
                \ 'floaterm': 'FLOATERM',
                \ 'fugitive': 'FUGITIVE',
                \ 'vista': 'OUTLINE'
                \ }
            return get(ftmap, &filetype, lightline#mode())
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightLineGitGutter() abort
        if ! exists('*GitGutterGetHunkSummary')
                    \ || ! get(g:, 'gitgutter_enabled', 0)
                    \ || winwidth('.') <= 90
            return ''
        endif
        let symbols = [ '+ ', '~ ', '- ' ]
        let hunks = GitGutterGetHunkSummary()
        let ret = []
        for i in [0, 1, 2]
            if hunks[i] > 0
                call add(ret, symbols[i] . hunks[i])
            endif
        endfor
        return join(ret, ' ')
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightlineLineInfo() abort
        " if winwidth(0) < 86
        "     return ''
        " endif
        let l:current_line = printf('%-2s', line('.'))
        " let l:current_line = s:trim(line('$'), line('.'))
        let l:column_col = printf('%-2d', col('.'))
        " let l:column_col = s:trim(col('$'), col('.'))
        let l:lineinfo = l:current_line .  ' : ' . l:column_col
        return &ft =~# 'tagbar\|nerdtree' ? 'N' : l:lineinfo

    endfunction
    
" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightlinePercent() abort
        if winwidth(0) < 60
            return ''
        endif
        let l:percent = line('.') * 100 / line('$') . '%'
        let l:percent = s:trim(5, l:percent)
        return printf('%-4s', l:percent)
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
"
    function! LightLineabsolutepath() abort
        if winwidth(0) < 60
            return ''
        endif
        return expand('%:p:h') 
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightlineCocSpaces() abort
        let nr = get(filter(range(winnr()), 'getbufvar(winbufnr(v:val), "&filetype") =~# "nerdtree"'), 0, -1)
        return nr < 0 ? 'BUFFERS' : repeat(' ', winwidth(nr)+1)
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o

    function! LightlineReload() abort
        call lightline#init()
        call lightline#colorscheme()
        call lightline#update()
    endfunction

    autocmd filetype nerdtree call LightlineReload()

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自定义TAGBAR
" --------------------------------------------------------------o----------------------------------------------------------------o
    let g:tagbar_status_func = 'TagbarStatusFunc'
        function! TagbarStatusFunc(current, sort, fname, ...) abort
            return lightline#statusline(1)
        endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
" LightLine- Buffers
" --------------------------------------------------------------o----------------------------------------------------------------o
"
    let g:lightline#bufferline#unnamed      = '[No Name]'
    let g:lightline#bufferline#show_number  = 2
    let g:lightline#bufferline#shorten_path = 0
    let g:lightline#bufferline#margin_left  = 1
    let g:lightline#bufferline#margin_right = 1
    let g:lightline#bufferline#modified     = ' +'

    let g:lightline#bufferline#composed_ordinal_number_map = {
        \ 1:  '1 · ', 2:  '2 · ', 3:  '3 · ', 4:  '4 · ', 5:  '5 · ',
        \ 6:  '6 · ', 7:  '7 · ', 8:  '8 · ', 9:  '9 · ', 10: '10 · ',
        \ }

    nmap <silent><LocalLeader>1       <Plug>lightline#bufferline#go(1)
    nmap <silent><LocalLeader>2       <Plug>lightline#bufferline#go(2)
    nmap <silent><LocalLeader>3       <Plug>lightline#bufferline#go(3)
    nmap <silent><LocalLeader>4       <Plug>lightline#bufferline#go(4)
    nmap <silent><LocalLeader>5       <Plug>lightline#bufferline#go(5)
    nmap <silent><LocalLeader>6       <Plug>lightline#bufferline#go(6)
    nmap <silent><LocalLeader>7       <Plug>lightline#bufferline#go(7)
    nmap <silent><LocalLeader>8       <Plug>lightline#bufferline#go(8)
    nmap <silent><LocalLeader>9       <Plug>lightline#bufferline#go(9)
    nmap <silent><LocalLeader>0       <Plug>lightline#bufferline#go(10)
    nmap <silent><LocalLeader><Tab>   <Plug>lightline#bufferline#go_next()
    nmap <silent><LocalLeader><S-Tab> <Plug>lightline#bufferline#go_previous()

endif

" ================================================================================================================================
"                                                            Airline
" ================================================================================================================================

if exists('g:plugs["vim-airline"]')
    let g:airline_theme='onedark'                                            " 设置状态栏主题默认powerlineish
    let g:airline_experimental = 1
    let g:airline_detect_modified=0
    let g:airline_inactive_alt_sep=0                                         " 对非活动窗口的状态行使用替代分隔符
    let g:airline_powerline_fonts= 1                                         " 使用powerline打过补丁的字体
    let g:airline_inactive_collapse=0                                        " 确定不活动的窗口是否应将左侧部分折叠到该缓冲区的文件名
    let g:airline_highlighting_cache = 1                                     " 将更改缓存到突出显示组中，因此应更快。如果遇到缓慢的Vim，请将其设置为1
    let g:airline_focuslost_inactive = 0                                     " 使用FocusLost自动命令禁用航空公
    let g:airline_stl_path_style = 'full'                                    " 在状态栏显示短路经
    let g:airline_skip_empty_sections = 0
    let g:airline_section_c_only_filename = 1                                " 仅仅显示文件名
    let g:airline#extensions#wordcount#enabled = 0                           " 开启字数统计
    let g:airline#extensions#wordcount#filetypes = ['all']                   " 开启字数统计文件类型
    let g:airline#extensions#wordcount#formatter#default#fmt = '%s words'    " 自定义字数统计格式
    let g:airline#extensions#whitespace#enabled = 0                          " 取消计数
    let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'             " 配置快速修复缓冲区的标题文本
    let g:airline#extensions#quickfix#location_text = 'Location'             " 配置位置列表缓冲区的标题文本
    let g:airline#extensions#term#enabled = 0
    let g:airline#extensions#fzf#enabled = 1                                 " 启用FZF集成
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
    let g:airline#extensions#hunks#non_zero_only = 1
    let g:airline#extensions#default#section_use_groupitems = 0
    let g:airline#extensions#searchcount#enabled = 0
    let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tagbar#flags = ''
    let g:airline#extensions#tagbar#searchmethod = 'nearest-stl'
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#branch#empty_message = ''
    let g:airline#extensions#branch#vcs_checks = ['untracked', 'dirty']
    let g:airline#extensions#tabline#enabled= 1                              " 开启tabline
    let g:airline#extensions#tabline#show_tabs = 0                           " 显示Tabls文字
    let g:airline#extensions#tabline#buffer_nr_show = 0                      " tabline中buffer显示编号
    let g:airline#extensions#tabline#fnamemod = ':t'                         " 只显示文件名称
    let g:airline#extensions#tabline#buf_label_first = 1                     " 在第一个位置显示缓冲区标签
    let g:airline#extensions#tabline#buffers_label = 'BUFFERS '              " airline右上角定制
    let g:airline#extensions#tabline#tabs_label = 'Tabs'                     " Tabs定制
    let g:airline#extensions#tabline#buffer_nr_format = '%s:'                " Buffer 格式
    let g:airline#extensions#tabline#show_close_button = 1                   " 是否显示关闭按钮
    let g:airline#extensions#tabline#close_symbol = 'X'                      " 关闭按钮的符号
    let g:airline#extensions#tabline#disable_refresh = 1                     " 在| BufAdd |上启用Tabline缓冲区的刷新自动命令
    let g:airline#extensions#tabline#show_splits = 1                         " 启用/禁用显示每个选项卡的打开拆分（仅在打开选项卡时）
    let g:airline#extensions#tabline#exclude_preview = 0                     " 在选项行中启用/禁用显示预览窗口缓冲区。
    let g:airline#extensions#tabline#alt_sep = 0
    let g:airline#extensions#tabline#tab_nr_type = 1                         " tab number
    let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
    let g:airline#extensions#tabline#show_tab_nr = 0
    let g:airline#extensions#tabline#show_tab_type = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#middle_click_preserves_windows = 0      " 从缓冲区关闭时保留窗口
    let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'
    let g:airline_extensions = ['branch', 'tabline', 'hunks']
    let g:airline#extensions#tabline#buffer_idx_format = {
        \ '0': '0 ',
        \ '1': '1 ',
        \ '2': '2 ',
        \ '3': '3 ',
        \ '4': '4 ',
        \ '5': '5 ',
        \ '6': '6 ',
        \ '7': '7 ',
        \ '8': '8 ',
        \ '9': '9 '
        \ }

" --------------------------------------------------------------o----------------------------------------------------------------o
" 定义要显示的名称集，而不是特定的文件类型
" --------------------------------------------------------------o----------------------------------------------------------------o

    let g:airline_filetype_overrides = {
        \ 'fugitive': ['Fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
        \ 'help':  [ 'Help', '%f' ],
        \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
        \ 'startify': [ 'Startify', '' ],
        \ 'vim-plug': [ 'Plugins', '' ],
        \ 'tagbar': [ 'Tagbar', ''],
        \ 'floaterm': [ 'Floaterm', '%{Airline_FloatermInfo()}' ],
        \ 'terminal': [ 'TERMINAL', '' ],
        \ }

" --------------------------------------------------------------o----------------------------------------------------------------o
" 自定义Airline区域的各项功能
" --------------------------------------------------------------o----------------------------------------------------------------o

    function! s:AirlineInit()
        let g:airline_section_b = airline#section#create_left(['branch'])
        let g:airline_section_c = airline#section#create(['readonly', '  ', 'path'])
        let g:airline_section_x = airline#section#create(['  ', 'hunks'])
        let g:airline_section_y = airline#section#create([' ⭕ ', '%t', ' ', ' ⭕ ', 'filetype', ' '])
        let g:airline_section_z = airline#section#create(['%3P %', ' ', '%4l', ':%3v'])
    endfunction

    augroup AleRedrawStatus
        autocmd!
        autocmd User AirlineAfterInit call <SID>AirlineInit()
        autocmd WinEnter * AirlineRefresh
    augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" Path Terminal Fix Colors
" --------------------------------------------------------------o----------------------------------------------------------------o

    let s:saved_theme = []
    let g:airline_theme_patch_func = 'AirlineThemePatch'
    function! AirlineThemePatch(palette)
        for colors in values(a:palette)
            if has_key(colors, 'airline_c') 
                let s:saved_theme = colors.airline_c
            endif
            if has_key(colors, 'airline_term')
                let colors.airline_term = s:saved_theme
            endif
        endfor
    endfunction


    " let g:airline_theme_patch_func = 'AirlineThemePatch'
    " function! AirlineThemePatch(palette)
        " let a:palette.normal.airline_tabsel = [ '#282c34', '#6cb6eb', 255, 33 ]
        " let a:palette.insert.airline_tabsel = [ '#282c34', '#6cb6eb', 255, 33 ]

        " let a:palette.normal.airline_a = [ '#282c34', '#6cb6eb', 255, 33 ]
        " let a:palette.normal.airline_c = [ '#6cb6eb', '#282c34', 255, 33 ]
        " let a:palette.normal.airline_z = [ '#282c34', '#6cb6eb', 255, 33 ]
        " let a:palette.insert.airline_a = [ '#282c34', '#98C379', 255, 33 ]
        " let a:palette.insert.airline_c = [ '#98C379', '#282c34', 255, 33 ]
        " let a:palette.insert.airline_z = [ '#282c34', '#98C379', 255, 33 ]
    " endfunction
" --------------------------------------------------------------o----------------------------------------------------------------o
" Highlighted
" --------------------------------------------------------------o----------------------------------------------------------------o

    " function! s:update_highlights()
        " hi CursorLine ctermbg=none guibg=NONE
        " hi VertSplit ctermbg=none guibg=NONE
        " hi airline_tabmod_unsel  ctermfg=7 ctermbg=0 guifg=#abb2bf guibg=#282C34
        " hi airline_tab_right  ctermfg=7 ctermbg=0 guifg=#abb2bf guibg=#212524
        " hi airline_tabhid  ctermfg=7 ctermbg=0 guifg=#abb2bf guibg=#282C34
        " hi airline_tabhid_right  ctermfg=7 ctermbg=0 guifg=#abb2bf guibg=#282C34
    " endfunction
    " autocmd User AirlineAfterTheme call s:update_highlights()

" --------------------------------------------------------------o----------------------------------------------------------------o
" Symbols
" --------------------------------------------------------------o----------------------------------------------------------------o

    let g:airline_symbols = {}
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.dirty = ' ⚡'
    let g:airline_symbols.modified = ' +'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ' '

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nmap <silent><LocalLeader>1        <Plug>AirlineSelectTab1
    nmap <silent><LocalLeader>2        <Plug>AirlineSelectTab2
    nmap <silent><LocalLeader>3        <Plug>AirlineSelectTab3
    nmap <silent><LocalLeader>4        <Plug>AirlineSelectTab4
    nmap <silent><LocalLeader>5        <Plug>AirlineSelectTab5
    nmap <silent><LocalLeader>6        <Plug>AirlineSelectTab6
    nmap <silent><LocalLeader>7        <Plug>AirlineSelectTab7
    nmap <silent><LocalLeader>8        <Plug>AirlineSelectTab8
    nmap <silent><LocalLeader>9        <Plug>AirlineSelectTab9

    nmap <silent><S-H>                 <Plug>AirlineSelectPrevTab
    nmap <silent><S-L>                 <Plug>AirlineSelectNextTab
    vmap <silent><S-H>                 <Esc><Plug>AirlineSelectPrevTab
    vmap <silent><S-L>                 <Esc><Plug>AirlineSelectNextTab

    nmap <silent><LocalLeader><tab>    <Plug>AirlineSelectNextTab
    nmap <silent><LocalLeader><S-tab>  <Plug>AirlineSelectPrevTab
    imap <silent><Localleader><tab>    <Esc><Plug>AirlineSelectNextTab
    imap <silent><Localleader><S-tab>  <Esc><Plug>AirlineSelectPrevTab
    vmap <silent><Localleader><tab>    <Esc><Plug>AirlineSelectNextTab
    vmap <silent><Localleader><S-tab>  <Esc><Plug>AirlineSelectPrevTab

endif

" ================================================================================================================================
"                                                            NERDTree
" ================================================================================================================================

if exists('g:plugs["nerdtree"]')

    let g:NERDTreeAutoCenter = 0                                              " 光标居中
    let g:NERDTreeAutoCenterThreshold = 0                                     " 控制自动居中灵敏度
    let g:NERDTreeSortHiddenFirst = 1                                         " 隐藏文件排序往上
    let g:NERDTreeNaturalSort = 0                                             " 自然序号排序
    let g:NERDTreeUseTCD = 1                                                  " 打开Tcd模式
    let g:NERDTreeChDirMode = 2                                               " 是否改变PWD目录路径
    let g:NERDTreeHighlightCursorline = 1                                     " 突出显示光标所在的行
    let g:NERDTreeHijackNetrw = 1                                             " 劫持Netrw
    let g:NERDTreeIgnore = ['\.pyc','\~$','\.swp','_gsdata_']                 " 屏蔽过滤所有指定的文件和文件夹
    let g:NERDTreeRespectWildIgnore = 1                                       " 设置为1的话遵循widignore设置
    let g:NERDTreeBookmarksFile = expand('~/.vim/NERDTreeBookmarks')          " 书签存放路径
    let g:NERDTreeMarkBookmarks = 0                                           " 当书签文件夹出现时禁用提示
    let g:NERDTreeQuitOnOpen = 3                                              " 打开后是否关闭NT窗口
    let g:NERDTreeShowBookmarks = 1                                           " 显示书签
    let g:NERDTreeShowHidden = 1                                              " 是否显示隐藏文件
    let g:NERDTreeShowLineNumbers = 0                                         " 是否显示行号
    let g:NERDTreeWinPos = 'left'                                             " NERDTree显示位置
    let g:NERDTreeWinSize = 30                                                " 窗口宽度
    let g:NERDTreeMinimalUI = 1                                               " 不显示帮助面板
    let g:NERDTreeMinimalMenu = 1                                             " Mini功能窗口
    let g:NERDTreeAutoDeleteBuffer=1                                          " 自动删除重命名的缓冲区
    let g:NERDTreeDirArrowExpandable = '+'                                    " 设置树的显示图标
    let g:NERDTreeDirArrowCollapsible = '-'                                   " 设置树的显示图标
    " let NERDTreeSortOrder=[1]                                               " 排序设置0 or 1
    " let NERDTreeCreatePrefix='silent keepalt keepjumps readonly'

    hi NERDTreeDirSlash           term=bold  ctermfg=0 
    hi NERDTreeExecFile           term=bold  ctermfg=250
    hi NERDTreeLinkTarget         term=bold  ctermfg=8
    hi NERDTreeLinkFile           term=bold  ctermfg=5
    hi NERDTreeBookmarksLeader    term=bold  ctermfg=8
    hi NERDTreeBookmark           term=bold  ctermfg=0
    hi NERDTreeOpenable           term=bold  ctermfg=8

" --------------------------------------------------------------o----------------------------------------------------------------o
" 当NERDTree为剩下的唯一窗口时自动关闭 , 屏蔽;s ;c
" --------------------------------------------------------------o----------------------------------------------------------------o

    autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>s <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>c <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>w <Esc>| endif

" --------------------------------------------------------------o----------------------------------------------------------------o
" 禁止其他缓冲区替换NERDTree
" --------------------------------------------------------------o----------------------------------------------------------------o

    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
                \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o
    
    function! s:NERDTreetoggle()                                    
        if &filetype == 'nerdtree'                                  
            NERDTreeToggle %p:h                                     
        else                                                        
            silent! NERDTreeFind                                            
        endif                                                       
    endfunction                                                     

    nnoremap <silent><localleader>e :call <SID>NERDTreetoggle()<CR> 
    inoremap <silent><localleader>e <Esc> :call <SID>NERDTreetoggle()<CR> 

endif

" ================================================================================================================================
"                                                         NERDTree - Git
" ================================================================================================================================

if exists('g:plugs["nerdtree-git-plugin"]')

    let g:NERDTreeGitStatusShowClean = 0
    let g:NERDTreeGitStatusUseNerdFonts = 1
    let g:NERDTreeGitStatusConcealBrackets = 0
    let g:NERDTreeGitStatusUntrackedFilesMode = 'normal' 
    let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  :'M',
        \ 'Staged'    :'A',
        \ 'Untracked' :'U',
        \ 'Renamed'   :'R',
        \ 'Unmerged'  :'UU',
        \ 'Deleted'   :'D',
        \ 'Dirty'     :'M',
        \ 'Ignored'   :'.',
        \ 'Clean'     :'C',
        \ 'Unknown'   :'?',
        \ }

endif

" ================================================================================================================================
"                                                            Tagbar
" ================================================================================================================================

if exists('g:plugs["tagbar"]')

    let g:tagbar_autofocus = 1                                                " 焦点自动聚焦到Tagbar
    let g:tagbar_autoclose = 1
    let g:tagbar_autopreview = 0
    let g:tagbar_no_autocmds = 0
    let g:tagbar_autoclose_netrw = 1
    let g:tagbar_jump_lazy_scroll = 1
    let g:tagbar_use_cache = 1
    let g:tagbar_sort = 0
    let g:tagbar_indent = 0
    let g:tagbar_case_insensitive = 1
    let g:tagbar_compact = 1
    let g:tagbar_show_balloon = 0
    let g:tagbar_show_data_type = 0
    let g:tagbar_show_visibility = 1
    let g:tagbar_expand = 1
    let g:tagbar_autoshowtag = 2
    let g:no_status_line = 0
    let g:tagbar_silent = 1
    let g:tagbar_scrolloff = 10
    let g:tagbar_hide_nonpublic = 1
    let g:tagbar_width = 25
    let g:tagbar_map_preview = '<SPACE>'
    let g:tagbar_map_showproto = "d"
    let g:tagbar_map_togglesort = 'r'
    let g:tagbar_iconchars = ['+', '-']
    let g:tagbar_previewwin_pos = "aboveleft"

    " VIMWIKI CTAGS
    let g:tagbar_type_vimwiki = {
        \ 'ctagsbin': 'ctags',
        \ 'ctagstype'	: 'vimwiki',
        \ 'kinds'		: [
            \ 'c:Heading1:0:1',
            \ 's:Heading2:0:1',
            \ 'S:Heading3:0:1',
            \ 't:Heading4:0:1',
            \ 'T:Heading5:0:1',
            \ 'u:Heading6:0:1',
        \ ],
        \ 'sro'			: '""',
        \ 'kind2scope'	: {
            \ 'c' : 'Heading1',
            \ 's' : 'Heading2',
            \ 'S' : 'Heading3',
            \ 't' : 'Heading4',
            \ 'T' : 'Heading5',
            \},
        \ 'scope2kind'	: {
            \ 'Heading1' : 'c',
            \ 'Heading2' : 's',
            \ 'Heading3' : 'S',
            \ 'Heading4' : 't',
            \ 'Heading5' : 'T',
        \ },
    \ }

    " YAML CTAGS
    let g:tagbar_type_yaml = {
        \ 'ctagsbin': 'ctags-universal',
        \ 'ctagstype' : 'yaml',
        \ 'kinds' : [
            \ 'a:anchors',
            \ 's:section',
            \ 'e:entry'
        \ ],
        \ 'sro' : '.',
        \ 'scope2kind': {
            \ 'section': 's',
            \ 'entry': 'e'
        \ },
        \ 'kind2scope': {
            \ 's': 'section',
            \ 'e': 'entry'
        \ },
        \ 'sort' : 0
        \ }

" --------------------------------------------------------------o----------------------------------------------------------------o
" 当Tagbar为剩下的唯一窗口时自动关闭 , 屏蔽;s ;c
" --------------------------------------------------------------o----------------------------------------------------------------o

    autocmd BufEnter * if (winnr("$") == 1 && bufname('#') =~# "^__Tagbar__") | q | endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>s <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>c <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>w <Esc>| endif
    
" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <silent><localleader>t :TagbarToggle<CR>:AirlineRefresh<CR>
    inoremap <silent><localleader>t <Esc>:TagbarToggle<CR>:AirlineRefresh<CR>

endif

" ================================================================================================================================
"                                                            FZF
" ================================================================================================================================

if exists('g:plugs["fzf.vim"]')

    " 启用浮动窗口
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

    " 禁用浮动窗口
    " let g:fzf_layout = { 'down':'40%' }

    " 预览窗口设置
    let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

    " SEE `MAN FZF-TMUX` FOR AVAILABLE OPTIONS
    if exists('$TMUX')
        let g:fzf_layout = { 'tmux': '-p90%,60%' }
    else
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
    endif

    " [BUFFERS] JUMP TO THE EXISTING WINDOW IF POSSIBLE
    let g:fzf_buffers_jump = 1

    " [[B]COMMITS] CUSTOMIZE THE OPTIONS USED BY 'GIT LOG':
    let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

    " [TAGS] COMMAND TO GENERATE TAGS FILE
    let g:fzf_tags_command = 'ctags -R'

    " [COMMANDS] --EXPECT EXPRESSION FOR DIRECTLY EXECUTING THE COMMAND
    let g:fzf_commands_expect = 'alt-enter,ctrl-x'

    " 额外按键绑定
    let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit'}

    let g:fzf_colors =
        \ { 'fg':    ['fg', 'TabLine'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'SignColumn'],
        \ 'fg+':     ['fg', 'Visual', 'Visual', 'Normal'],
        \ 'bg+':     ['bg', 'Comment', 'Pmenu'],
        \ 'hl+':     ['fg', 'SignColumn'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Directory'],
        \ 'prompt':  ['fg', 'ErrorMsg'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

    nnoremap <silent><LocalLeader>fr :Rg<CR>
    nnoremap <silent><LocalLeader>fa :Files<CR>
    nnoremap <silent><LocalLeader>ff :GFiles<CR>
    nnoremap <silent><LocalLeader>fm :GFiles?<CR>
    nnoremap <silent><LocalLeader>fc :Commits<CR>
    nnoremap <silent><LocalLeader>fl :BLines<CR>
    nnoremap <silent><LocalLeader>fo :Colors<CR>
    nnoremap <silent><LocalLeader>fh :History<CR>
    nnoremap <silent><LocalLeader>fb :Buffers<CR>

    " PROJECTS SETTINGS
    command! -bang Dot call fzf#vim#files('~/dotfiles', <bang>0)

endif

" ================================================================================================================================
"                                                          AsyncRun
" ================================================================================================================================

if exists('g:plugs["asyncrun.vim"]')

    let g:asyncrun_open = 6

    nnoremap <silent><F7> :silent call asyncrun#quickfix_toggle(8)<cr>
    inoremap <silent><F7> <esc> :silent call asyncrun#quickfix_toggle(8)<cr>

    nnoremap <F5> :call <SID>RunCode()<cr>
    nnoremap <silent><localleader>r :call <SID>RunCode()<cr>
    inoremap <silent><localleader>r <esc>:call <SID>RunCode()<cr>
    vnoremap <silent><localleader>r <esc>:call <SID>RunCode()<cr>

" --------------------------------------------------------------o----------------------------------------------------------------o
" 一键运行
" --------------------------------------------------------------o----------------------------------------------------------------o

    function! s:RunCode()
        exec "w"
        let fm = expand('%:p:h')
        if &filetype == 'python'
            exec 'AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom -rows=16 python3 "$(VIM_FILEPATH)"'
            exec "wincmd p"
        elseif &filetype == 'sh'
            exec "AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 time bash %"
        elseif &filetype == 'java'
            execute 'AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 -cwd=<root> javac "$(VIM_RELNAME)" ; java $(VIM_FILENOEXT)'
        elseif &filetype == 'javascript'
            exec "AsyncRun -mode=term -pos=bottom -rows=10 -focus=0 time node %"
        endif
    endfunction

endif

" ================================================================================================================================
"                                                         IndentLine
" ================================================================================================================================

if exists('g:plugs["indentLine"]')

    let g:indentLine_enabled = 0
    let g:indentLine_conceallevel = 1
    let g:indentLine_defaultGroup = 'SpecialKey'

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <LocalLeader>l :IndentLinesToggle<CR>
    inoremap <LocalLeader>l <esc> :IndentLinesToggle<CR>

endif

" ================================================================================================================================
"                                                           Startify
" ================================================================================================================================

if exists('g:plugs["vim-startify"]')

    let g:startify_files_number = 10
    let g:startify_update_oldfiles = 0
    let g:startify_session_autoload = 0
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_dir = 1
    let g:startify_enable_special = 1
    let g:startify_change_cmd = 'tcd'

    let g:startify_custom_header = [
        \'    _____                 _____                        ',
        \'   |_   _|_ _  ___       |_   _|_ _  ___               ',
        \'     | |/ _` |/ _ \        | |/ _` |/ _ \              ',
        \'     | | (_| | (_) |  _    | | (_| | (_) |             ',
        \'     |_|\__,_|\___/  (_)   |_|\__,_|\___/              ',
        \'                                                       ',
        \ ]


    let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

    let g:startify_commands = [
        \ { 'p': ['Projects : Django', 'e ~/dotfiles']           },
        \ ]

    let g:startify_bookmarks = [
        \ { 'v': '$HOME/.vimrc'                                  },
        \ { 's': '$HOME/.bashrc'                                 },
        \ { 't': '$HOME/.tmux.conf'                              },
        \ { 'i': '$HOME/.config/i3/config'                       },
        \ { 'b': '$HOME/.config/i3blocks/config'                 },
        \ { 'c': '$HOME/.config/picom/picom.conf'                },
        \ { 'r': '$HOME/.config/rofi/config.rasi'                },
        \ { 'a': '$HOME/.config/alacritty/alacritty.yml'         },
        \ ]

    let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ ]

    let g:startify_custom_footer = [
        \'                                                       ',
        \'   - KEEP AN OPEN MIND -                               ',
        \'                                                       ',
        \]

    augroup Startify
        autocmd!
        autocmd User Startified setlocal laststatus=0 showtabline=0 statusline=\ startify
        autocmd BufLeave * set laststatus=2 showtabline=2
    augroup END

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <silent><LocalLeader>s :Startify <CR>
    inoremap <silent><LocalLeader>s <Esc>:Startify <CR>

endif

" ================================================================================================================================
"                                                         Vim-Visual-Multi
" ================================================================================================================================

if exists('g:plugs["vim-visual-multi"]')

    let g:VM_maps                       = {}
    let g:VM_maps['Motion ;']           = ';;'
    let g:VM_maps["Select All"]         = '<LocalLeader>a'
    let g:VM_maps['Find Under']         = '<LocalLeader>d'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<LocalLeader>d'           " replace visual C-n
    let g:VM_maps["Skip Region"]        = 'q'
    let g:VM_maps["Undo"]               = 'u'
    let g:VM_maps["Redo"]               = '<C-r>'
    let g:VM_maps["Replace Pattern"]    = 'r'

endif

" ================================================================================================================================
"                                                           Signature
" ================================================================================================================================

if exists('g:plugs["vim-signature"]')

    let g:SignatureEnabledAtStartup = 1
    let g:SignatureForceMarkPlacement = 1
    let g:SignatureForceMarkerPlacement = 1
    let g:SignatureWrapJumps = 0
    let g:SignatureMarkOrder="\m"
    let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m.",
        \ 'ToggleMarkAtLine'   :  "mm",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "md",
        \ 'PurgeMarks'         :  "mx",
        \ 'PurgeMarkers'       :  "m<SPACE>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "mn",
        \ 'GotoPrevLineByPos'  :  "mp",
        \ 'GotoNextSpotByPos'  :  "mf",
        \ 'GotoPrevSpotByPos'  :  "mb",
        \ 'GotoNextMarker'     :  "]-",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListBufferMarks'    :  "m,",
        \ 'ListBufferMarkers'  :  "m?"
        \ }

    hi SignatureMarkText   term=standout ctermbg=2   ctermbg=2   guifg=#E06C75 guibg=#282C34   " 书签标记颜色
    hi SignatureMarkerText term=standout ctermbg=2   ctermbg=2   guifg=#E06C75 guibg=#282C34   " 折叠提示颜色

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <silent><localleader>m :SignatureToggleSigns<CR> 

endif

" ================================================================================================================================
"                                                            Floaterm
" ================================================================================================================================

if exists('g:plugs["vim-floaterm"]')

    let g:floaterm_wintype = 'split'
    let g:floaterm_position = 'bottom'
    let g:floaterm_title = 'TERMINAL: $1/$2'
    let g:floaterm_height = 0.3
    let g:floaterm_autoclose = 2
    let g:floaterm_autohide = 0
    let g:floaterm_borderchars = '─│─│┌┐┘└'

    function! Airline_FloatermInfo() abort
        let buffers = floaterm#buflist#gather()
        let cnt = len(buffers)
        let cur = floaterm#buflist#curr()
        let idx = index(buffers, cur) + 1
        return printf(' %s/%s', idx, cnt)
    endfunction

    autocmd FileType floaterm tnoremap <expr> <ESC> (&filetype == "fzf") ? "<Esc>" : "<C-\><C-n>"

    autocmd ExitPre * FloatermKill!

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <silent><Localleader>c :silent FloatermToggle<CR>
    tnoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>
    vnoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>
    inoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>

    tnoremap <silent><Localleader>C <C-\><C-n>:silent FloatermNew<CR>
    tnoremap <silent><Localleader>p <C-\><C-n>:silent FloatermPrev<CR>
    tnoremap <silent><Localleader>n <C-\><C-n>:silent FloatermNext<CR>

endif

" ================================================================================================================================
"                                                            Sayonara
" ================================================================================================================================

if exists('g:plugs["vim-sayonara"]')

    nnoremap <silent><localleader>q :Sayonara<cr>
    inoremap <silent><localleader>q <Esc>:Sayonara<cr>
    vnoremap <silent><localleader>q <Esc>:Sayonara<cr>

endif

" ================================================================================================================================
"                                                        Vim-Auto-Popmenu
" ================================================================================================================================

if exists('g:plugs["vim-auto-popmenu"]')

    let g:apc_enable_ft = { '*':1 }
    let g:apc_cr_confirm = 1
    set completeopt=menu,menuone,noselect
    set cpt=.,k,w,b
    set shortmess+=c

endif

" ================================================================================================================================
"                                                             Vimux
" ================================================================================================================================

if exists('g:plugs["vimux"]')

    let g:VimuxOrientation = "h"
    let g:VimuxHeight = "40"

endif

" ================================================================================================================================
"                                                              Far
" ================================================================================================================================

if exists('g:plugs["far.vim"]')

    let g:far#enable_undo = 1
    let g:far#source = 'rg'
    let g:far#glob_mode = 'rg'
    let g:far#window_layout = 'left'
    let g:far#preview_window_layout = 'right'
    let g:far#collapse_result = 1
    let g:far#auto_preview = 0
    let g:far#auto_preview_on_start = 0
    let g:far#result_preview = 0
    let g:far#window_width = 30

    let g:far#mapping = {
        \ "exclude" : ["x"],
        \ "include" : ["i"],
        \ "toggle_exclude" : ["t"],
        \ "stoggle_exclude" : ["<Tab>"],
        \ "jump_to_source" : ["<CR>"],
        \ "close_preview" : ["q"],
        \ "open_preview" : ["p"], 
        \ "toggle_expand" : ["<Space>","o"],
        \ "replace_do" : ["s"],
        \ "replace_undo" : ["u"],
        \ "replace_undo_all" : ["U"],
        \ "preview_scroll_up" : "<PageUp>",
        \ "preview_scroll_down" : "<PageDown>",
        \ }

" --------------------------------------------------------------o----------------------------------------------------------------o
" 快捷键
" --------------------------------------------------------------o----------------------------------------------------------------o

    nnoremap <LocalLeader><F2> :Far <C-R><C-W><Space>

endif

" ================================================================================================================================
"                                                       VimWiki - Zettel
" ================================================================================================================================

if exists('g:plugs["vim-zettel"]')

    let g:zettel_format = "%title"
    let g:zettel_link_format="[[%title]]"
    let g:zettel_fzf_command = "rg --column --ignore-case --no-heading --color=always"
    let g:zettel_options = [{"disable_front_matter": 1}]

    " let g:zettel_format = "%Y%m%d%H%M"
    " let g:zettel_format = "%Y-%m-%d"
    " let g:zettel_link_format="[%title](%link)"
    " let g:zettel_options = [{"template":"$HOME/.vim/zettelnew.tpl", "disable_front_matter": 1}]

endif

" ================================================================================================================================
"                                                           VimWiki
" ================================================================================================================================

if exists('g:plugs["vimwiki"]')

    nnoremap <Leader>ww :VimwikiIndex<cr>

" --------------------------------------------------------------o----------------------------------------------------------------o
" Vimwiki Setting
" --------------------------------------------------------------o----------------------------------------------------------------o
    let wiki_3 = {}
    let wiki_3.name= '<Logseq>'
    let wiki_3.path= '$HOME/wiki/pages/'
    let wiki_3.index = 'contents'
    let wiki_3.ext= '.md'
    let wiki_3.syntax= 'markdown'
    let wiki_3.vimwiki_global_ext=1
    let wiki_3.vimwiki_auto_chdir= 1
    let wiki_3.diary_rel_path= './journals/'
    let wiki_3.diary_index='Diary'

    let g:vimwiki_list = [wiki_3]
    let g:vimwiki_ext2syntax = {'.md': 'markdown',  '.wiki': 'media'}

    let g:vimwiki_CJK_length = 1
    let g:vimwiki_hl_cb_checked = 2
    let g:vimwiki_global_ext = 1 " make sure vimwiki doesn't own all .md files
    let g:vimwiki_use_mouse = 0
    let g:vimwiki_conceallevel=1
    let g:vimwiki_markdown_link_ext = 1
    let g:list_margin=0
    let g:auto_diary_index=1
    let g:auto_generate_links=1
    " let g:diary_header="Diary"
    " let g:vimwiki_user_htmls = '404.html,search.html,books.html,todo,html,contact.html,tags.html,inbox.html'
    " let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,nav,body,aside'
    " let g:vimwiki_tag_format = {'pre': 'tags:.*', 'pre_mark': '\[', 'post_mark': '\]', 'sep': ','}

" --------------------------------------------------------------o----------------------------------------------------------------o
" 设置Vimwiki搜索模式
" --------------------------------------------------------------o----------------------------------------------------------------o

    function! VWS() abort
        execute ":VimwikiSearch " . input("VimwikiSearch:")
        :lopen
    endfunction

" --------------------------------------------------------------o----------------------------------------------------------------o
" Vimwiki Group
" --------------------------------------------------------------o----------------------------------------------------------------o

    augroup vimwiki_group

        autocmd!

        " 自定义搜索方式
        autocmd FileType vimwiki nnoremap <silent><localleader>f :call VWS()<CR>
        " 查看BackLinks链接
        autocmd FileType vimwiki nnoremap <silent><localleader>b :VimwikiBacklinks<cr>
        " 搜索的结果向下跳转并预览该文件
        autocmd FileType vimwiki nnoremap <silent><localleader>j :lnext<cr>
        " 搜索的结果向上跳转并预览该文件
        autocmd FileType vimwiki nnoremap <silent><localleader>k :lprevious<cr>
        " 自定义搜索方式 - 搜索当前光标下的单词
        autocmd FileType vimwiki nnoremap <silent><localleader>g :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
        " 改变vimwiki创建链接的样式
        autocmd FileType vimwiki let g:vimwiki_syntaxlocal_vars['markdown']['Link1'] = g:vimwiki_syntaxlocal_vars['default']['Link1']
        " 改变Vimwiki Diary的路径
        autocmd FileType vimwiki call vimwiki#path#mkdir(vimwiki#vars#get_wikilocal('diary_rel_path'))

    augroup end

" --------------------------------------------------------------o----------------------------------------------------------------o
" 改变Shift+Enter映射
" --------------------------------------------------------------o----------------------------------------------------------------o

    autocmd FileType vimwiki inoremap <silent><buffer> <localleader><CR> <Esc>:VimwikiReturn 2 2<CR>

" --------------------------------------------------------------o----------------------------------------------------------------o
" HighLighting
" --------------------------------------------------------------o----------------------------------------------------------------o

    hi VimwikiLink guifg=#61afef
    hi VimwikiLink guifg=#61afef
    hi VimwikiHeader1 guifg=#e5c07b
    hi VimwikiHeader2 guifg=#98c379
    hi VimwikiHeader3 guifg=#c678dd
    hi VimwikiHeader4 guifg=#8096BF
    hi VimwikiHeader5 guifg=#8096BF
    hi VimwikiHeader6 guifg=#8096BF
    hi VimwikiH1Folding guifg=#e5c07b
    hi VimwikiH2Folding guifg=#98c379
    hi VimwikiH3Folding guifg=#c678dd
    hi VimwikiH4Folding guifg=#8096BF
    hi VimwikiH5Folding guifg=#8096BF
    hi VimwikiH6Folding guifg=#8096BF
    hi VimwikiBold term=reverse cterm=underline ctermfg=204 gui=underline guifg=#E06C75

" --------------------------------------------------------------o----------------------------------------------------------------o
" 使用wd删除markdown时自动删除相对应不使用的HTML文件
" --------------------------------------------------------------o----------------------------------------------------------------o

    " function! VimwikiDeleteClean() abort
    "     let htmlfile = expand('%:r') . '.html'
    "     lcd ${HOME}/vimwiki/docs/
    "     call delete(htmlfile)
    "     lcd %:p:h
    "     call vimwiki#base#delete_link()
    " endfunction
    " autocmd filetype vimwiki nnoremap <buffer> <leader>wd :call VimwikiDeleteClean()<CR>

endif


