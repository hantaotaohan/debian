"=================================================================================================================================
"                                                                                                                                
"                                                               VIMRC                                                            
"                                                                                                                                                                                                
"                                                        Update: 2021.05.06                                                      
"                                                                                                                                
"=================================================================================================================================

"=================================================================================================================================
"                                                                                                                                
"                                                          GUI Gvim 配置文件                                                      
"                                                                                                                                
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Linux Gvim Settings ...                                                                                                        
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has("gui_running")
    set guioptions=M                                                       " 去除VIN得GUI版本中得菜单栏
    set guioptions=T                                                       " 去除VIN得GUI版本中得工具栏
    set guioptions-=m                                                      " 隐藏菜单栏
    set guioptions-=T                                                      " 隐藏工具栏
    set guifont=Inziu\ Iosevka\ SC\ Bold\ 10.5                             " 设置GUI字体
    set guicursor=a:blinkon0                                               " 光标形状
    set ttymouse=                                                          " 启用鼠标
    set nocursorline                                                       " 突出显示当前行

    " 配置 <Shift> + <F2> 切换菜单显示或者关闭

    nnoremap <silent> <S-F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
        \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
        \endif<CR>
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Windows Gvim Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has("win32") && has("gui_running")
    winpos 235 235
    let $LANG='zh_CN'                                                      " 设置语言为中文
    set helplang=cn                                                        " 设置帮助语言为中文
    set encoding=utf8                                                      " 设置文件打开编码为UTF-8
    set langmenu=zh_CN.UTF-8                                               " 设置菜单语言为中文
    set guifont=Inziu_Iosevka_SC:h12:b                                     " 设置GUI字体
    set guicursor+=a:blinkon0                                              " 设置光标不闪烁
    set lines=30 columns=180
    set renderoptions=type:directx
    " set linespace=6
    source $VIMRUNTIME/delmenu.vim                                         " 重新加载菜单文件
    source $VIMRUNTIME/menu.vim                                            " 重新加载菜单文件
    let $PYTHONUNBUFFERED=1
    map <M-0> :Fontzoom!<cr>
    map <M-=> <Plug>(fontzoom-larger)
    map <M--> <Plug>(fontzoom-smaller)
endif


"=================================================================================================================================


"=================================================================================================================================
"                                                                                                                                
"                                                              GENERAL                                                          
"                                                                                                                                
"=================================================================================================================================

"=================================================================================================================================
"
"                                                         GENERAL - Settings
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Disable Vim Distribution Plugins ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

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

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Vim Disable Compatible ... 
" ----------------------------------------------------------------o--------------------------------------------------------------o

if &compatible
    set nocompatible
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Enables 24-bit RGB Color In The Terminal ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has('termguicolors')
    if empty($COLORTERM) || $COLORTERM =~# 'truecolor\|24bit'
        set termguicolors
    endif
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Enables Syntax HighLighting ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has("syntax")
    syntax on                                                              " 开启颜色高亮
    " syntax enable                                                          " 开启语法高亮
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Clipborad Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has('clipboard') && has('vim_starting') && has('unnamedplus')
    set clipboard& clipboard^=unnamed,unnamedplus 
    xnoremap <silent> p p:let @+=@0<CR>
    autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif

" WSL 支持复制"
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Preview Window Auto-Close Function ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if exists('+previewpopup')
    silent! execute 'silent! set previewpopup=height:'.&lines/4.',width:'.&columns/2.',highlight:Pmenu,border:off'
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Wildmenu Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

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

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Vim Directories Path Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~').'/.vim') " 设置Vim主目录
set undofile                                                               " 开启撤销功能
set nobackup                                                               " 设置无备份文件
set noswapfile                                                             " 设置无临时文件
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp               " 设置撤销文件目录
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp            " 设置备份文件目录
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp             " 设置临时文件目录
set viewdir=$DATA_PATH/view/                                               " 设置视图文件目录
set viewoptions=folds,cursor,curdir,slash,unix                             " 设置视图文件功能

" ----------------------------------------------------------------o--------------------------------------------------------------o
" History Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set history=2000                                                          " 保存历史记录行数

" 写入以下目录后 禁用撤销功能

