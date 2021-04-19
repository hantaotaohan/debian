#!/usr/bin/env bash

clear

#----------------------------------------------------------------------------------------#
# Start
#----------------------------------------------------------------------------------------#

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";
echo -e "               ___  _   _  ____   _____     _     _      _                     ";
echo -e "              |_ _|| \ | |/ ___| |_   _|   / \   | |    | |                    ";
echo -e "               | | |  \| |\___ \   | |    / _ \  | |    | |                    ";
echo -e "               | | | |\  | ___) |  | |   / ___ \ | |___ | |___                 ";
echo -e "              |___||_| \_||____/   |_|  /_/   \_\|_____||_____|                ";
echo -e "                                                                               ";                                                                                    
echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "              TaoTao - Saber - Ubuntu - Desktop - Install                      ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

#----------------------------------------------------------------------------------------#
# Setting Bash Colors
#----------------------------------------------------------------------------------------#

red='\e[1;31m'
blue='\e[0;34m'
green='\e[0;32m'
white='\e[0;37m'
reset='\e[0;37m'


#----------------------------------------------------------------------------------------#
# Setting Bash Variable
#----------------------------------------------------------------------------------------#

Backup_dir="$HOME/.dotfiles.orig"
Dotfiles_repo=$(pwd)
#Dotfiles_repo=$(dirname $PWD)

Dotfiles_symlinks=( \
        .aliases \
        .bashrc \
        .bash_profile \
        .bash_prompt \
        .curlrc \
        .exports \
        .functions \
        .fonts.conf \
        .dircolors \
        .gitignore \
        .gitconfig \
        .inputrc \
        .ripgreprc \
        .tmux.conf \
        .vimrc \
        .offlineimaprc \
        .msmtprc \
        .wgetrc \
        .Xmodmap \
        .imwheelrc \
        .gtkrc-2.0 \
        .Xresources
        )

Dotfiles_copy=( \
        .config \
        .vim \
        .w3m \
        .pip \
        .snclirc \
        extras/z.lua
        )

#----------------------------------------------------------------------------------------#
# Setting Print usage message.
#----------------------------------------------------------------------------------------#

