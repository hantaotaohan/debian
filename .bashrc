# ================================================================================================================================
#                                                                                                                                 
#                                                             BASHRC                                                            
#                                                                                                                                                                                                 
#                                                       Update: 2023.01.10                                                      
#                                                                                                                                 
# ================================================================================================================================

# ================================================================================================================================
#                                                       GENERAL - SETTINGS
# ================================================================================================================================

# 对于非交互式对话立即停止执行
[[ $- != *i* ]] && return

# 如果命令为路径自动添加CD.
shopt -s autocd

# 纠正 CD 命令中目录名的较小拼写错误. 检查的错误包括颠倒顺序的字符, 遗漏的字符以及重复的字符. 如果找到一处需修改之处, 正确的路径将打印出, 命令将继续. 只用于交互式 SHELL
shopt -s cdspell

# 打开扩展的模式匹配特性
shopt -s extglob

# 如果设置了，在路径名扩展上下文中使用的模式 “**” 将匹配所有文件以及零个或多个目录和子目录。
shopt -s globstar

# 如果设置, 当执行文件名扩展时, BASH 在不区分大小写的方式下匹配文件名
shopt -s nocaseglob

# 如果 READLINE 正被使用, 用户有机会重新编辑一个失败的历史替换
shopt -s histappend

# 如果给 cd内置命令的参数不是一个目录 ,就假设它是一个变量名 ,变量的值是将要转换到的目录
shopt -s cdable_vars

# 在每个命令后检查窗口大小, 如果有必要, 就更新 LINES 和 COLUMNS 的值
shopt -s checkwinsize

# ================================================================================================================================
#                                                      HISTSIZE - SETTINGS
# ================================================================================================================================

# 历史长度信息设置
HISTSIZE=1000

# 历史长度信息设置
HISTFILESIZE=2000

# 不要在历史中放置重复的行或以空格开头的行。 
HISTCONTROL=ignoreboth

# ================================================================================================================================
#                                                      SOURCE - SETTINGS
# ================================================================================================================================

# 循环读取设定的基础文件
for file in ~/.{bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# 如果没有交互运行就不要做任何事情
case $- in
    *i*) ;;
      *) return;;
esac
	
# ================================================================================================================================

# 取消对彩色提示的注释(如果终端具有此功能):打开, 默认情况下关闭以不分散用户的注意力:终端窗口中的焦点, 应该在命令的输出上,而不是在提示符上              
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# ================================================================================================================================

# 使非文本输入文件更加友好
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ================================================================================================================================

# 设置用于标识所用chroot的变量
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# ================================================================================================================================

# 设置颜色提示(非彩色，除非自定义颜色代码)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# ================================================================================================================================

# 默认 BASH_PROMPT 设置
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# ================================================================================================================================

# 如果判定终端为 XTERM，那么标题设置为 USER@HOST:DIR
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# ================================================================================================================================

# 启用ls的颜色支持并添加方便的别名
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ================================================================================================================================

# 彩色 GCC 警告和错误
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ================================================================================================================================

# 为长时间运行的命令添加“警报”别名。像这样使用：睡眠10；提醒
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# ================================================================================================================================

# 启用自动补全功能
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ================================================================================================================================
#                                                      Z.SH - SETTINGS
# ================================================================================================================================

source z

# ================================================================================================================================
#                                                      FZF - SETTINGS
# ================================================================================================================================

[ -f ~/.fzf.bash ] && source ~/.fzf.bash 

# ================================================================================================================================
#                                                    XMODMAP - SETTINGS
# ================================================================================================================================

if [ ! "$XDG_CURRENT_DESKTOP" = "" ]; then
    xmodmap "$HOME/.Xmodmap"
fi

# ================================================================================================================================
#                                                CUSTOM COMPLETION - SETTINGS
# ================================================================================================================================

[ -f $HOME/.bin/setup-completion.bash ] && source $HOME/.bin/setup-completion.bash 

# ================================================================================================================================
#                                                      TMUX - SETTINGS
# ================================================================================================================================

if [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]] && [ ! -d /mnt/c ];then
    tmux attach-session -t Server || tmux new-session -s Server
fi

# ================================================================================================================================
#                                                     COLORS - SETTINGS
# ================================================================================================================================

red='\e[0;41m'     # 红色  
blue='\e[0;34m'    # 蓝色  
cyan='\e[4;36m'    # 蓝绿色  
white='\e[0;37m'   # 白色
green='\e[0;32m'   # 绿色  
yellow='\e[5;43m'  # 黄色  
magenta='\e[0;35m' # 紫色  

RED='\e[1;31m'     # 红色 
BLUE='\e[1;34m'    # 蓝色 
CYAN='\e[1;36m'    # 蓝绿 
WHITE='\e[0;37m'   # 白色
GREEN='\e[1;32m'   # 绿色 
YELLOW='\e[1;33m'  # 黄色 
MAGENTA='\e[1;35m' # 紫色 