augroup user_persistent_undo
    autocmd!
    au BufWritePre /tmp/*          setlocal noundofile
    au BufWritePre COMMIT_EDITMSG  setlocal noundofile
    au BufWritePre MERGE_MSG       setlocal noundofile
    au BufWritePre *.tmp           setlocal noundofile
    au BufWritePre *.bak           setlocal noundofile
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o

" 如果为系统管理员角色使用vim 那么禁用交换文件 禁用撤销 禁用备份

if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
    \ && $HOME !=# expand('~'.$USER, 1)
    \ && $HOME ==# expand('~'.$SUDO_USER, 1)
    set noswapfile
    set nobackup
    set nowritebackup
    set noundofile
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o

" 保护敏感信息，禁用临时目录中的备份文件

if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
    set backupskip+=.vault.vim
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o

" 禁用临时目录或 shm 中的交换/撤消/viminfo 文件

augroup user_secure
    autocmd!
    silent! autocmd BufNewFile,BufReadPre
        \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
        \ setlocal noswapfile noundofile
        \ | set nobackup nowritebackup
        \ | if has('nvim') | set shada= | else | set viminfo= | endif
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Auto BreakIndent Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set textwidth=80                                                           " 插入文本的最大宽度。更长的行会在空白之后截断
set expandtab                                                              " 将制表符转换为空格
set tabstop=4                                                              " 设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                                           " 换行时自动缩进宽度，可更改（宽度同tabstop）
set softtabstop=-1                                                         " 自动与shiftwidth保持同步
set autoindent                                                             " 换行时候代码自动缩进
set smartindent                                                            " 启用智能对齐方式
set smarttab                                                               " 指定按一次backspace就删除shiftwidth宽度
set shiftround                                                             " 将缩进舍入为shiftwidth的倍数
set breakindent                                                            " 回绕行保持视觉上的缩进

" ----------------------------------------------------------------o--------------------------------------------------------------o

" Breakindent的扩展设定 ,min:保留最小的文本宽度,shift:回绕行的开始出右移指定数目的字符

if exists('&breakindent')
    set breakindentopt=shift:4,min:20
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Timeing Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set timeout ttimeout                                                       " 开启超时功能
set timeoutlen=500                                                         " 映射超时
set ttimeoutlen=10                                                         " 按键密码超时
set updatetime=400                                                         " 空闲时间以写入交换并触发CursorHold
set redrawtime=20000                                                       " 重画屏幕以毫秒计的时间

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Searching Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set ignorecase                                                             " 搜索模式里忽略大小写
set smartcase                                                              " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
set infercase                                                              " 补全模式忽略大小写
set incsearch                                                              " 查找输入时动态增量显示查找结果
set wrapscan                                                               " 开启循环搜索

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Complete Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set complete=.,w,b,k                                                       " 补全设置
set completeopt=menuone,menu,longest,preview                               " 自动补全

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Vim Behavior Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

filetype on                                                                " 启用文件类型侦测
filetype plugin on                                                         " 针对不同的文件类型加载对应的插件
filetype plugin indent on                                                  " 启用缩进
set fileencodings=utf-8,cp936,gb18030,big5,latin1                          " 探测即将打开的文件的字符编码
set fileencoding=utf-8                                                     " 打开文件的字符编码
set encoding=utf-8                                                         " Vim 内部使用的字符编码方式
set linebreak                                                              " 在breakat设定的字符上换行
set breakat=\ \	;:,!?                                                      " 换行符号设置
set backspace=indent,eol,start                                             " 删除键行为
set showbreak=↳                                                            " 设置换行符号
set diffopt=filler,internal,algorithm:histogram,indent-heuristic           " 更新diff配置
" set nostartofline                                                          " Cursor in same column for few commands
" set whichwrap+=h,l,<,>,[,],~                                               " Move to following line on certain keys
" set splitbelow splitright                                                  " Splits open bottom right
" set switchbuf=useopen                                                      " Look for matching window buffers first

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Editor UI Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

set re=1
set notitle                                                                " 无标题模式
set nowrap                                                                 " 设置不自动换行
set esckeys                                                                " 按Esc并立即退出插入模式
set modeline                                                               " 设置行模式用于在文件末尾添加特定字符检测vim文件类型
set t_RS=                                                                  " 设置获取终端样式
set t_SH=                                                                  " 设置获取终端样式
set hidden                                                                 " 针对buffer不保存即可切换
set noshowmode                                                             " 任务栏不显示状态
set shortmess=aoOTI                                                        " 避免文字信息提示
set scrolloff=6                                                            " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=6                                                        " 光标左右两侧最少保留的屏幕行数
set number                                                                 " 显示行号
set noruler                                                                " 右下角不显示光标位置
set showcmd                                                                " 显示命令
set showtabline=2                                                          " 永远显示标签页
set laststatus=2                                                           " 启用状态栏信息
set helpheight=12                                                          " 帮助文件最小高度
set previewheight=12                                                       " 预览窗口高度
set pumheight=15                                                           " 弹出窗口高度
set cmdheight=1                                                            " 设置命令行的高度为2，默认为1
set cursorline                                                             " 突出显示当前行
set helplang=cn                                                            " 帮助文件语言
set showmatch                                                              " 匹配模式,括号匹配
set hlsearch                                                               " 高亮搜索的关键字
set matchtime=2                                                            " 显示括号匹配的时间
set pythondll=                                                             " python3.6支持
set writebackup                                                            " 保存文件前建立备份，保存成功后删除该备份
set autoread                                                               " 当文件在外部被修改，自动更新该文件
set ambiwidth=single                                                       " 设置为双字宽显示默认值double

set wildmenu                                                               " 允许下方显示目录
set lazyredraw                                                             " 延迟绘制（提升性能）
set ttyfast                                                                " 刷新更快
set ttyscroll=3                                                            " 鼠标滚轮速度
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m                                " 错误格式
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<                        " 设置分隔符可视
set formatoptions+=j                                                       " 合并两行中文时，不在中间加空格
set fileformats=unix,dos,mac                                               " 文件换行符，默认使用 unix 换行符
set tags=./.tags;,.tags                                                    " 设置Tags

" set autochdir                                                              " 自动切换目录 
" set mouse=a                                                                " 启用鼠标
" set colorcolumn=+0                                                         " 高亮显示textwidth的最大宽度
" set noequalalways                                                          " 不要在拆分或关闭时调整窗口大小
" set display=lastline                                                       " 显示最后一行信息
" set list                                                                   " 显示隐藏字符
" set listchars=tab:\▏\ ,extends:⟫,precedes:⟪,nbsp:␣,trail:·                 " 设置特殊符号
" set wildmode=list:full                                                     " 长列表补全

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Fold Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has('folding') && has('vim_starting')
    set foldenable
    set foldmethod=manual                                                  " 启用手动折叠zf
    set foldcolumn=2                                                       " 侧边栏宽度
    set foldlevel=0                                                        " 设置折层所有内容
    set foldclose=all                                                      " 设置为折叠自动关闭
    set foldopen=all                                                       " 设置为折叠自动打开
    set foldnestmax=1                                                      " 设置 indent 和 syntax 方法的最大折叠嵌套层数
    set foldtext=<SID>NeatFoldText()

    " 自定义折叠样式
    
    function! s:NeatFoldText() 
        let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
        let lines_count = v:foldend - v:foldstart + 1
        let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
        let foldchar = matchstr(&fillchars, 'fold:\zs.')
        let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
        let foldtextend = lines_count_text . repeat(foldchar, 8)
        let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
        return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
    endfunction
endif

" 空格打开关闭折叠视图(在光标自动打开关闭折叠的情况下)
nnoremap <expr> <Space> &foldlevel ? 'zM' :'zR'                            

" 空格打开关闭折叠视图
vnoremap <Space> zf                                                        

" 空格打开关闭折叠视图(在不自动打开关闭折叠的情况下)
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>                                    

"=================================================================================================================================
"
"                                                             Termianl
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 内部终端颜色设置
" ----------------------------------------------------------------o--------------------------------------------------------------o

" 判断是什么终端模拟器运行的Vim

if $GET_TERMINAL_NAME == "st"
	set t_Co=256
	set termguicolors
	set term=st-256color
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
elseif $GET_TERMINAL_NAME == "urxvt" || $GET_TERMINAL_NAME == "tmux: server"
    set t_ut=
    set term=xterm-256color
	set t_Co=256
	set termguicolors
    let g:onedark_termcolors=16
elseif $GET_TERMINAL_NAME == "xterm"
	set t_Co=256
	set termguicolors
endif

" 内部终端颜色自定义

if has('nvim')
    let g:terminal_color_0 = "#282C34"
    let g:terminal_color_1 = "#E06C75"
    let g:terminal_color_2 = "#98C379"
    let g:terminal_color_3 = "#D19A66"
    let g:terminal_color_4 = "#61AFEF"
    let g:terminal_color_5 = "#C678DD"
    let g:terminal_color_6 = "#56B6C2"
    let g:terminal_color_7 = "#DCDFE4"
    let g:terminal_color_8 = "#282C34"
    let g:terminal_color_9 = "#E06C75"
    let g:terminal_color_10= "#98C379"
    let g:terminal_color_11= "#D19A66"
    let g:terminal_color_12= "#61AFEF"
    let g:terminal_color_13= "#C678DD"
    let g:terminal_color_14= "#56B6C2"
    let g:terminal_color_15= "#DCDFE4"
else
    let g:terminal_ansi_colors = repeat([0], 16)
    let g:terminal_ansi_colors[0]  = "#282C34" " black
    let g:terminal_ansi_colors[8]  = "#3E4452" " black bright
    let g:terminal_ansi_colors[1]  = "#E06C75" " red
    let g:terminal_ansi_colors[9]  = "#BE5046" " red bright
    let g:terminal_ansi_colors[2]  = "#98C379" " green
    let g:terminal_ansi_colors[10] = "#98C379" " green bright
    let g:terminal_ansi_colors[3]  = "#E5C07B" " yellow
    let g:terminal_ansi_colors[11] = "#D19A66" " yellow bright
    let g:terminal_ansi_colors[4]  = "#61AFEF" " blue
    let g:terminal_ansi_colors[12] = "#61AFEF" " blue bright
    let g:terminal_ansi_colors[5]  = "#C678DD" " magenta
    let g:terminal_ansi_colors[13] = "#C678DD" " magenta bright
    let g:terminal_ansi_colors[6]  = "#56B6C2" " cyan
    let g:terminal_ansi_colors[14] = "#56B6C2" " cyan bright
    let g:terminal_ansi_colors[7]  = "#5C6370" " white
    let g:terminal_ansi_colors[15] = "#ABB2BF" " white bright
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 终端下允许 ALT 记得设置 ttimeout （见 init-basic.vim） 和 ttimeoutlen （上面）
" ----------------------------------------------------------------o--------------------------------------------------------------o

if has('nvim') == 0 && has('gui_running') == 0
	function! s:metacode(key)
		exec "set <M-".a:key.">=\e".a:key
	endfunc
	for i in range(10)
		call s:metacode(nr2char(char2nr('0') + i))
	endfor
	for i in range(26)
		call s:metacode(nr2char(char2nr('a') + i))
		call s:metacode(nr2char(char2nr('A') + i))
	endfor
	for c in [',', '.', '/', ';', '{', '}']
		call s:metacode(c)
	endfor
	for c in ['?', ':', '-', '_', '+', '=', "'"]
		call s:metacode(c)
	endfor
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 终端下功能键设置
" ----------------------------------------------------------------o--------------------------------------------------------------o

function! s:key_escape(name, code)
    if has('nvim') == 0 && has('gui_running') == 0
        exec "set ".a:name."=\e".a:code
    endif
endfunc

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 功能键终端码矫正
" ----------------------------------------------------------------o--------------------------------------------------------------o

call s:key_escape('<F1>', 'OP')
call s:key_escape('<F2>', 'OQ')
call s:key_escape('<F3>', 'OR')
call s:key_escape('<F4>', 'OS')
call s:key_escape('<S-F1>', '[1;2P')
call s:key_escape('<S-F2>', '[1;2Q')
call s:key_escape('<S-F3>', '[1;2R')
call s:key_escape('<S-F4>', '[1;2S')
call s:key_escape('<S-F5>', '[15;2~')
call s:key_escape('<S-F6>', '[17;2~')
call s:key_escape('<S-F7>', '[18;2~')
call s:key_escape('<S-F8>', '[19;2~')
call s:key_escape('<S-F9>', '[20;2~')
call s:key_escape('<S-F10>', '[21;2~')
call s:key_escape('<S-F11>', '[23;2~')
call s:key_escape('<S-F12>', '[24;2~')

"=================================================================================================================================
"
"                                                         GENERAL - Mapping
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Leader & LocalLeader Settings
" ----------------------------------------------------------------o--------------------------------------------------------------o

let mapleader="\\"
let maplocalleader = ";"

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Disable Keymap
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap q <nop>
vnoremap q <nop>

nnoremap <C-f> <nop>
nnoremap <C-b> <nop>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 映射补全 Keymap
" ----------------------------------------------------------------o--------------------------------------------------------------o

inoremap <expr> <Up> pumvisible() ?"\<C-p>":"\<Up>"
inoremap <expr> <Down> pumvisible() ?"\<C-n>":"\<Down>"

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Keep Search Pattern At The Center Of The Screen.
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent> n nzz
nnoremap <silent> N Nzz

nnoremap <silent> { {zz
nnoremap <silent> } }zz

nnoremap <silent> ( (zz
nnoremap <silent> ) )zz

nnoremap <silent> [[ [[zz
nnoremap <silent> ]] ]]zz

nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz

" nnoremap <silent> <C-b> <C-b>zz
" nnoremap <silent> <C-f> <C-f>zz

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Clear Highlighted Search
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent> <SPACE> :nohlsearch<Return>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Yank
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap Y y$

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Go To Home And End Using Capitalized Directions
" ----------------------------------------------------------------o--------------------------------------------------------------o

" nnoremap <C-a> ^
" nnoremap <C-e> $

" ----------------------------------------------------------------o--------------------------------------------------------------o
" SuperF/f-T/t
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <CR> ;
nnoremap <BS> ,

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Mapping %
" ----------------------------------------------------------------o--------------------------------------------------------------o

" nnoremap <LocalLeader><Space> %

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Scroll Step Sideways
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap zl z4l
nnoremap zh z4h

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Yank Buffer's Relative/Absolute Path To Clipboard
" ----------------------------------------------------------------o--------------------------------------------------------------o

" nnoremap <Leader>Y :let @+= expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
" nnoremap <Leader>y :let @+= expand("%:p")<CR>:echo 'Yanked absolute path'<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Select last paste
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Re-Select Blocks After Indenting In Visual/Select Mode
" ----------------------------------------------------------------o--------------------------------------------------------------o

xnoremap < <gv
xnoremap > >gv|

xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv

nmap >>  >>_
nmap <<  <<_

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Smart wrap toggle (breakindent and colorcolumn toggle as-well)
" ----------------------------------------------------------------o--------------------------------------------------------------o

" nmap <Leader>tw :execute('setlocal wrap! breakindent!')<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Jumps
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap g; g;zz
nnoremap g, g,zz

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 跨终端粘贴 
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><localleader>y "+yy
vnoremap <silent><localleader>y "+y

nnoremap <silent><localleader>p "+p
vnoremap <silent><localleader>p "+p

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Ctrl + h j k l 切换窗口快捷键设置  
"-----------------------------------------------------------------o--------------------------------------------------------------o

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

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Shift + Up Down 快速移动整行  
"-----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><S-Up>   :m-2<CR>==
nnoremap <silent><S-Down> :m+<CR>==
inoremap <silent><S-Up>   <Esc>:m-2<CR>==gi
inoremap <silent><S-Down> <Esc>:m+<CR>==gi
vnoremap <silent><S-Up>   :m-2<CR>gv=gv
vnoremap <silent><S-Down> :m'>+<CR>gv=gv

"-----------------------------------------------------------------o--------------------------------------------------------------o
" LocalLeader + d  快速复制行
"-----------------------------------------------------------------o--------------------------------------------------------------o

" nnoremap <LocalLeader>d m`YP``<esc>
" vnoremap <LocalLeader>d YPgv<esc>

"-----------------------------------------------------------------o--------------------------------------------------------------o
" F2 行号开关，用于鼠标复制代码用
"-----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><F2> :call <SID>HideNumber()<CR>
function! s:HideNumber()
    if(&number == 1)
        set nonumber
    else
        set number
    endif
endfunc

"-----------------------------------------------------------------o--------------------------------------------------------------o
" CTRL + N 切换相对行号和绝对行号
"-----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><C-n> :call <SID>NumberToggle()<cr>
function! s:NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc

"-----------------------------------------------------------------o--------------------------------------------------------------o
" F3 语法开关，关闭语法可以加快大文件的展示
"-----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><F3>
    \ :if exists("syntax_on") <BAR>
    \    syntax off <BAR>
    \ else <BAR>
    \    syntax enable <BAR>
    \ endif<CR>

"-----------------------------------------------------------------o--------------------------------------------------------------o
" F4 粘贴模式开关
"-----------------------------------------------------------------o--------------------------------------------------------------o

set pastetoggle=<F4>     

"-----------------------------------------------------------------o--------------------------------------------------------------o
" F8 切换边界线（80）
"-----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent> <F8> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" F10 搜索光标下的单词并以Previews显示
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <F10> :<C-u>psearch <C-r>=expand("<cword>")<CR><CR>

"=================================================================================================================================

"=================================================================================================================================
"
"                                                         GENERAL - Aliases
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Allow misspellings - Cabbrev
" ----------------------------------------------------------------o--------------------------------------------------------------o

" cabbrev tab Tabularize

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Allow misspellings - Cnoreabbrev
" ----------------------------------------------------------------o--------------------------------------------------------------o

cnoreabbrev qw wq
cnoreabbrev qq wq
cnoreabbrev wQ wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Qa qa
cnoreabbrev q1 q!

"=================================================================================================================================
"
"                                                         GENERAL - Autocmd
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 如果鼠标不动,检查是否有缓冲区在 Vim 之外被改变,如果改变就会出现提示
" ----------------------------------------------------------------o--------------------------------------------------------------o

augroup AutoRead
    autocmd!
    autocmd CursorHold * silent! checktime
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 如果显示QuickFix窗口,那么隐藏行编号,并设置行高为6
" ----------------------------------------------------------------o--------------------------------------------------------------o

augroup QuickFix
    autocmd!
	autocmd FileType qf setlocal nonumber
	autocmd FileType qf 6wincmd_
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 打开文件时恢复上一次光标所在位置
" ----------------------------------------------------------------o--------------------------------------------------------------o

augroup ReadCur
    autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 自动保存及读取view设置
" ----------------------------------------------------------------o--------------------------------------------------------------o

augroup AutoSaveView
	autocmd!
	autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre * nested silent! mkview! 
	autocmd BufWinEnter * silent! loadview                                              
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 自动关闭预览窗口
" ----------------------------------------------------------------o--------------------------------------------------------------o

augroup AutoClosePreview
    autocmd!
    autocmd CursorMoved,CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif  
augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 加速语法渲染
" ----------------------------------------------------------------o--------------------------------------------------------------o

" augroup AutoSyntax
"     autocmd!
"     autocmd Syntax * syn sync clear | syntax sync minlines=10 | syntax sync maxlines=10
" augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 根据文件类型采用自定义行为
" ----------------------------------------------------------------o--------------------------------------------------------------o

" Markdown
autocmd FileType markdown,vimwiki setlocal textwidth=80 formatoptions+=tnmMltr] formatoptions-=1cj

"=================================================================================================================================

"=================================================================================================================================
"
"                                                         GENERAL - Fuction
"
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Quickly close the current window
" ----------------------------------------------------------------o--------------------------------------------------------------o

" function! MyBufferClose()
"     let curbid = '%'
"     let allwinid = winnr('$')
"     let allbid = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
"     let is_empty_buffer = (bufname(curbid) == '') && !getbufvar(curbid, '&modified')
"     let qflist =  get(getqflist({'winid':0}), 'winid', 0)
"     let loclist = get(getloclist(0, {'winid':0}), 'winid', 0)
"     let allfiletype =  getbufvar(bufnr('$'), '&filetype')
"     let curfiletype =  getbufvar(bufnr('%'), '&filetype')
"     let allmod = len(filter(getbufinfo(), 'v:val.changed == 1'))
"     let tagbar_open = bufwinnr('__Tagbar__') != -1
"     let term = getbufvar(bufnr('$'), '&buftype') == "terminal"
"     let term_cur = getbufvar(bufnr('%'), '&buftype') == "terminal"
"     if exists('t:NERDTreeBufName')
"         let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
"     else
"         let nerdtree_open = 0
"     endif

"     if loclist > 1
"         execute "lclose"
"     elseif qflist > 1
"         execute "cclose"
"     elseif term == 1 && term_cur == 0
"         call feedkeys("\<C-\>")
"         call feedkeys("\<C-W>c")
"     elseif term == 1 && term_cur == 1
"         call feedkeys("\<C-W>c")
"     elseif nerdtree_open
"         execute "NERDTreeClose"
"     elseif tagbar_open
"         execute "TagbarClose"
"     elseif allwinid > 1 && allfiletype == 'help' && curfiletype == 'vim'
"         execute "close"
"     elseif allbid >= 2 && allmod >= 1
"         execute "silent bm!" | redraw
"         let file = expand('%:P')
"         try
"             if (confirm("将改变保存到 "  . file . '？' , "&Yes\n&No" , 2)==1) | redraw
"                 execute "w!"
"                 execute "silent bnext!"
"                 execute "bdelete#"
"             else
"                 execute "edit!"
"             endif
"         endtry
"     elseif allbid >= 2 && allmod == 0
"         try
"             execute "bnext!"
"             execute "bdelete#"
"         endtry
"     elseif allbid == 1 && allmod >= 1
"         execute "confirm q"
"     elseif allbid == 1 && allmod == 0
"         execute "q"
"     endif
" endfunction

" nnoremap <silent><localleader>q :Sayonara<cr>
" inoremap <silent><localleader>q <Esc>:Sayonara<cr>
" vnoremap <silent><localleader>q <Esc>:Sayonara<cr>

"=================================================================================================================================
" Custom Jump List 
"=================================================================================================================================

" if exists('g:loaded_rel_jump')
"     finish
" endif
" let g:loaded_rel_jump = 1

" if !exists('g:rel_jump_min_distance')
"     let g:rel_jump_min_distance = 2
" endif

" if !exists('g:rel_jump_first_char')
"     let g:rel_jump_first_char = 0
" endif

" function! RelJump(key)
"     let distance = v:count1
"     if distance >= g:rel_jump_min_distance
" 	exec "normal! m'"
"     endif
"     exec "normal! ".distance.a:key
"     if g:rel_jump_first_char && distance >= g:rel_jump_min_distance
" 	exec "normal! ^"
"     endif
" endfunction

" nnoremap <silent> j :<C-U>call RelJump('j')<CR>
" nnoremap <silent> k :<C-U>call RelJump('k')<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Quickly Save the current window
" ----------------------------------------------------------------o--------------------------------------------------------------o

if exists('*MySave')
     finish
 endif
 
function! s:MySave()
    let cantSave = "redraw | echohl ErrorMsg | echo \"Can't save the file: \" . v:exception | return | echohl None"
    let notSaved = "redraw | echohl ErrorMsg | echo 'This buffer was NOT saved!' | return | echohl None"
    let time = strftime("%T")
    let file = expand('%:P')
    let permissions = getfperm(file)
        try
            silent w
        catch /:E45:\|:E505:\|:E212:/
            if (confirm("This Buffer is read only! Wanna save it anyway?", "&Yes\n&No", 2)==1)
                redraw
                try | silent w! | catch /:E212:/ |
                    if (confirm("Can't open the file, do you want to save it as Root?", "&Yes\n&No", 2)==1)
                        try | execute 'silent! write !sudo tee % >/dev/null' | edit! | catch | exe cantSave | endtry
                    else
                        exe notSaved
                    endif
                catch
                    exe cantSave
                endtry
            else
                exe notSaved
            endif
        endtry
    redraw
    echom '"' . file . '"' . " Save Done" . ' ' . time
    redraw
    echohl None
endfunction

nnoremap <silent><localleader>w :call <SID>MySave()<CR>
vnoremap <silent><localleader>w <ESC>:call <SID>MySave()<CR>
inoremap <silent><localleader>w <ESC>:call <SID>MySave()<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Quickly Rename current Files
" ----------------------------------------------------------------o--------------------------------------------------------------o

function! s:ReName()
    let old_name = expand('%')
    let new_name = input('Rename files name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        try
            execute 'saveas ' . new_name
            call delete(expand('#'))
            execute "bdelete#"
            redraw!
        catch /:E13:/
            echohl ErrorMsg | echo " The file name already exists" | echohl None| redraw
        endtry
    else
        echohl ErrorMsg | echo " Not Changed Filename!" | echohl None| redraw
    endif
endfunction

nnoremap <Localleader>n :call <SID>ReName()<CR>
vnoremap <Localleader>n <ESC>:call <SID>ReName()<CR>
inoremap <Localleader>n <ESC>:call <SID>ReName()<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Simple zoom toggle
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent><LocalLeader>z :call <SID>Zoom()<CR>
function! s:Zoom()
    if exists('t:zoomed')
        unlet t:zoomed
        wincmd =
    else
        let t:zoomed = { 'nr': bufnr('%') }
        vertical resize
        resize
        normal! ze
    endif
endfunction

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Append modeline after last line in buffer
" ----------------------------------------------------------------o--------------------------------------------------------------o

nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>
function! s:append_modeline() 
	let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
            \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
	call append(line('$'), l:modeline)
endfunction

"=================================================================================================================================
"                                                                                                                                
"                                                              插件管理器                                                          
"                                                                                                                                
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Vim-Plug-AutoSync 
" ----------------------------------------------------------------o--------------------------------------------------------------o

au VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | qa!
    \| endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Vim-Plug-Config   
" ----------------------------------------------------------------o--------------------------------------------------------------o

let g:plug_url_format = 'https://hub.fastgit.xyz/%s.git'
" let g:plug_url_format = 'https://github.com/%s.git'
" let g:plug_url_format = 'https://github.com.cnpmjs.org/%s.git'

call plug#begin('$HOME/.vim/plugged')
Plug 'laggardkernel/vim-one'                                             " 主题文件
Plug 'joshdick/onedark.vim', { 'branch': 'main'  }                       " 主题文件
Plug 'vim-airline/vim-airline'                                           " 状态栏
Plug 'airblade/vim-gitgutter'                                            " git插件
Plug 'tpope/vim-fugitive'                                                " git插件
Plug 'tpope/vim-commentary'                                              " 快速注释插件
Plug 'tpope/vim-surround'                                                " 成对更改删除括号等
Plug 'tpope/vim-rsi'                                                     " 更改编辑方式为Emac模式
Plug 'tpope/vim-repeat'                                                  " 重复键插件
Plug 'tpope/vim-unimpaired'                                              " 括号功能键映射
Plug 'neomake/neomake'                                                   " 语法检查
Plug 'junegunn/fzf.vim'                                                  " 为vim安装fzf插件
Plug 'junegunn/fzf' , { 'dir': '~/.fzf', 'do': './install --all' }       " 为系统安装fzf工具
Plug 'junegunn/goyo.vim'                                                 " 专注模式
Plug 'junegunn/limelight.vim'                                            " 专注模式辅助
Plug 'mhinz/vim-startify'                                                " 定制vim开始页面
Plug 'mhinz/vim-sayonara'                                                " 代替 command q 插件
Plug 'scrooloose/nerdtree'                                               " 文件树插件
Plug 'Xuyuanp/nerdtree-git-plugin'                                       " 文件数git显示插件
Plug 'godlygeek/tabular' , { 'on': 'Tabularize'}                         " 文本对齐插件
Plug 'dhruvasagar/vim-table-mode' , { 'on': 'TableModeToggle' }          " 表格模式
Plug 'majutsushi/tagbar' , { 'on': 'TagbarToggle' }                      " Tag浏览
Plug 'preservim/vimux'                                                   " 配合Tmux运行程序的插件
Plug 'skywind3000/asyncrun.vim'                                          " 配合调测python插件
Plug 'skywind3000/asyncrun.extra'                                        " 异步运行扩展
Plug 'skywind3000/vim-auto-popmenu'                                      " 自动弹出补全插件
Plug 'christoomey/vim-tmux-navigator'                                    " 同步vim与tmux快捷键
Plug 'Yggdroot/indentLine'                                               " 缩进线显示插件
Plug 'vimwiki/vimwiki' , {'branch': 'dev' }                              " Vimwiki插件
Plug 'jszakmeister/markdown2ctags'                                       " Tags的Toc插件
Plug 'michal-h21/vim-zettel'                                             " 配合vimwiki的功能插件
Plug 'liuchengxu/vim-which-key'                                          " Leader辅助
Plug 'kshenoy/vim-signature'                                             " 书签插件
Plug 'yianwillis/vimcdoc'                                                " 中文帮助
Plug 'voldikss/vim-floaterm'                                             " 终端插件
Plug 'jiangmiao/auto-pairs'                                              " 成对添加括号等
Plug 'rlue/vim-barbaric'                                                 " 输入法切换插件
Plug 'thinca/vim-fontzoom'                                               " 快捷键调整字体大小
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                      " 多光标输入
Plug 'TaDaa/vimade'                                                      " 非聚焦窗口颜色变浅
Plug 'brooth/far.vim'                                                    " 代码重构
if has("python3")
    Plug 'SirVer/ultisnips'                                              " 代码片段管理器
    Plug 'hantaotaohan/vim-snippets'                                     " 代码片段仓库
endif
" Plug 'ferrine/md-img-paste.vim'                                          " Markdown截图自动粘贴
" Plug 'ludovicchabant/vim-gutentags'                                      " Tags管理
" Plug 'smkent/vim-pipe-preview'                                           " 终端预览Markdown插件
" Plug 'vim-scripts/AnsiEsc.vim'                                           " 终端预览Markdown插件
" Plug 'iamcco/markdown-preview.nvim' , { 'do': 'cd app && yarn install' } " MarkdownPreview插件
" Plug 'chriskempson/base16-vim'                                           " Themes
" Plug 'arcticicestudio/nord-vim'                                          " Themes
" Plug 'tpope/vim-eunuch'                                                  " 使用Linux内置命令
" Plug 'vim-scripts/fcitx.vim'                                             " 输入法自动切换Fcitx
" Plug 'hotoo/pangu.vim'                                                   " 中文排版
" Plug 'Yggdroot/LeaderF' , { 'on': ['LeaderFile!','LeaderfFunction!'] }   " 模糊搜索
" Plug 'rhysd/clever-f.vim'                                                " 增强搜索功能
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                          " 补全插件
" Plug 'Lenovsky/nuake'                                                    " 快速启动命令行工具
" Plug 'MattesGroeger/vim-bookmarks'                                       " 书签插件
" Plug 'vim-airline/vim-airline-themes'                                    " 状态栏主题
" Plug 'Neur1n/neuims'                                                     " 输入法自动切换 
" Plug 'arecarn/vim-auto-autoread'                                         " 自动Autoread插件
" Plug 'junegunn/vim-easy-align'                                           " 自动对齐插件
" Plug 'mg979/vim-visual-multi'                                            " 多光标插件
" Plug 'morhetz/gruvbox'                                                   " Themes
" Plug 'rakr/vim-one'                                                      " Themes
" Plug 'tyrannicaltoucan/vim-deep-space'                                   " Themes
" Plug 'terryma/vim-multiple-cursors'                                      " 多光标插件
" Plug 'edkolev/tmuxline.vim'                                              " Vim同步tmux配色
" Plug 'scrooloose/nerdcommenter'                                          " 快速注释插件
call plug#end()

"=================================================================================================================================
"                                                          主题及颜色配置 
"=================================================================================================================================

" ----------------------------------------------------------------o--------------------------------------------------------------o
"  Themes Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

if !empty(glob('$HOME/.vim/plugged/onedark.vim/'))
    colorscheme onedark                                                      " 终端配色方案
    set background=dark                                                      " 开启深色模式
endif

" ----------------------------------------------------------------o--------------------------------------------------------------o
"  Height Settings ...
" ----------------------------------------------------------------o--------------------------------------------------------------o

hi Search            term=standout  cterm=bold  ctermfg=235  ctermbg=204  guifg=#282C34  guibg=#E06C75   " 搜索高亮自定义
hi IncSearch         term=standout  cterm=bold  ctermfg=1    ctermbg=1    guifg=#282C34  guibg=#E06C75   " 搜索行高亮自定义 
hi Folded            term=standout  cterm=bold  ctermfg=0    ctermbg=5    guifg=#282c34  guibg=#80868F   " 折叠提示颜色
hi QuickFixLine      term=standout  cterm=bold  ctermfg=235  ctermbg=180  guifg=#ABB2BF  guibg=#282C34   " 快速栏颜色
hi SignColumn        term=standout  cterm=bold  ctermfg=2    ctermbg=2    guifg=#E06C75  guibg=#282C34   " 标签栏颜色
hi DiffDelete        term=standout  cterm=bold  ctermfg=235  ctermbg=204  guifg=#E06C75  guibg=#E06C75   " 差异删除颜色
hi CursorLineNr      term=standout  cterm=bold  ctermfg=145  ctermbg=236  guifg=#61AFEF  guibg=#282C34   " 当前光标行序号栏颜色
hi Cursor            term=standout  cterm=bold  ctermfg=0    ctermbg=7    guifg=#282C34  guibg=#ABB2BF   " 当前光标颜色
hi FoldColumn        term=standout  cterm=bold  ctermfg=0    ctermbg=5    guifg=#ABB2BF  guibg=#282C34   " 折叠边栏提示颜色

"=================================================================================================================================
"                                                                                                                                
"                                                            各类插件设置                                                       
"                                                                                                                                
"=================================================================================================================================

"=================================================================================================================================
" Airline
"=================================================================================================================================

if exists('g:plugs["vim-airline"]')
	let g:airline_theme='onedark'                                            " 设置状态栏主题默认powerlineish
	let g:airline_experimental = 1
	let g:airline_detect_modified=1
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
	let g:airline#extensions#tagbar#enabled = 0
	let g:airline#extensions#fzf#enabled = 1                                 " 启用FZF集成
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
    let g:airline#extensions#default#section_use_groupitems = 1

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
	let g:airline#extensions#tabline#show_splits = 0                         " 启用/禁用显示每个选项卡的打开拆分（仅在打开选项卡时）
	let g:airline#extensions#tabline#exclude_preview = 0                     " 在选项行中启用/禁用显示预览窗口缓冲区。
	let g:airline#extensions#tabline#alt_sep = 0
	let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
	let g:airline#extensions#tabline#tabnr_formatter = 'tabnr'
	let g:airline#extensions#tabline#show_tab_nr = 0
	let g:airline#extensions#tabline#show_tab_type = 1
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline#extensions#tabline#middle_click_preserves_windows = 0      " 从缓冲区关闭时保留窗口
    let g:airline#extensions#tabline#ignore_bufadd_pat = '!|floaterm|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'
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

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 定义要显示的名称集，而不是特定的文件类型
" ----------------------------------------------------------------o--------------------------------------------------------------o

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

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 自定义airline c x z 区域的各项功能
" ----------------------------------------------------------------o--------------------------------------------------------------o

	function! s:AirlineInit()
        let g:airline_section_b = airline#section#create(['branch', ' ', 'hunks'])
        let g:airline_section_c = airline#section#create(['readonly', '  ', 'path'])
        let g:airline_section_x = airline#section#create([''])
        let g:airline_section_y = airline#section#create(['%t'])
        let g:airline_section_z = airline#section#create([' %P%   ', '%l' , ':%3v'])
	endfunction

    augroup AleRedrawStatus
        autocmd!
        autocmd User AirlineAfterInit call <SID>AirlineInit()
        autocmd WinEnter * AirlineRefresh
    augroup END

" ----------------------------------------------------------------o--------------------------------------------------------------o
" Path Terminal
" ----------------------------------------------------------------o--------------------------------------------------------------o

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


" ----------------------------------------------------------------o--------------------------------------------------------------o
" Symbols
" ----------------------------------------------------------------o--------------------------------------------------------------o

	if !exists('g:airline_symbols')
        let g:airline_symbols = {}
        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = ''
        let g:airline_symbols.branch = ''
        let g:airline_symbols.readonly = 'RO'
        let g:airline_symbols.linenr = ''
        let g:airline_symbols.maxlinenr = ''
        let g:airline_symbols.dirty = ' ●'
        let g:airline_symbols.modified = '+'
	endif

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Airline  切换Buffers/Tabs快捷键设置 
"-----------------------------------------------------------------o--------------------------------------------------------------o

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

"=================================================================================================================================
" NERDTree 插件配置
"=================================================================================================================================

if exists('g:plugs["nerdtree"]')

    nnoremap <silent><localleader>e :call <SID>NERDTreetoggle()<CR> 
    inoremap <silent><localleader>e <Esc> :call <SID>NERDTreetoggle()<CR> 

    function! s:NERDTreetoggle()                                    
        if &filetype == 'nerdtree'                                  
            NERDTreeToggle %p:h                                     
        else                                                        
            silent! NERDTreeFind                                            
        endif                                                       
    endfunction                                                     

" ----------------------------------------------------------------o--------------------------------------------------------------o

    let g:NERDTreeAutoCenter = 1                                              " 光标居中
    let g:NERDTreeAutoCenterThreshold = 1                                     " 控制自动居中灵敏度
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
    let g:NERDTreeDirArrowExpandable = '◆'                                    " 设置树的显示图标
    let g:NERDTreeDirArrowCollapsible = '◇'                                   " 设置树的显示图标
    " let NERDTreeSortOrder=[1]                                               " 排序设置0 or 1
    " let NERDTreeCreatePrefix='silent keepalt keepjumps readonly'

    hi NERDTreeDirSlash           term=bold  ctermfg=0 
    hi NERDTreeExecFile           term=bold  ctermfg=1
    hi NERDTreeLinkTarget         term=bold  ctermfg=8
    hi NERDTreeBookmarksLeader    term=bold  ctermfg=8
    hi NERDTreeBookmark           term=bold  ctermfg=0

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 当NERDTree为剩下的唯一窗口时自动关闭 , 屏蔽;s ;c
" ----------------------------------------------------------------o--------------------------------------------------------------o

    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>s <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>c <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^NERD_tree_" | map <buffer><Localleader>w <Esc>| endif

endif

"=================================================================================================================================
" MarkdownPreview插件配置
"=================================================================================================================================

if exists('g:plugs["markdown-preview.nvim"]')

    " MarkdownPreviewToggle
    nmap <Leader>e <Plug>MarkdownPreviewToggle

    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开  markdown 文件的时候打开一次
    let g:mkdp_auto_start = 0

    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不  自动关闭预览窗口
    let g:mkdp_auto_close = 1

    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时  更新预览
    let g:mkdp_refresh_slow = 0

    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown  文件可以使用改命令
    let g:mkdp_command_for_global = 1

    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面  默认只监听本地（127.0.0.1），其他计算机不能访问
    let g:mkdp_open_to_the_world = 1

    " 使用自定义IP打开预览页面在远程vim中工作并在本地浏览器上预览时很有用
    let g:mkdp_open_ip = ''

    " 指定浏览器以打开预览页面
    let g:mkdp_browser = 'microsoft-edge'

    " 设置为1时，打开预览页时在命令行中回显预览页网址
    let g:mkdp_echo_preview_url = 1

    " 自定义vim函数名称以打开预览页面 此函数将接收url作为参数
    let g:mkdp_browserfunc = ''

    " 设置markdowncss和highdark paht
    let g:mdpath='/home/taotao/.vim/vim_preview_markdown/onedark/'

    " use a custom markdown style must be absolute path
    let g:mkdp_markdown_css = g:mdpath . 'onedark.css'

    " use a custom highlight style must absolute path
    let g:mkdp_highlight_css = g:mdpath . 'highdark.css'

    " 使用自定义端口启动服务器，或使用随机端口将其清空
    let g:mkdp_port = '8888'

    " “预览页面标题 ${name} 将被替换为文件名
    let g:mkdp_page_title = '「${name}」'

    " 渲染的选项
    let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {}
        \ }

endif

"=================================================================================================================================
" Vim-table-mode 插件配置
"=================================================================================================================================

if exists('g:plugs["vim-table-mode"]')
    let g:table_mode_corner = '|'
endif

"=================================================================================================================================
" Tagbar   
"=================================================================================================================================

if exists('g:plugs["tagbar"]')

    " ;t打开关闭Tagbar
    nnoremap <silent><localleader>t :TagbarToggle<CR>:AirlineRefresh<CR>
    inoremap <silent><localleader>t <Esc>:TagbarToggle<CR>:AirlineRefresh<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o

    let g:tagbar_autofocus = 1                                                " 焦点自动聚焦到Tagbar
    let g:tagbar_autoclose = 1
    let g:tagbar_autopreview = 0
    let g:tagbar_no_autocmds = 0
    let g:tagbar_autoclose_netrw = 1
    let g:tagbar_jump_lazy_scroll = 1
    let g:tagbar_use_cache = 1
    let g:tagbar_sort = 0
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

" ----------------------------------------------------------------o--------------------------------------------------------------o
" 当 Tagbar 剩下的唯一窗口时自动关闭 , 屏蔽;s ;c
" ----------------------------------------------------------------o--------------------------------------------------------------o

    autocmd BufEnter * if (winnr("$") == 1 && bufname('#') =~# "^__Tagbar__") | q | endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>s <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>c <Esc>| endif
    autocmd BufEnter * if bufname('%') =~# "^__Tagbar__" | map <buffer><Localleader>w <Esc>| endif

endif

"=================================================================================================================================
" Markdown2-Ctags
"=================================================================================================================================

if exists('g:plugs["markdown2ctags"]')

    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : '$HOME/.vim/markdown2ctags.py', 
        \ 'ctagsargs' : '-f - --sort=yes --sro=»',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '»',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
        \ }

    let g:tagbar_type_vimwiki = {
        \   'ctagstype':'vimwiki'
        \ , 'kinds':['h:header']
        \ , 'sro':'&&&'
        \ , 'kind2scope':{'h':'header'}
        \ , 'sort':0
        \ , 'ctagsbin':'$HOME/.vim/vimwiki2ctags.py'
        \ , 'ctagsargs': 'markdown'
        \ }

endif

"=================================================================================================================================
" FZF
"=================================================================================================================================

if exists('g:plugs["fzf.vim"]')

    nnoremap <silent><LocalLeader>fa :Files<CR>
    nnoremap <silent><LocalLeader>ff :GFiles<CR>
    nnoremap <silent><LocalLeader>fl :BLines<CR>
    nnoremap <silent><LocalLeader>fo :Colors<CR>
    nnoremap <silent><LocalLeader>fr :Rg<Cr>

    " 禁用浮动窗口
    let g:fzf_layout = { 'down':'40%' }

endif

"=================================================================================================================================
" Asyncru
"=================================================================================================================================

if exists('g:plugs["asyncrun.vim"]')

    let g:asyncrun_open = 6

    nnoremap <silent><F7> :silent call asyncrun#quickfix_toggle(6)<cr>
    inoremap <silent><F7> <esc> :silent call asyncrun#quickfix_toggle(6)<cr>

"-----------------------------------------------------------------o--------------------------------------------------------------o

    nnoremap <F5> :call <SID>RunCode()<cr>
    nnoremap <silent><localleader>r :call <SID>RunCode()<cr>
    inoremap <silent><localleader>r <esc>:call <SID>RunCode()<cr>
    vnoremap <silent><localleader>r <esc>:call <SID>RunCode()<cr>

    function! s:RunCode()
        exec "w"
        let fm = expand('%:p:h')
        if exists('$TMUX')
            if &filetype == 'python'
                exec 'AsyncRun -mode=term -pos=tmux -cwd=$(VIM_FILEDIR) python3 "$(VIM_FILEPATH)"'
            elseif &filetype == 'sh'
                exec "AsyncRun -mode=term -pos=tmux -focus=0 time bash %"
            elseif &filetype == 'java'
                execute 'AsyncRun -mode=term -pos=tmux -focus=0 -cwd=<root> javac "$(VIM_RELNAME)" ; java $(VIM_FILENOEXT)'
            elseif &filetype == 'javascript'
                exec "AsyncRun -mode=term -pos=tmux -rows=10 -focus=0 time node %"
            endif
        else
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
        endif
    endfunction

"-----------------------------------------------------------------o--------------------------------------------------------------o

    nnoremap <silent><localleader>dj :call <SID>Django()<cr>
    inoremap <silent><localleader>dj <esc>:call <SID>Django()<cr>
    vnoremap <silent><localleader>dj <esc>:call <SID>Django()<cr>

    function! s:Django()
        exec "w"
        if exists('$TMUX')
            if &filetype == 'python' && filereadable(globpath(asyncrun#get_root('%'),'manage.py'))
                exec 'AsyncRun -cwd=<root> -mode=term -pos=tmux python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver'
            endif
        else
            if &filetype == 'python' && filereadable(globpath(asyncrun#get_root('%'),'manage.py'))
                exec 'AsyncRun -cwd=<root> -mode=term -pos=bottom python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver'
                exec "wincmd p"
            endif
        endif
    endfunction

"-----------------------------------------------------------------o--------------------------------------------------------------o

    nnoremap <silent><localleader>dd :call <SID>Django_Dev()<cr>
    inoremap <silent><localleader>dd <esc>:call <SID>Django_Dev()<cr>
    vnoremap <silent><localleader>dd <esc>:call <SID>Django_Dev()<cr>

    function! s:Django_Dev()
        exec "w"
        if exists('$TMUX')
            if &filetype == 'python' && filereadable(globpath(asyncrun#get_root('%'),'manage.py'))
                exec 'AsyncRun -cwd=<root> -mode=term -pos=tmux python3 manage.py makemigrations --settings=Database.settings-dev && python3 manage.py migrate --settings=Database.settings-dev  && python3 manage.py runserver --settings=Database.settings-dev'
            endif
        else
            if &filetype == 'python' && filereadable(globpath(asyncrun#get_root('%'),'manage.py'))
                exec 'AsyncRun -cwd=<root> -mode=term -pos=floaterm python3 manage.py makemigrations --settings=Database.settings-dev && python3 manage.py migrate --settings=Database.settings-dev  && python3 manage.py runserver --settings=Database.settings-dev'
                exec "wincmd p"
            endif
        endif
    endfunction

endif

"=================================================================================================================================
" MarkdownClipborad 
"=================================================================================================================================

if exists('g:plugs["md-img-paste.vim"]')

    autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
    let g:mdip_imgdir = 'img'
    let g:mdip_imgname = 'image'

endif

"=================================================================================================================================
" IndentLine
"=================================================================================================================================

if exists('g:plugs["indentLine"]')

    nnoremap <LocalLeader>l :IndentLinesToggle<CR>
    inoremap <LocalLeader>l <esc> :IndentLinesToggle<CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o

    let g:indentLine_enabled = 0
    let g:indentLine_conceallevel = 1
    let g:indentLine_defaultGroup = 'SpecialKey'

endif

"=================================================================================================================================

"=================================================================================================================================
" Startify
"=================================================================================================================================

if exists('g:plugs["vim-startify"]')

    nnoremap <silent><LocalLeader>s :Startify <CR>
    inoremap <silent><LocalLeader>s <Esc>:Startify <CR>

" ----------------------------------------------------------------o--------------------------------------------------------------o
"
    let g:startify_session_delete_buffers = 1
    let g:startify_files_number = 20
    let g:startify_change_to_dir = 1
    let g:startify_enable_special = 1
    let g:startify_change_cmd = 'lcd'

    " autocmd User Startified call s:on_startify()
    " function! s:on_startify()
        " nnoremap <buffer><localleader>q :q<cr>
    " endfunction

    let g:startify_custom_header = [
            \'                                         ',
            \'                                         ',
            \'  _____                 _____            ',
            \' |_   _|_ _  ___       |_   _|_ _  ___   ',
            \'   | |/ _` |/ _ \        | |/ _` |/ _ \  ',
            \'   | | (_| | (_) |  _    | | (_| | (_) | ',
            \'   |_|\__,_|\___/  (_)   |_|\__,_|\___/  ',
            \'                                         ',
            \'                                         ',
            \ ]

    let g:startify_list_order = [
        \ ['   Files:'],
        \ 'files',
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ]

    " let g:startify_list_order = [
    "     \ ['   Recent files in this directory:'],
    "     \ 'dir',
    "     \ ['   Recent files:'],
    "     \ 'files',
    "     \ ['   Bookmarks:'],
    "     \ 'bookmarks',
    "     \ ]

    let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ ]

    let g:startify_bookmarks = [
        \ { 'v': '$HOME/.vimrc' },
        \ { 'i': '$HOME/.config/i3/config' },
        \ { 'a': '$HOME/.config/alacritty/alacritty.yml' },
        \ { 'b': '$HOME/.config/i3blocks/config' },
        \ { 'p': '$HOME/.config/picom/picom.conf' },
        \ { 's': '$HOME/.bashrc' },
        \ { 't': '$HOME/.tmux.conf' },
        \ { 'r': '$HOME/.config/rofi/config.rasi' },
        \ ]

    let g:startify_custom_footer = [
        \ '    +------------------------------+',
        \ '    |     Keep an open mind!       |',
        \ '    +----------------+-------------+',
        \]

endif

"=================================================================================================================================

"=================================================================================================================================
" 
"
"
"
"                                                        
"      __     ___                   _ _    _ 
"      \ \   / (_)_ __ _____      _(_) | _(_)
"       \ \ / /| | '_ ` _ \ \ /\ / / | |/ / |
"        \ V / | | | | | | \ V  V /| |   <| |
"         \_/  |_|_| |_| |_|\_/\_/ |_|_|\_\_|
"                                            
"
"
"
"
"
"=================================================================================================================================

"=================================================================================================================================
" Vimwiki Zettel settings
"=================================================================================================================================

if exists('g:plugs["vim-zettel"]')

    let g:zettel_format = "%title"
    let g:zettel_link_format="[[%title]]"
    " let g:zettel_fzf_command = "rg --column --ignore-case --no-heading --color=always"
    let g:zettel_options = [{"disable_front_matter": 1}]

    " let g:zettel_format = "%Y%m%d%H%M"
    " let g:zettel_format = "%Y-%m-%d"
    " let g:zettel_link_format="[%title](%link)"
    " let g:zettel_options = [{"template":"$HOME/.vim/zettelnew.tpl", "disable_front_matter": 1}]

endif

"=================================================================================================================================
" Vimwiki settings
"=================================================================================================================================

if exists('g:plugs["vimwiki"]')

    nnoremap <Leader>ww :VimwikiIndex<cr>
    
"=================================================================================================================================
" Vimwiki Group
"=================================================================================================================================

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

"-----------------------------------------------------------------o--------------------------------------------------------------o

    " let wiki_1 = {}
    " let wiki_1.name= '<Hugo   >'
    " let wiki_1.auto_export= 1
    " let wiki_1.auto_tags= 1
    " let wiki_1.auto_generate_tags= 1
    " let wiki_1.auto_generate_links= 1
    " let wiki_1.automatic_nested_syntaxes= 1
    " let wiki_1.path= '$HOME/blog/content/posts/'
    " let wiki_1.path_html= '$HOME/blog/public'
    " let wiki_1.syntax= 'markdown'
    " let wiki_1.ext= '.md'
    " let wiki_1.index = 'inbox'
    " let wiki_1.custom_wiki2html= '$HOME/.vim/wiki2html.sh'
    " let wiki_1.nested_syntaxes= {'python': 'python','bash': 'sh'}
    " let wiki_1.html_filename_parameterization= 1
    " let wiki_1.vimwiki_auto_chdir= 1

"-----------------------------------------------------------------o--------------------------------------------------------------o

    " let wiki_2 = {}
    " let wiki_2.name= '<Vimwiki>'
    " let wiki_2.auto_export= 1
    " let wiki_2.auto_tags= 1
    " let wiki_2.auto_generate_tags= 0
    " let wiki_2.auto_generate_links= 0
    " let wiki_2.automatic_nested_syntaxes= 1
    " let wiki_2.path= '$HOME/vimwiki/src'
    " let wiki_2.path_html= '$HOME/vimwiki/docs/'
    " let wiki_2.template_path= '$HOME/vimwiki/templates/'
    " let wiki_2.template_default= 'default'
    " let wiki_2.template_ext= '.tpl'
    " let wiki_2.css_file= '$HOME/vimwiki/templates/style.css'
    " let wiki_2.syntax= 'markdown'
    " let wiki_2.ext= '.md'
    " let wiki_2.custom_wiki2html= 'vimwiki_markdown'
    " let wiki_2.nested_syntaxes= {'python': 'python','bash': 'sh'}
    " let wiki_2.html_filename_parameterization= 1
    " let wiki_2.vimwiki_auto_chdir= 1

"-----------------------------------------------------------------o--------------------------------------------------------------o

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
    let g:vimwiki_ext2syntax = {'.md': 'markdown',  '.wiki': 'media'}


"-----------------------------------------------------------------o--------------------------------------------------------------o
    let g:vimwiki_list = [wiki_3]
"-----------------------------------------------------------------o--------------------------------------------------------------o

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

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 自动插入YAML 并自动改写filename
"-----------------------------------------------------------------o--------------------------------------------------------------o

    " autocmd BufEnter    ~/blog/content/posts/*.md :2d
    " autocmd BufEnter    ~/blog/content/posts/*.md :1r! echo title: %:t:r
    " autocmd BufNewFile ~/blog/content/posts/*.md :0r !echo ---
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo title: %:t:r
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo "date: `date +'\%Y-\%m-\%dT\%H:\%M:\%S+08:00'`"
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo draft: false
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo categories: []
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo tags: []
    " autocmd BufNewFile ~/blog/content/posts/*.md :r! echo ---
    " autocmd BufNewFile ~/blog/content/posts/*.md :$r !echo   

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 改变Shift+Enter映射
"-----------------------------------------------------------------o--------------------------------------------------------------o

    autocmd FileType vimwiki inoremap <silent><buffer> <localleader><CR> <Esc>:VimwikiReturn 2 2<CR>

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Height
"-----------------------------------------------------------------o--------------------------------------------------------------o

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
    hi VimwikiLink guifg=#61afef
    hi VimwikiLink guifg=#61afef
    hi VimwikiBold term=reverse cterm=underline ctermfg=204 gui=underline guifg=#E06C75

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 自动添加Backlinks
"-----------------------------------------------------------------o--------------------------------------------------------------o

    " autocmd BufWritePost ~/blog/content/posts/*.md if bufname() !='inbox.md' | call s:backlinks()
    " function! s:backlinks()
    "     let fw = search('Backlinks')
    "     let bf = bufname()
    "     if bf != "inbox.md" && fw == 0
    "         exec ":ZettelBackLinks"
    "     endif
    " endfunction

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 方案三(异步) - 最终方案
"-----------------------------------------------------------------o--------------------------------------------------------------o

    function! GitPull()
        " 获取云端最新版
        exec ":cd %:p:h"
        exec "AsyncStop"
        exec "AsyncRun git pull origin main"
        " autocmd User AsyncRunStop exec ":ccl"
        " autocmd User AsyncRunStop exec ":e %"
        let g:asyncrun_exit = "echom 'Sync Done'"
    endfunc

    function! GitCommit()
        " call s:backlinks()
        exec "cd %:p:h"
        exec "AsyncStop"
        exec "AsyncRun git add --all"
        exec "AsyncRun git add -m\"Update `whoami` at `hostname` in `date +%Y-%m-%d` `date +%H:%M:%S`\""
        let g:asyncrun_exit = "echom 'Git Add and Commit Done'"
    endfunc

    function! GitPush()
        " 上传到云端
        exec "cd %:p:h"
        exec "AsyncStop"
        call system("git add --all")
        call system("git commit -m \"Update `whoami` at `hostname` in `date +%Y-%m-%d` `date +%H:%M:%S`\"")
        exec "AsyncRun -mode=hide git push origin main"
        let g:asyncrun_exit = "echom 'Done'"
    endfunc

    augroup Github_Logseq
        autocmd!
        autocmd BufReadPost $HOME/wiki/pages/contents.md call GitPull()
        autocmd BufWritePost $HOME/wiki/pages/*.md call GitCommit()
        autocmd BufWinLeave contents.md call GitPush() 
    augroup END

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 自定义airline同步通知颜色
"-----------------------------------------------------------------o--------------------------------------------------------------o
	
	if exists('g:plugs["vim-airline"]')

		function! AirlineThemePatch(palette)
			let a:palette.accents.running = [ '#c678dd', '' , '', '', '' ]
			let a:palette.accents.success = [ '#61afef', '' , '', '', '' ]
			let a:palette.accents.failure = [ '#e06c75', '' , '', '', '' ]
		endfunction
		let g:airline_theme_patch_func = 'AirlineThemePatch'

		let g:asyncrun_status = ''
		let g:async_status_old = ''
		function! Get_asyncrun_running()
			let async_status = g:asyncrun_status
			if async_status != g:async_status_old
				if async_status == 'running'
					call airline#parts#define_accent('asyncrun_status', 'running')
				elseif async_status == 'success'
					call airline#parts#define_accent('asyncrun_status', 'success')
				elseif async_status == 'failure'
					call airline#parts#define_accent('asyncrun_status', 'failure')
				endif
				let g:airline_section_x = airline#section#create(['asyncrun_status'])
				AirlineRefresh
				let g:async_status_old = async_status
			endif
			return async_status
		endfunction

		try 
			call airline#parts#define_function('asyncrun_status', 'Get_asyncrun_running')
			let g:airline_section_x = airline#section#create(['asyncrun_status'])
			AirlineRefresh
		catch
		endtry

	endif
	
"-----------------------------------------------------------------o--------------------------------------------------------------o
" 使用wd删除markdown时自动删除相对应不使用的HTML文件
"-----------------------------------------------------------------o--------------------------------------------------------------o

    " function! VimwikiDeleteClean()
    "     let htmlfile = expand('%:r') . '.html'
    "     lcd ${HOME}/vimwiki/docs/
    "     call delete(htmlfile)
    "     lcd %:p:h
    "     call vimwiki#base#delete_link()
    " endfunction
    " autocmd filetype vimwiki nnoremap <buffer> <leader>wd :call VimwikiDeleteClean()<CR>

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 预览Hugo
"-----------------------------------------------------------------o--------------------------------------------------------------o

    " function! PreviewHugo()
    "     let filename = expand('%:t:r')
    "     exec ":AsyncStop"
    "     exec ":cd $HOME/blog"
    "     exec ":AsyncRun -mode=hide hugo server"
    "     exec ":AsyncRun -mode=hide google-chrome http://localhost:1313/" . filename
    "     echom 'Hugo Server Done! You Can Preview Hugo ...'
    " endfunc
    " autocmd FileType vimwiki nnoremap <F12> :call PreviewHugo()<cr>

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 设置Vimwiki搜索模式
"-----------------------------------------------------------------o--------------------------------------------------------------o

    function! VWS()
        execute ":VimwikiSearch " . input("VimwikiSearch:")
        :lopen
    endfunction

endif

"=================================================================================================================================
" EasyAlign  settings
"=================================================================================================================================

if exists('g:plugs["vim-easy-align"]')

    xnoremap ga <Plug>(EasyAlign)
    nnoremap ga <Plug>(EasyAlign)

"-----------------------------------------------------------------o--------------------------------------------------------------o

    let g:easy_align_delimiters = {
        \ '>': { 'pattern': '>>\|=>\|>'  },
        \ '/': {
        \     'pattern':         '//\+\|/\*\|\*/',
        \     'delimiter_align': 'l',
        \     'ignore_groups':   ['!Comment'] },
        \ ']': {
        \     'pattern':       '[[\]]',
        \     'left_margin':   0,
        \     'right_margin':  0,
        \     'stick_to_left': 0
        \   },
        \ ')': {
        \     'pattern':       '[()]',
        \     'left_margin':   0,
        \     'right_margin':  0,
        \     'stick_to_left': 0
        \   },
        \ 'd': {
        \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
        \     'left_margin':  0,
        \     'right_margin': 0
        \   }
        \ }