usage() {
    local program_name
    program_name=${0##*/}
    cat <<EOF

Usage: $program_name [-option]

Options:
                                                                            
------------------------------------------------------------------------------------------
                                                                            
 -h        Print this message                                               
                                                                            
 -A        Install All                                                      
 -D        Install Dotfiles & Enviroment                                    
 -S        Update System & Setup Alls Tools & Enviroment                    
                                                                            
------------------------------------------------------------------------------------------
                                                                            
 -1        Install Dotfiles                                                 
 -2        Uninstall Dotfiles                                               
 -3        Install Environment                                              
 -4        Install APT Tools                                                
 -5        Install PIP3 Tools                                               
 -6        Install GEM Tools                                                
 -7        Install Local Bin Folder Tools                                   
 -8        Install Fonts                                                    
 -9        Install Server Edition                                           
                                                                      
 -q        Exit                                                             
                                                                            
------------------------------------------------------------------------------------------
                                                                            
EOF
}


#----------------------------------------------------------------------------------------#
# Start Install Dotfiles 
#----------------------------------------------------------------------------------------#

install_dotfiles() {
 
echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "               ____        _    __ _ _                                         ";
echo -e "              |  _ \  ___ | |_ / _(_) | ___  ___                               ";
echo -e "              | | | |/ _ \| __| |_| | |/ _ \/ __|                              ";
echo -e "              | |_| | (_) | |_|  _| | |  __/\__ \                              ";
echo -e "              |____/ \___/ \__|_| |_|_|\___||___/                              ";
echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Start Backup and Install Dotfiles${reset}                 ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";
    # Backup config.
    if ! [ -f "$Backup_dir/check-backup.txt" ]; then
        env mkdir -p "$Backup_dir/.config"
        cd "$Backup_dir" || exit
        touch check-backup.txt

        # Backup to ~/.dotfiles.orig
        for dots_symlinks in "${Dotfiles_symlinks[@]}"
        do
            env cp -rf "$HOME/${dots_symlinks}" "$Backup_dir" &> /dev/null
        done

        # Backup some folder in ~/.config to ~/.dotfiles.orig/.config
        for dots_copy in "${Dotfiles_copy[@]//./}"
        do
            env cp -rf "$HOME/${dots_copy}" "$Backup_dir/.config" &> /dev/null
        done

        # Backup again with Git.
        if [ -x "$(command -v git)" ]; then
            git init &> /dev/null
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Backup original config on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi

        # Output.
        echo -e "${blue}Your config is backed up in ${Backup_dir}\n" >&2
        echo -e "${red}Please do not delete check-backup.txt in .dotfiles.orig folder.${white}" >&2
        echo -e "It's used to backup and restore your old config.\n" >&2
    fi

    # Install config.
    for dots_symlinks in "${Dotfiles_symlinks[@]}"
    do
        env rm -rf "$HOME/${dots_symlinks}"
        env ln -fs "$Dotfiles_repo/${dots_symlinks}" "$HOME/"
    done

    # Install Move .config to ~/.config.
    for dots_copy in "${Dotfiles_copy[@]}"
    do
        sudo rm -rf "$HOME/${dots_copy}"
        cp -rf "$Dotfiles_repo/${dots_copy}" "$HOME/"
    done

    echo -e "${blue}New dotfiles is installed!\n${white}" >&2
    echo "There may be some errors when Terminal is restarted." >&2
    echo "Please read carefully the error messages and make sure." >&2
    echo "all packages are installed. See more info in README.md." >&2
    echo "Note that the author of this dotfiles uses dev branch in some packages." >&2
    echo -e "If you want to restore your old config, " >&2
    echo -e "you can use ${red}./install.sh -r${white} command.\n" >&2
}


#----------------------------------------------------------------------------------------#
# Uninstall Dotfiles
#----------------------------------------------------------------------------------------#

uninstall_dotfiles() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "               ____        _    __ _ _                                         ";
echo -e "              |  _ \  ___ | |_ / _(_) | ___  ___                               ";
echo -e "              | | | |/ _ \| __| |_| | |/ _ \/ __|                              ";
echo -e "              | |_| | (_) | |_|  _| | |  __/\__ \                              ";
echo -e "              |____/ \___/ \__|_| |_|_|\___||___/    - Restore                 ";
echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Restore Dotfile Initial State${reset}                     ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

    if [ -f "$Backup_dir/check-backup.txt" ]; then
        for dots_symlinks in "${Dotfiles_symlinks[@]}"
        do
            env rm -rf "$HOME/${dots_symlinks}"
            env cp -rf "$Backup_dir/${dots_symlinks}" "$HOME/" &> /dev/null
            env rm -rf "$Backup_dir/${dots_symlinks}"
        done

        for dots_copy in "${Dotfiles_copy[@]}"
        do
            env rm -rf "$HOME/${dots_copy}"
            env cp -rf "$Backup_dir/${dots_copy}" "$HOME/" &> /dev/null
            env rm -rf "$Backup_dir/${dots_copy}"
        done

        # Save old config in backup directory with Git.
        if [ -x "$(command -v git)" ]; then
            cd "$Backup_dir" || exit
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Restore original config on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi
    fi

    if ! [ -f "$Backup_dir/check-backup.txt" ]; then
        echo -e "${red}You have not installed this dotfiles yet.${white}" >&2
        exit 1
    else
        echo -e "${blue}Your old config has been restored!\n${white}" >&2
        echo "Thanks for using my dotfiles." >&2
        echo "Enjoy your next journey!" >&2
    fi

    env rm -rf "$Backup_dir/check-backup.txt"
}

#----------------------------------------------------------------------------------------#
# Workspace Settings
#----------------------------------------------------------------------------------------#

workspace_settings() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";
echo -e "               _____   _   _  __     __                                        ";
echo -e "              | ____| | \ | | \ \   / /                                        ";
echo -e "              |  _|   |  \| |  \ \ / /                                         ";
echo -e "              | |___  | |\  |   \ V /                                          ";
echo -e "              |_____| |_| \_|    \_/                                           ";
echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}System Environment Configuration${reset}                  ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

# Make Floder
if [ ! -d "$HOME/workspace" ]; then mkdir -p "$HOME/workspace"; fi
if [ ! -d "$HOME/desktop" ]; then mkdir -p "$HOME/desktop"; fi

# Set Xrdb
#if [ ! "$XDG_VTNR" = "" ]; then
#    xrdb $HOME/.Xresources 
#fi
#echo -e "              ${green}[+]Set Xterm of Xrdb Successful${reset}\n"

# Set Locales Language
# sudo dpkg-reconfigure locales
sudo locale-gen "zh_CN.UTF-8" > /dev/null 2>&1
sudo dpkg-reconfigure --frontend=noninteractive locales > /dev/null 2>&1
echo -e "              ${green}[+]Set Locales Language is Successful${reset}\n"

# Set TimeZone
sudo timedatectl set-timezone "Asia/Shanghai"
echo -e "              ${green}[+]Set TimeZone is Successful${reset}\n"

# Set Add Hosts Speed Sudo 
if [ -f "/etc/hosts" ]; then
    sudo bash -c "echo -e '127.0.0.1\t$HOSTNAME' >> /etc/hosts"
fi
echo -e "              ${green}[+]Set Add Hosts is Successful${reset}\n"
}


#----------------------------------------------------------------------------------------#
# Repace Sources and System Update & Upgrade Packages
#----------------------------------------------------------------------------------------#

sysUpdate(){

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";         
echo -e "               ____            _                                               ";
echo -e "              / ___| _   _ ___| |_ ___ _ __ ___                                ";
echo -e "              \___ \| | | / __| __/ _ \ '_    _ \                              ";
echo -e "               ___) | |_| \__ \ ||  __/ | | | | |                              ";
echo -e "              |____/ \__, |___/\__\___|_| |_| |_|                              ";
echo -e "                     |___/                                                     ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Repace Sources and System Update ${reset}                 ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

#sudo ln -sf "$Dotfiles_repo/sources.list" "/etc/apt/sources.list"
#sudo cp "$Dotfiles_repo/sources.list" "/etc/apt/sources.list"
#echo -e "              ${green}[+]Repace sources.list Done !${reset}\n"
sudo apt update -y -qq > /dev/null 2>&1
echo -e "              ${green}[+]Update Successful !${reset}\n"
sudo apt upgrade -y -qq > /dev/null 2>&1
echo -e "              ${green}[+]Upgrade Successful !${reset}\n"
}

#----------------------------------------------------------------------------------------#
# Apt - Install
#----------------------------------------------------------------------------------------#

aptInstall() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "                  _      ____    _____                                         ";
echo -e "                 / \    |  _ \  |_   _|                                        ";
echo -e "                / _ \   | |_) |   | |                                          ";
echo -e "               / ___ \  |  __/    | |                                          ";
echo -e "              /_/   \_\ |_|       |_|                                          ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Apt - Install${reset}                                     ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

	aptApps=( \
	#------I3wm----------
	i3 \
        feh \
	mpv \
        rofi \
	i3blocks \
        i3lock-fancy \
	deepin-screenshot \
	solaar \
	imwheel \
	zathura \
	nautilus --no-install-recommends --no-install-suggests \
	#------System--------
	xinit \
	lua5.2 \
        ruby-full \
        openssh-server \
        openssh-client \
	#------Fcitx---------
	fcitx \
        fcitx-pinyin \
	#------Language------
	language-pack-zh-hans \
	#language-pack-gnome-zh-hans \
	#------VmWare--------
	open-vm-tools \
        open-vm-tools-desktop \
	#------Tools---------
        git \
        wget \
        curl \
        ranger \
        ripgrep \
        python3-pip \
	zip \
        unzip \
        jq \
        tldr \
        silversearcher-ag \
	xdotool \
	xclip \
	wmctrl \
	#ncdu \
	inotify-tools \
	#------Edit----------
        vim \
        vim-gtk \
	tmux \
        w3m \
	#------Mail----------
	neomutt \
        offlineimap \
        msmtp \
	newsboat \
	#------Other---------
        yank
	#------ignore--------
        #ctags \
        #compton \
        #i3status \
        #calibre \
        #xautolock \
        #gnome-keyring \
        #libsecret-tools \
	#python-pip \
	#alacritty \
	#bat \
	#zlib1g-dev \
	#tree \
	#xvfb \
	#dbus-x11 \
	#fonts-wqy-microhei \
	#xinput \
        #axel \
        #pv \
        #aria2 \
        #rar \
        #unrar \
        #ffmpeg \
        #vlc \
        #p7zip-full \
        #fcitx-module-cloudpinyin \
	#x11-xserver-utils \
        #xinit \
        )
        for app in "${aptApps[@]}"
        do
            echo -e "              [*] Installing: $app";
            sudo apt install -y -qq $app > /dev/null 2>&1
            installSuccess $? $app
        done
}