endif

"=================================================================================================================================
" Vim-visual-multi  settings
"=================================================================================================================================

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

"=================================================================================================================================
" Goyo  settings
"=================================================================================================================================

if exists('g:plugs["goyo.vim"]')

    function! s:goyo_enter()
        if has('gui_running')
            set background=light
            set linespace=7
        elseif exists('$TMUX')
            silent !tmux set status off
        endif
        set noshowmode
        set noshowcmd
        Limelight
    endfunction

    function! s:goyo_leave()
        if has('gui_running')
            set background=dark
            set linespace=0
        elseif exists('$TMUX')
            silent !tmux set status on
        endif
        set showmode
        set showcmd
        Limelight!
    endfunction

    augroup user_plugin_goyo
        autocmd!
        autocmd! User GoyoEnter
        autocmd! User GoyoLeave
        autocmd  User GoyoEnter nested call <SID>goyo_enter()
        autocmd  User GoyoLeave nested call <SID>goyo_leave()
    augroup END

"-----------------------------------------------------------------o--------------------------------------------------------------o

    function! s:Switch_goyo()
        if  winnr('$') == 1
            Goyo 200x200
        elseif exists('#goyo')
            Goyo!
        endif
    endfunction
    nnoremap <silent><Leader>go :call <SID>Switch_goyo()<cr>