#----------------------------------------------------------------------------------------#
# Pip3 - Install
#----------------------------------------------------------------------------------------#

pipInstall() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "               ____    ___   ____    _____                                     ";
echo -e "              |  _ \  |_ _| |  _ \  |___ /                                     ";
echo -e "              | |_) |  | |  | |_) |   |_ \                                     ";
echo -e "              |  __/   | |  |  __/   ___) |                                    ";
echo -e "              |_|     |___| |_|     |____/                                     ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}PIP3 - Install${reset}                                    ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

	pipApps=( \
        #powerline-shell \
        #pandas \
        #django \
        #selenium \
        #ipython \
        #beautifulsoup4 \
        #notebook \
        #prompt-toolkit \
        pyvirtualdisplay \
        tabview \
        you-get \
        sncli \
        i3ipc \
        keyring \
        mdv \
        litecli \
        raiseorlaunch \
        xlsx2csv
        )
        for app in "${pipApps[@]}"
        do
            echo -e "              [*] Installing: $app";
            sudo pip3 install -q --timeout 1000 --retries 20  $app -i https://pypi.tuna.tsinghua.edu.cn/simple > /dev/null 2>&1
            installSuccess $? $app
        done
}

#----------------------------------------------------------------------------------------#
# Gem - Install
#----------------------------------------------------------------------------------------#

gemInstall() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "                ____   _____   __  __                                          ";
echo -e "               / ___| | ____| |  \/  |                                         ";
echo -e "              | |  _  |  _|   | |\/| |                                         ";
echo -e "              | |_| | | |___  | |  | |                                         ";
echo -e "               \____| |_____| |_|  |_|                                         ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}GEM - Install${reset}                                     ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

	gemApps=(\
        vimwiki_markdown
        )
        for app in "${gemApps[@]}"
        do
            echo -e "              [*] Installing: $app";
            gem sources --remove https://rubygems.org/ > /dev/null 2>&1
            gem sources -a https://gems.ruby-china.com/ > /dev/null 2>&1
            sudo gem install $app > /dev/null 2>&1
            #sudo gem install --local $Dotfiles_repo/bin/$app > /dev/null 2>&1
            installSuccess $? $app
        done
}

#----------------------------------------------------------------------------------------#
# Local - Install & Config
#----------------------------------------------------------------------------------------#

LocalDpkg() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "               _                    _                                          ";
echo -e "              | |    ___   ___ __ _| |                                         ";
echo -e "              | |   / _ \ / __/ _  | |                                         ";
echo -e "              | |__| (_) | (_| (_| | |                                         ";
echo -e "              |_____\___/ \___\__,_|_|  - Dpkg Install                         ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Local - Install ${reset}                                  ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

	dpkgApps=( \
        #ripgrep.deb \
        fd.deb \
        bat.deb \
        #resilio-sync.deb \
        Alacritty.deb
        )
        for app in "${dpkgApps[@]}"
        do
            echo -e "              [*] Installing: $app";
            sudo dpkg -i $Dotfiles_repo/bin/$app > /dev/null 2>&1
            installSuccess $? $app
        done
}

LoaclConfig() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "               _                    _                                          ";
echo -e "              | |    ___   ___ __ _| |                                         ";
echo -e "              | |   / _ \ / __/ _  | |                                         ";
echo -e "              | |__| (_) | (_| (_| | |                                         ";
echo -e "              |_____\___/ \___\__,_|_|  - Software Config & Settings           ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Local Software- Config & Settings  ${reset}               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