endif

"=================================================================================================================================
" Limelight  settings
"=================================================================================================================================

if exists('g:plugs["limelight"]')

    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!

endif

"=================================================================================================================================
" AutoPairs  settings
"=================================================================================================================================

if exists('g:plugs["auto-pairs"]')

    let g:AutoPairsMapCh = 0
    let g:AutoPairsMapBS = 0
    let g:AutoPairsMapCR = 0
    let g:AutoPairsShortcutToggle = ''
    let g:AutoPairsshortcutFastWrap = ''
    let g:AutoPairsShortcutJump = ''
    let g:AutoPairsShortcutBackInsert = ''

endif

"=================================================================================================================================
" Which Key Map  settings
"=================================================================================================================================

if exists('g:plugs["vim-which-key"]')

    if !exists('which_key#register')
        silent! call which_key#register('\', "g:which_key_map")
    endif

    nnoremap <silent><leader> :WhichKey '\'<CR>
    vnoremap <silent><leader> :WhichKeyVisual '\'<CR>

    autocmd! FileType which_key
    autocmd  FileType which_key set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"-----------------------------------------------------------------o--------------------------------------------------------------o

    let g:which_key_sep = ' ◆ '
    let g:which_key_use_floating_win = 0
    let g:which_key_use_floating_relative = 0
    let g:which_key_align_by_seperator = 1
    let g:which_key_flatten = 1
    let g:which_key_run_map_on_popup = 0
    let g:which_key_fallback_to_native_key=1
    let g:which_key_disable_default_offset = 1
    let g:which_key_exit = ["\<Esc>","\q"]
    let g:which_key_hspace = 3
    let g:which_key_vertical = 0
    let g:which_key_max_size = 0
    let g:which_key_sort_horizontal = 0

"-----------------------------------------------------------------o--------------------------------------------------------------o
"
    highlight default link WhichKey          Function
    highlight default link WhichKeySeperator DiffAdded
    highlight default link WhichKeyGroup     Keyword
    highlight default link WhichKeyDesc      Identifier
    highlight default link WhichKeyFloating  Pmenu
    "highlight Pmenu ctermbg=red guibg=#282c34
    "highlight Keyword ctermbg=red guibg=#282c34
    "highlight Function ctermbg=red guibg=#282c34

"-----------------------------------------------------------------o--------------------------------------------------------------o
    let g:which_key_map =  {}
"-----------------------------------------------------------------o--------------------------------------------------------------o

    let g:which_key_map = {
        \
        \ 'e'    : [ ''                                            , 'MarkdownPreview'             ] ,
        \ 'p'    : [ ''                                            , 'ClipboardImage to Vim'       ] ,
        \ 'l'    : [ ''                                            , 'Toggle IndentLines'          ] ,
        \
        \ '<F2>' : [ ''                                            , 'Toggle Number'               ] ,
        \ '<F3>' : [ ''                                            , 'Toggle Syntax'               ] ,
        \ '<F4>' : [ ''                                            , 'Toggle Paste'                ] ,
        \ '<F5>' : [ ''                                            , 'Toggle Runner'               ] ,
        \ '<F6>' : [ ''                                            , 'Toggle Terminal'             ] ,
        \ '<F7>' : [ ''                                            , 'Toggle QuickFix'             ] ,
        \ '<F8>' : [ ''                                            , 'Toggle NERDTree'             ] ,
        \ '<F9>' : [ ''                                            , 'Toggle TagBar'               ] ,
        \
        \ 'm'    : {
        \ 'name' : '+SignatureMap',
        \
        \ "a"    : [''                                             , 'List All Marks'              ] ,
        \ "m"    : [''                                             , 'MarkLine'                    ] ,
        \ "d"    : [''                                             , 'Delete Marks'                ] ,
        \ "x"    : [''                                             , 'Delete All Marks'            ] ,
        \ "n"    : [''                                             , 'Next Marks Line'             ] ,
        \ "p"    : [''                                             , 'Prev Marks Line'             ] ,
        \ "f"    : [''                                             , 'Next Marks Spot'             ] ,
        \ "b"    : [''                                             , 'Prev Marks Spot'             ] ,
        \
        \ },
        \
        \ }

    let g:which_key_map[';'] = {
        \ 'name' : '+LocalLeader' ,
        \
        \ 'q'    : [ ''                                            , 'Exit'                        ] ,
        \ 'w'    : [ ''                                            , 'Save'                        ] ,
        \ 't'    : [ ''                                            , 'Toggle TagBar'               ] ,
        \ 'b'    : [ ''                                            , 'Toggle LeaderF BufferTag'    ] ,
        \ 'u'    : [ ''                                            , 'Toggle LeaderF Functions'    ] ,
        \ 'f'    : [ ''                                            , 'Toggle LeaderF Files'        ] ,
        \ 'e'    : [ ''                                            , 'Toggle NERDTree'             ] ,
        \ 'm'    : [ ''                                            , 'Toggle Signature'            ] ,
        \ 'z'    : [ ''                                            , 'Toggle Zoom mode'            ] ,
        \ 'y'    : [ ''                                            , 'Copy  System Clipboard'      ] ,
        \ 'p'    : [ ''                                            , 'Paste System Clipboard'      ] ,
        \ 's'    : [ ''                                            , 'Toggle Startify'             ] ,
        \ 'r'    : [ ''                                            , 'Toggle Runner Code'          ] ,
        \ 'c'    : [ ''                                            , 'Toggle Terminal'             ] ,
        \
        \ "1"    : [''                                             , 'Toggle Buffers 1 '           ] ,
        \ "2"    : [''                                             , 'Toggle Buffers 2 '           ] ,
        \ "3"    : [''                                             , 'Toggle Buffers 3 '           ] ,
        \ "4"    : [''                                             , 'Toggle Buffers 4 '           ] ,
        \ "5"    : [''                                             , 'Toggle Buffers 5 '           ] ,
        \ "6"    : [''                                             , 'Toggle Buffers 6 '           ] ,
        \ "7"    : [''                                             , 'Toggle Buffers 7 '           ] ,
        \ "8"    : [''                                             , 'Toggle Buffers 8 '           ] ,
        \ "9"    : [''                                             , 'Toggle Buffers 9 '           ] ,
        \ "0"    : [''                                             , 'Toggle Buffers 10'           ] ,
        \ "a"    : [''                                             , 'Buffer Add'                  ] ,
        \ "Tab"  : [''                                             , 'Buffer Next'                 ] ,
        \ "STab" : [''                                             , 'Buffer Previous'             ] ,
        \
        \ "<Tab>": [''                                             , 'Edit Mode UltiSnip'          ] ,
        \
        \ }

    let g:which_key_map.d = {
        \ 'name' : '+Display',
        \
        \ "w"    : ['<C-W>w'                                       , 'other-window'                ] ,
        \ "d"    : ['<C-W>c'                                       , 'delete-window'               ] ,
        \ "b"    : ['<C-W>s'                                       , 'split-window-below'          ] ,
        \ "r"    : ['<C-W>v'                                       , 'split-window-right'          ] ,
        \ "2"    : ['<C-W>v'                                       , 'layout-double-columns'       ] ,
        \ "h"    : ['<C-W>5<'                                      , 'expand-window-left'          ] ,
        \ "l"    : ['<C-W>5>'                                      , 'expand-window-right'         ] ,
        \ "a"    : ['<C-W>='                                       , 'balance-window'              ] ,
        \ "s"    : ['<C-W>s'                                       , 'split-window-below'          ] ,
        \ "v"    : ['<C-W>v'                                       , 'split-window-below'          ] ,
        \ "k"    : [':resize -5'                                   , 'expand-window-up'            ] ,
        \ "j"    : [':resize +5'                                   , 'expand-window-below'         ] ,
        \
        \ }

    let g:which_key_map.f = {
        \ "name" : "+FZF",
        \
        \ "f"    : ['Files'                                        , 'Search Files'                ] ,
        \ "l"    : ['BLines'                                       , 'Search Lines Buffers'        ] ,
        \ "o"    : ['Colors'                                       , 'Search Color Themes'         ] ,
        \ "t"    : ['BTags'                                        , 'Search Tags'                 ] ,
        \ "b"    : ['Buffers'                                      , 'Search Open Buffers'         ] ,
        \ "i"    : ['GFiles'                                       , 'Search Git-Files'            ] ,
        \ "g"    : ['GFiles?'                                      , 'Search Modified-Git-Files'   ] ,
        \ "a"    : ['Ag'                                           , 'Search Ag'                   ] ,
        \ "r"    : ['Rg'                                           , 'Search Rg'                   ] ,
        \ "m"    : ['Marks'                                        , 'Search Marks'                ] ,
        \ "w"    : ['Windows'                                      , 'Search Windows'              ] ,
        \ "c"    : ['Commands'                                     , 'Search Commands'             ] ,
        \
        \ }

    let g:which_key_map.t = {
        \ 'name' : '+Table Mode',
        \
        \ "m"    : ['TableModeToggle'                              , 'TableModeToggle'             ] ,
        \
        \ }

    let g:which_key_map.v = {
        \ 'name' : '+VCS',
        \
        \ "e"    : ['Gbrowse'                                     , 'Browse'                       ] ,
        \ "i"    : ['Gdiff'                                       , 'Diff'                         ] ,
        \ "g"    : ['Gmerge'                                      , 'Merge'                        ] ,
        \ "s"    : ['Gpush'                                       , 'Push'                         ] ,
        \ "a"    : ['Grebase'                                     , 'Rebase'                       ] ,
        \ "b"    : ['Gblame'                                      , 'Blame'                        ] ,
        \ "c"    : ['Gcommit'                                     , 'Commit'                       ] ,
        \ "d"    : ['Gdelete'                                     , 'Delete'                       ] ,
        \ "f"    : ['Gfetch'                                      , 'Fetch'                        ] ,
        \ "o"    : ['Glog'                                        , 'Log'                          ] ,
        \ "m"    : ['Gmove'                                       , 'Move'                         ] ,
        \ "l"    : ['Gpull'                                       , 'Pull'                         ] ,
        \ "r"    : ['Grename'                                     , 'Rename'                       ] ,
        \ "t"    : ['Gstatus'                                     , 'Status'                       ] ,
        \
        \ }

    let g:which_key_map.w = {
        \ 'name' : '+VimWiki',
        \
        \ "w"    : [''                                            , 'Go To Index'                  ] ,
        \ "n"    : [''                                            , 'Create new wiki page'         ] ,
        \ "d"    : [''                                            , 'Delete wiki page'             ] ,
        \ "r"    : [''                                            , 'Rename wiki page'             ] ,
        \ "v"    : [''                                            , 'Toggle wiki List'             ] ,
        \ "s"    : [''                                            , 'Search-for-wiki-pattam'       ] ,
        \ "f"    : [''                                            , 'Search-for-wiki-curword'      ] ,
        \
        \ 'c'    : {
        \ 'name' : '+CheckBox',
        \
        \ "t"    : ['VimwikiToggleListItem'                       , 'Toggle checkbox On/Off'       ] ,
        \ "n"    : ['VimwikiIncrementListItem'                    , 'Toggle checkbox Next/Previous'] ,
        \
        \ },
        \
        \ 't'    : {
        \ 'name' : '+Tables',
        \
        \ "t"    : ['VimwikiTable'                                , 'Create Table'                             ] ,
        \ "h"    : ['<Plug>VimwikiTableMoveColumnLeft'            , 'Move current column to the left'          ] ,
        \ "l"    : ['<Plug>VimwikiTableMoveColumnRight'           , 'Move current column to the Right'         ] ,
        \
        \ },
        \
        \ 'z'    : {
        \ 'name' : '+Zettel',
        \
        \ "b"    : ['ZettelBackLinks'                             , 'add-backlineks'                           ] ,
        \ "n"    : ['ZettelNew'                                   , 'add-new'                                  ] ,
        \ "o"    : ['ZettelOpen'                                  , 'Search fulltext use FZF'                  ] ,
        \ "i"    : ['ZettelInsertNote'                            , 'Using FZF and insert in the current'      ] ,
        \ "s"    : ['ZettelSearch'                                , 'Search the content of your zettelkasten'  ] ,
        \ "y"    : ['ZettelYankName'                              , 'Copy the current zettel file name'        ] ,
        \
        \ },
        \
        \ }

    let g:which_key_map.g = {
        \ 'name' : '+Goyo',
        \
        \ "o"    : [':call Switch_goyo()'                         , 'Enter Goyo Mode'                          ] ,
        \
        \ }