#----------------------------------------------------------------------------------------#
# Fcitx 
#----------------------------------------------------------------------------------------#

        im-config -n fcitx > /dev/null 2>&1
        im-config -s fcitx > /dev/null 2>&1
        # if [ -f "/usr/share/fcitx/imicon/pinyin.png" ]; then
        #     sudo mv /usr/share/fcitx/imicon/pinyin.png /usr/share/fcitx/imicon/pinyin.png1
    	# fi
    	# if [ -f "/usr/share/fcitx/skin/dark/cn.png" ]; then
        #     sudo cp $Dotfiles_repo/setup/fcitx/cn.png /usr/share/fcitx/skin/dark/active.png
    	# fi
    	# if [ -f "/usr/share/fcitx/skin/dark/vk_inactive.png" ]; then
        #     sudo cp $Dotfiles_repo/setup/fcitx/en.png /usr/share/fcitx/skin/dark/inactive.png
    	# fi
        echo -e "              ${green}[√] Fcitx Successful${reset}\n"

	
#----------------------------------------------------------------------------------------#
# TLDR 
#----------------------------------------------------------------------------------------#

#         if [ ! -f "/bin/tldr" ];then
#             sudo cp $Dotfiles_repo/bin/tldr /bin
#             sudo chmod +x /bin/tldr
#         else
#             sudo rm -rf /bin/tldr
#             sudo cp $Dotfiles_repo/bin/tldr /bin
#             sudo chmod +x /bin/tldr
#         fi
#         echo -e "              ${green}[√] TLDR Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Edge
#----------------------------------------------------------------------------------------#

        # Setup
        curl -s https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
        sudo rm microsoft.gpg
        # Install
        sudo apt update -y -qq > /dev/null 2>&1
        sudo apt install -y -qq microsoft-edge-dev > /dev/null 2>&1

        echo -e "              ${green}[√] Edge Successful${reset}\n"
        
#----------------------------------------------------------------------------------------#
# Chrome 
#----------------------------------------------------------------------------------------#

        # # Install Chrome
        # sudo wget -q -t 0 -P $HOME https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
        # sudo dpkg -i $HOME/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
        # sudo apt --fix-broken install -y -qq > /dev/null 2>&1
        # sudo dpkg -i $Dotfiles_repo/chrome/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
        # sudo rm -rf $HOME/google*
        # echo -e "              ${green}[√] Chrome Successful${reset}\n"
        
        # # Install ChromeDriver
        # if [ -f "/usr/local/share/chromedriver" ]; then
        #     sudo rm -rf /usr/local/share/chromedriver
        #     sudo cp -f $Dotfiles_repo/chrome/chromedriver /usr/local/share/chromedriver
        #     sudo chmod +x /usr/local/share/chromedriver
        #     sudo ln -sf /usr/local/share/chromedriver /usr/local/bin/chromedriver
        #     sudo ln -sf /usr/local/share/chromedriver /usr/bin/chromedriver
        # else
        #     sudo cp -f $Dotfiles_repo/chrome/chromedriver /usr/local/share/chromedriver
        #     sudo chmod +x /usr/local/share/chromedriver
        #     sudo ln -sf /usr/local/share/chromedriver /usr/local/bin/chromedriver
        #     sudo ln -sf /usr/local/share/chromedriver /usr/bin/chromedriver
        # fi
        # echo -e "              ${green}[√] ChromeDriver Successful${reset}\n"

        # # Unzip Chrome Plugin
        # if [ ! -d "$HOME/chrome-extend" ]; then
        #     env mkdir $HOME/chrome-extend
        # else
        #     rm -rf $HOME/chrome-extend
        #     env mkdir $HOME/chrome-extend
        # fi
        # unzip -q $Dotfiles_repo/chrome/darkreader.zip -d $HOME/chrome-extend
        # unzip -q $Dotfiles_repo/chrome/proxyswitch.zip -d $HOME/chrome-extend
        # unzip -q $Dotfiles_repo/chrome/tampermonkey.zip -d $HOME/chrome-extend
        # unzip -q $Dotfiles_repo/chrome/Surfingkeys.zip -d $HOME/chrome-extend
        # echo -e "              ${green}[√] Unzip ChromeExtend-Pack Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Tmux
#----------------------------------------------------------------------------------------#

        if [ ! -d "$HOME/.tmux" ]; then
            git clone -q https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        else
            sudo rm -rf $HOME/.tmux
            git clone -q https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
        fi
        tmux start-server
        tmux new-session -d
        $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh > /dev/null 2>&1
        tmux kill-server
        echo -e "              ${green}[√] TMUX Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# diff-so-fancy