endif

"=================================================================================================================================
" Signature  settings
"=================================================================================================================================

if exists('g:plugs["vim-signature"]')

    nnoremap <silent><localleader>m :SignatureToggleSigns<CR> 

"-----------------------------------------------------------------o--------------------------------------------------------------o

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

"-----------------------------------------------------------------o--------------------------------------------------------------o

    hi SignatureMarkText   term=standout ctermbg=2   ctermbg=2   guifg=#E06C75 guibg=#282C34   " 书签标记颜色
    hi SignatureMarkerText term=standout ctermbg=2   ctermbg=2   guifg=#E06C75 guibg=#282C34   " 折叠提示颜色

endif

"=================================================================================================================================
" Vim-bookmarks  settings
"=================================================================================================================================

if exists('g:plugs["vim-bookmarks"]')

    let g:bookmark_sign = ' ' "⚑ ♥ 
    let g:bookmark_annotation_sign = ' ' "☰  ﭅ 
    let g:bookmark_auto_close = 1                 "跳转到标签后自动关闭
    let g:bookmark_save_per_working_dir = 1
    let g:bookmark_auto_save = 1
    let g:bookmark_highlight_lines = 0             "高亮书签行

"-----------------------------------------------------------------o--------------------------------------------------------------o

    hi BookmarkSign           term=standout ctermbg=2   ctermfg=2   guifg=#E06C75 guibg=#282C34   " 书签标记颜色
    hi BookmarkAnnotationSign term=standout ctermbg=2   ctermfg=2   guifg=#98C379 guibg=#282C34   " 书签标记颜色
    hi BookmarkLine           term=standout ctermbg=2   ctermfg=2   guifg=#E06C75 guibg=#282C34   " 书签标记颜色-行
    hi BookmarkAnnotationLine term=standout ctermbg=2   ctermfg=2   guifg=#98C379 guibg=#282C34   " 书签标记颜色-行