#----------------------------------------------------------------------------------------#

        if [ ! -f "/usr/local/bin/diff-so-fancy" ]; then
            sudo cp -f $Dotfiles_repo/bin/diff-so-fancy /usr/local/bin
            sudo chmod 777 /usr/local/bin/diff-so-fancy
        else
            sudo rm -rf /usr/local/bin/diff-so-fancy
            sudo cp -f $Dotfiles_repo/bin/diff-so-fancy /usr/local/bin
            sudo chmod 777 /usr/local/bin/diff-so-fancy
        fi
        echo -e "              ${green}[√] Diff-So-Fancy Successful${reset}\n"
	
#----------------------------------------------------------------------------------------#
# Install trans
#----------------------------------------------------------------------------------------#

        if [ ! -f "/usr/local/bin/trans" ]; then
            sudo cp -f $Dotfiles_repo/bin/trans /usr/local/bin
            sudo chmod 777 /usr/local/bin/trans
        else
            sudo rm -rf /usr/local/bin/trans
            sudo cp -f $Dotfiles_repo/bin/trans /usr/local/bin
            sudo chmod 777 /usr/local/bin/trans
        fi
        echo -e "              ${green}[√] Trans Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Install FZF
#----------------------------------------------------------------------------------------#

#        $HOME/.fzf/install --all
#        echo -e "              ${green}[√] FZF Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Install Vim Plug
#----------------------------------------------------------------------------------------#

        vim
        echo -e "              ${green}[√] Vim Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Install Tabview
#----------------------------------------------------------------------------------------#

#        if [ -f "$HOME/.local/bin/tabview" ]; then
#            sudo cp $HOME/.local/bin/tabview /bin/
#            sudo chmod +x /bin/tabview
#        fi
#        echo -e "              ${green}[√] Tabview Successful${reset}\n"

#----------------------------------------------------------------------------------------#
# Install Rsync
#----------------------------------------------------------------------------------------#

#        if [ -f "/usr/bin/rslsync" ]; then
#	    sudo usermod -aG $USER rslsync &&\
#	    sudo usermod -aG rslsync $USER &&\
#	    sudo chmod g+rw $HOME &&\
#	    systemctl --user enable resilio-sync &&\
#	    systemctl --user start resilio-sync &&\
#	    sudo service resilio-sync start    
#        fi
#        echo -e "              ${green}[√] Rsync Successful${reset}\n"
}

#----------------------------------------------------------------------------------------#
# Install - Fonts
#----------------------------------------------------------------------------------------#

installFonts() {

echo -e "                                                                               ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";           
echo -e "               _____           _                                               ";
echo -e "              |  ___|__  _ __ | |_ ___                                         ";
echo -e "              | |_ / _ \| '_ \| __/ __|                                        ";
echo -e "              |  _| (_) | | | | |_\__ \                                        ";
echo -e "              |_|  \___/|_| |_|\__|___/   - Install                            ";
echo -e "                                                                               ";           
echo -e "-------------------------------------------------------------------------------";
echo -e "              ${blue}Fonts Install ${reset}                                    ";
echo -e "-------------------------------------------------------------------------------";
echo -e "                                                                               ";

        if [ ! -d "$HOME/fonts" ]; then
            git clone -q\
                https://hub.fastgit.org/hantaotaohan/fonts_minimize.git\
                $HOME/fonts && cd $HOME/fonts && ./install.sh
        else
            cd $HOME/fonts &&\
            git reset -q --hard && git pull -q && ./install.sh
        fi
}

#----------------------------------------------------------------------------------------#
# Make apps
#----------------------------------------------------------------------------------------#

# Make_apps() {
# 	pushd $Dotfiles_repo/setup/i3lock_fancy > /dev/null
# 	sudo make install
# 	popd > /dev/null
# 	echo -e "              ${green}[√] Make_apps Successful${reset}\n"
# }

#----------------------------------------------------------------------------------------#
# Install - Status
#----------------------------------------------------------------------------------------#

installSuccess() {
	if [ $1 -eq 0 ]; then
            echo -e "              ${green}[√] Install Success: $2${reset}\n";
	else
            echo -e "              ${red}[X] Install Failed: $2${reset}\n";
	fi
}


#----------------------------------------------------------------------------------------#
# Sync & Update - Dotfiles
#----------------------------------------------------------------------------------------#

Sync_Dotfiles() {
    git reset -q --hard && git pull -q
    echo -e "${green} ● Dotfiles Update Sync Complete ${reset}"
}

#----------------------------------------------------------------------------------------#
# Running Bash in Install.sh
#----------------------------------------------------------------------------------------#

main() {

#----------------------------------------------------------------------------------------#
# Auto Sync Dotfiles 
#----------------------------------------------------------------------------------------#

    Sync_Dotfiles

    echo "                                                                            "
    echo "-------------------------------------------------------------------------------"
    echo "                                                                               "
    echo " -h        Print this message                                                  "
    echo "                                                                               "
    echo " -A        Install All                                                         "
    echo " -D        Install Dotfiles & Enviroment                                       "
    echo " -S        Update System & Setup Alls Tools & Enviroment                       "
    echo "                                                                               "
    echo "-------------------------------------------------------------------------------"
    echo "                                                                               "
    echo " -1        Install Dotfiles                                                    "
    echo " -2        Uninstall Dotfiles                                                  "
    echo " -3        Install Environment                                                 "
    echo " -4        Install APT Tools                                                   "
    echo " -5        Install PIP3 Tools                                                  "
    echo " -6        Install GEM Tools                                                   "
    echo " -7        Install Local Bin Folder Tools                                      "
    echo " -8        Install Fonts                                                       "
    echo "                                                                               "
    echo "-------------------------------------------------------------------------------"
    echo "                                                                               "
    echo " -9        Install Server Edition                                              "
    echo "                                                                               "
    echo " -t        Install Tools                                                       "
    echo "                                                                               "
    echo " -q        Exit                                                                "
    echo "                                                                               "
    echo "-------------------------------------------------------------------------------"
    echo "                                                                               "

    read -r -p "Please select the mode you want to install ?  " input

    case "$input" in
        ''|-h|--help)
            usage
            exit 0
            ;;
        -[aA]|-all)
            install_dotfiles
            workspace_settings
            sysUpdate
            aptInstall
            pipInstall
            gemInstall
            LocalDpkg
            LoaclConfig
            installFonts
            Make_apps
            sudo apt-get -y -qq --purge remove byobu gnome-terminal yelp > /dev/null 2>&1
            sudo apt autoremove -y -qq > /dev/null 2>&1
            sudo apt-get clean > /dev/null 2>&1
            echo -e "              ${green}[√] *** All Install Successful *** ${reset}\n"
            cd $HOME
            bash $HOME/dotfiles/setup/setup_tools.sh
            cd $HOME
            bash
            ;;
        -[dD])
            install_dotfiles
            workspace_settings
            bash
            ;;
        -[sS])
            sysUpdate
            aptInstall
            pipInstall
            gemInstall
            LocalDpkg
            LoaclConfig
            Make_apps
            sudo apt-get -y -qq --purge remove byobu gnome-terminal yelp > /dev/null 2>&1
            sudo apt autoremove -y -qq > /dev/null 2>&1
            sudo apt-get clean
            echo -e "              ${green}[√] *** All Install Successful *** ${reset}\n"
            bash
            ;;
        -1)
            install_dotfiles
            bash
            ;;
        -2)
            uninstall_dotfiles
            bash
            ;;
        -3)
            workspace_settings
            bash
            ;;
        -4)
            aptInstall
            bash
            ;;
        -5)
            pipInstall
            bash
            ;;
        -6)
            gemInstall
            bash
            ;;
        -7)
            LocalDpkg
            LoaclConfig
            bash
            ;;
        -8)
            installFonts
            bash
            ;;
    	-9)
            bash $Dotfiles_repo/setup/install_server.sh
            bash
            ;;
	-[tT])
            bash $Dotfiles_repo/setup/setup_tools.sh
            bash
            ;;
        [qQ]) 
            exit; break 
            ;;
        *)
            echo -e"\nCommand not found" >&2
            exit 1
    esac
}

main "$@"