endif

"=================================================================================================================================
" Ultisnips settings
"=================================================================================================================================

if exists('g:plugs["ultisnips"]')

    let g:UltiSnipsExpandTrigger="<C-j>"
    let g:UltiSnipsJumpForwardTrigger="<C-j>"
    let g:UltiSnipsJumpBackwardTrigger="<C-k>"

endif

"=================================================================================================================================
" Gutentags settings
"=================================================================================================================================

if exists('g:plugs["vim-gutentags"]')

    " gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
	
    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'
	
    " 同时开启 ctags 和 gtags 支持：
    let g:gutentags_modules = []

    if executable('ctags')
        let g:gutentags_modules += ['ctags']
    endif
    
	if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
    endif

    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags

    " 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 检测 ~/.cache/tags 不存在就新建
    if !isdirectory(s:vim_tags)
        silent! call mkdir(s:vim_tags, 'p')
    endif

endif

"=================================================================================================================================
" LeaderF settings
"=================================================================================================================================

if exists('g:plugs["LeaderF"]')

    noremap <silent> <LocalLeader>u :LeaderfFunction!<CR>
    noremap <silent> <LocalLeader>f :LeaderFile!<CR>
    noremap <silent> <LocalLeader>b :LeaderfBufTag!<CR>

"-----------------------------------------------------------------o--------------------------------------------------------------o

    let g:Lf_HideHelp = 1
    let g:Lf_UseCache = 0
    let g:Lf_UseVersionControlTool = 0
    let g:Lf_IgnoreCurrentBufferName = 1
    let g:Lf_WindowHeight = 0.30
    let g:Lf_StlColorscheme = 'one'
    let g:Lf_DisableStl = 0
    let g:Lf_GtagsAutoGenerate = 0
    let g:Lf_ShowDevIcons = 0
    let g:Lf_ShortcutF = '' 
    let g:Lf_ShortcutB = '' 
    let g:Lf_WindowPosition = 'bottom'
    let g:Lf_ShowRelativePath = 0
    let g:Lf_PopupWidth = &columns * 1 / 2
    let g:Lf_PopupHeight = float2nr(&lines * 0.3)
    let g:Lf_PopupShowStatusline = 1
    let g:Lf_PopupColorscheme = 'one'
    let g:Lf_PopupShowFoldcolumn = 0
    let g:Lf_CommandMap = { '<C-j>': ['<Down>'], '<C-k>': ['<Up>']}
    let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
    let g:Lf_SpinSymbols =  ['🌘', '🌗', '🌖', '🌕', '🌔', '🌓', '🌒', '🌑']
    let g:Lf_WildIgnore = { 'dir': ['.svn','.git','.hg'], 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]'] }
"-----------------------------------------------------------------o--------------------------------------------------------------o
" Color
"-----------------------------------------------------------------o--------------------------------------------------------------o
    hi Lf_hl_cursorline            gui=bold    guifg=#C678DD
    hi Lf_hl_match                 gui=bold    guifg=#e06c75
    hi Lf_hl_match2                gui=bold    guifg=#3FF5D1
    hi Lf_hl_match3                gui=bold    guifg=#FF7272
    hi Lf_hl_match4                gui=bold    guifg=#43B9F0
    hi Lf_hl_matchRefine           gui=bold    guifg=#e06c75
    hi Lf_hl_selection             gui=bold    guifg=#282C34  guibg=#A5EB84
    hi Lf_hl_buftagLineNum         gui=bold    guifg=#abb2bf
    hi Lf_hl_cursor                gui=bold    guifg=#E06C75  guibg=#E06C75
    hi Lf_hl_popup_cursor          gui=bold    guifg=#E06C75  guibg=#E06C75
    hi Lf_hl_quickfixColumnNumber  gui=bold    guifg=#E06C75  guibg=#E06C75
    hi Lf_hl_loclistColumnNumber   gui=bold    guifg=#E06C75  guibg=#E06C75
    hi Lf_hl_rgColumnNumber        gui=bold    guifg=#E06C75  guibg=#E06C75
    hi Lf_hl_stlSpin               gui=bold    guifg=#E06C75  guibg=#3B3E4C
"-----------------------------------------------------------------o--------------------------------------------------------------o
    let g:Lf_StlPalette = {
        \   'stlName': {
        \       'gui': 'bold',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#40444E',
        \       'cterm': 'bold',
        \       'ctermfg': '22',
        \       'ctermbg': '157'
        \   },
        \   'stlCategory': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#2C3339',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '210'
        \   },
        \   'stlNameOnlyMode': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#40444E',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '227'
        \   },
        \   'stlFullPathMode': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#40444E',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '147'
        \   },
        \   'stlFuzzyMode': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#40444E',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '227'
        \   },
        \   'stlRegexMode': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABBABF',
        \       'guibg': '#40444E',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '121'
        \   },
        \   'stlCwd': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABB2BF',
        \       'guibg': '#282c45',
        \       'cterm': 'NONE',
        \       'ctermfg': '195',
        \       'ctermbg': '241'
        \   },
        \   'stlBlank': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': 'NONE',
        \       'guibg': '#3B3E4C',
        \       'cterm': 'NONE',
        \       'ctermfg': 'NONE',
        \       'ctermbg': '237'
        \   },
        \   'stlLineInfo': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#ABB2BF',
        \       'guibg': '#282c45',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '195'
        \   },
        \   'stlTotal': {
        \       'gui': 'NONE',
        \       'font': 'NONE',
        \       'guifg': '#282C34',
        \       'guibg': '#ABB2BF',
        \       'cterm': 'NONE',
        \       'ctermfg': '16',
        \       'ctermbg': '149'
        \   }
        \ }

endif

"=================================================================================================================================
" Floaterm settings
"=================================================================================================================================

if exists('g:plugs["vim-floaterm"]')

    let g:floaterm_wintype = 'split'
    let g:floaterm_position = 'bottom'
    let g:floaterm_title = 'TERMINAL: $1/$2'
    let g:floaterm_height = 0.3
    let g:floaterm_autoclose = 2
    let g:floaterm_autohide = 2
    let g:floaterm_borderchars = '─│─│┌┐┘└'

    nnoremap <silent><Localleader>c :silent FloatermToggle<CR>
    tnoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>
    vnoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>
    inoremap <silent><Localleader>c <C-\><C-n>:silent FloatermToggle<CR>

    tnoremap <silent><Localleader>n <C-\><C-n>:silent FloatermNew<CR>
    tnoremap <silent><Localleader>k <C-\><C-n>:silent FloatermPrev<CR>
    tnoremap <silent><Localleader>j <C-\><C-n>:silent FloatermNext<CR>

    function! Airline_FloatermInfo() abort
        let buffers = floaterm#buflist#gather()
        let cnt = len(buffers)
        let cur = floaterm#buflist#curr()
        let idx = index(buffers, cur) + 1
        return printf(' %s/%s', idx, cnt)
    endfunction

    autocmd ExitPre * FloatermKill!

endif

"=================================================================================================================================
" Coc.nvim settings
"=================================================================================================================================

if exists('g:plugs["coc.nvim"]')

    let g:coc_global_extensions = ['coc-json', 'coc-java']                 "自动安装插件列表

"-----------------------------------------------------------------o--------------------------------------------------------------o
"开启<tab>补全
"-----------------------------------------------------------------o--------------------------------------------------------------o

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

"-----------------------------------------------------------------o--------------------------------------------------------------o

	let g:coc_snippet_next = '<tab>'
	inoremap <silent><expr> <TAB>
        \ pumvisible() ? coc#_select_confirm() :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

"-----------------------------------------------------------------o--------------------------------------------------------------o

	inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
	inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"
	inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

"-----------------------------------------------------------------o--------------------------------------------------------------o
" 多光标支持
"-----------------------------------------------------------------o--------------------------------------------------------------o

	nnoremap <leader>rr :CocCommand document.renameCurrentWord<CR>
	nnoremap <leader>rs :CocSearch<Space>
	nnoremap <leader>rw :CocSearch <C-R>=expand("<cword>")<CR><CR>
	nmap <silent> <C-c> <Plug>(coc-cursors-position)
	xmap <silent> <C-m> <Plug>(coc-cursors-range)
	nmap <expr> <silent> <C-m> <SID>select_current_word()

"-----------------------------------------------------------------o--------------------------------------------------------------o

	function! s:select_current_word()
        if !get(g:, 'coc_cursors_activated', 0)
            return "\<Plug>(coc-cursors-word)"
        endif
        return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
	endfunc

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Color
"-----------------------------------------------------------------o--------------------------------------------------------------o

    hi CocCursorRange term=reverse cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#FFFFFF guibg=#E06c75
    hi CocHoverRange term=reverse cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#FFFFFF guibg=#E06c75
    hi CocErrorSign term=reverse cterm=bold ctermfg=238 ctermbg=226 gui=bold guifg=#e06c75 

endif

"=================================================================================================================================
"Clever-F Settings
"=================================================================================================================================

if exists('g:plugs["clever-f.vim"]')

    map <CR> <Plug>(clever-f-repeat-forward)
    map <BS> <Plug>(clever-f-repeat-back)
    let g:clever_f_show_prompt=1       " 显示提示符
    let g:clever_f_fix_key_direction=0 " 循环搜索请设置为1
    let g:clever_f_smart_case=1          " 智能大小写搜索
    let g:clever_f_across_no_line=1
    let g:clever_f_chars_match_any_signs=";"

"-----------------------------------------------------------------o--------------------------------------------------------------o
" Color
"-----------------------------------------------------------------o--------------------------------------------------------------o

    hi CleverFDefaultLabel cterm=bold,underline ctermfg=9 gui=bold,underline guifg=#abb2bf guibg=#e06c75
    hi CleverFDefaultLabel cterm=bold,underline ctermfg=9 gui=bold,underline guifg=#abb2bf guibg=#e06c75
    hi CleverFChar         cterm=bold,underline ctermfg=9 gui=bold,underline guifg=#e06c75

endif

"=================================================================================================================================
" Pangu settings
"=================================================================================================================================

if exists('g:plugs["pangu.vim"]')

    autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

endif

"=================================================================================================================================
" Neomake settings
"=================================================================================================================================

if exists('g:plugs["neomake"]')

    try
        call neomake#configure#automake('nrwi', 500)
    catch /^Vim\%((\a\+)\)\=:E117/
    endtry

endif

"=================================================================================================================================
" Mdv - pipe preview command  settings
"=================================================================================================================================

" if exists('g:plugs["vim-pipe-preview"]')

"     let g:local_path = string(resolve(expand('%:p')))
" 	" let g:pipe_preview_command = 'mdv -t "826.2742" -'
" 	" let g:pipe_preview_command = "glow -s ~/.config/glow/onedark.json " . g:local_path
" 	let g:pipe_preview_command = 'mdless ' . g:local_path
" 	nnoremap <silent><localleader>v :<C-U>PipePreview<CR>

" endif

"=================================================================================================================================
" Sayonara settings
"=================================================================================================================================

if exists('g:plugs["vim-sayonara"]')

	nnoremap <silent><localleader>q :Sayonara<cr>
	inoremap <silent><localleader>q <Esc>:Sayonara<cr>
	vnoremap <silent><localleader>q <Esc>:Sayonara<cr>

endif

"=================================================================================================================================
" vim-auto-popmenu 
"=================================================================================================================================

if exists('g:plugs["vim-auto-popmenu"]')

    let g:apc_enable_ft = { '*':1 }
    let g:apc_cr_confirm = 1
    set completeopt=menu,menuone,noselect
    set cpt=.,k,w,b
    set shortmess+=c

endif

"=================================================================================================================================
" Far.vim
"=================================================================================================================================

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

    nnoremap <LocalLeader><F2> :Far <C-R><C-W><Space>

endif

"=================================================================================================================================
" Vimux
"=================================================================================================================================

if exists('g:plugs["vimux"]')

    let g:VimuxOrientation = "h"
    let g:VimuxHeight = "40"

endif

"=================================================================================================================================
" Nerdtree-Git
"=================================================================================================================================

if exists('g:plugs["nerdtree-git-plugin"]')

    let g:NERDTreeGitStatusShowClean = 0 " default: 0
    let g:NERDTreeGitStatusUseNerdFonts = 1
    let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0
    let g:NERDTreeGitStatusUntrackedFilesMode = 'all' 
    let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ 'Modified'  :'M',
        \ 'Staged'    :'✚',
        \ 'Untracked' :'U',
        \ 'Renamed'   :'➜',
        \ 'Unmerged'  :'═',
        \ 'Deleted'   :'✖',
        \ 'Dirty'     :'✗',
        \ 'Ignored'   :'.',
        \ 'Clean'     :'✔︎',
        \ 'Unknown'   :'?',
        \ }

endif

"=================================================================================================================================
" Vimade.vim
"=================================================================================================================================

if exists('g:plugs["vimade.vim"]')

    function! MyVimadeWinDisable()
        if exists('g:vimade_init') && exists('g:vimade_running')
            if g:vimade_running == 1
                if !exists('g:vimade_disabled')
                    call vimade#WinDisable()
                elseif w:vimade_disabled == 0
                    call vimade#WinDisable()
                endif
            endif
        endif
    endfunction

    function! MyVimadeWinEnable()
        if exists('g:vimade_init') && exists('g:vimade_running')
            if g:vimade_running == 1
                if !exists('g:vimade_disabled')
                    return
                elseif w:vimade_disabled != 0
                    call vimade#WinEnable()
                endif
            endif
        endif
    endfunction

    au! CompleteChanged * call MyVimadeWinDisable()
    au! CompleteDone    * call MyVimadeWinEnable()

endif
