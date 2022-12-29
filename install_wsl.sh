#!/usr/bin/env bash

clear

#------------------------------------------------------------------------------------------#
# Start            
#------------------------------------------------------------------------------------------#

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";
echo -e "                 ___  _   _  ____   _____     _     _      _                     ";
echo -e "                |_ _|| \ | |/ ___| |_   _|   / \   | |    | |                    ";
echo -e "                 | | |  \| |\___ \   | |    / _ \  | |    | |                    ";
echo -e "                 | | | |\  | ___) |  | |   / ___ \ | |___ | |___                 ";
echo -e "                |___||_| \_||____/   |_|  /_/   \_\|_____||_____|                ";
echo -e "                                                                                 ";                                                                                    
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                TaoTao - Saber - Debian - Desktop - Install                      ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

#------------------------------------------------------------------------------------------#
# Setting Bash Colors Variable     
#------------------------------------------------------------------------------------------#

RED='\e[1;31m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
WHITE='\e[0;37m'
RESET='\e[0;37m'

#------------------------------------------------------------------------------------------#
# Setting Bash Variable              
#------------------------------------------------------------------------------------------#

BACKUP_DIR="$HOME/.dotfiles.orig"
BIN_DIR="$HOME/.local/bin"
DOTFILES_REPO=$(pwd)

GITHUB="github.com"
GITHUBRAW="https://github.com/hantaotaohan/dotfiles/releases/download/1.0.0"

DOTFILES_COPY=( \
    .cargo \
    .config \
    .extras \
    .pip \
    .vim \
    .w3m \
    .Xmodmap \
    .Xresources
    .aliases \
    .bash_profile \
    .bash_prompt \
    .bashrc \
    .ctags \
    .curlrc \
    .dircolors \
    .exports \
    .functions \
    .gemrc \
    .gitconfig \
    .gitignore \
    .inputrc \
    .msmtprc \
    .npmrc \
    .offlineimaprc \
    .ripgreprc \
    .tmux.conf \
    .vimrc \
    .wgetrc
)

#------------------------------------------------------------------------------------------#
# Setting Print usage message.         
#------------------------------------------------------------------------------------------#

usage() {
    local program_name
    program_name=${0##*/}
    cat <<EOF

Usage: $program_name [-option]

Options:
                                                                            
--------------------------------------------------------------------------------------------
                                                                              
   -h        Print this message                                               
                                                                              
   -a        Install All                                                                     
                                                                              
--------------------------------------------------------------------------------------------
                                                                              
   -d        Install Dotfiles                                                 
   -D        Uninstall Dotfiles                                               
   -w        Install Workspace                                              
   -h        Install Hosts                                              
   -a        Install APT Tools                                                
   -p        Install PIP3 Tools                                               
   -b        Install DEB Tools                                                
   -r        Remove Apps   
                                                                        
   -q        Exit                                                             
                                                                              
--------------------------------------------------------------------------------------------
                                                                            
EOF

}

#------------------------------------------------------------------------------------------#
# Start Install Dotfiles   
#------------------------------------------------------------------------------------------#

Install_Dotfiles() {
 
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                 ____        _    __ _ _                                         ";
echo -e "                |  _ \  ___ | |_ / _(_) | ___  ___                               ";
echo -e "                | | | |/ _ \| __| |_| | |/ _ \/ __|                              ";
echo -e "                | |_| | (_) | |_|  _| | |  __/\__ \                              ";
echo -e "                |____/ \___/ \__|_| |_|_|\___||___/                              ";
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Start Backup and Install Dotfiles${RESET}                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

    # >>> Backup Config.

    if ! [ -f "$BACKUP_DIR/check-backup.txt" ]; then
        env mkdir -p "$BACKUP_DIR/.config"
        cd "$BACKUP_DIR" || exit
        touch check-backup.txt

    # >>> Backup Some Folder In ~/.config To ~/.dotfiles.orig/.config

        for dots_copy in "${DOTFILES_COPY[@]//./}"
        do
            env cp -rf "$HOME/${dots_copy}" "$BACKUP_DIR/.config" &> /dev/null
        done

    # >>> Backup Again With Git.

        if [ -x "$(command -v git)" ]; then
            git init &> /dev/null
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Backup original config on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi

    # >>> Output.

        echo -e "\t\t${BLUE}Your config is backed up in ${BACKUP_DIR}\n" >&2
        echo -e "\t\t${RED}Please do not delete check-backup.txt in .dotfiles.orig folder.${WHITE}" >&2
        echo -e "\t\tIt's used to backup and restore your old config.\n" >&2
    fi

    # >>> Install Move(CP) .config/ To $HOME/.config

    for dots_copy in "${DOTFILES_COPY[@]}"
    do
        sudo rm -rf "$HOME/${dots_copy}"
        cp -rf "$DOTFILES_REPO/${dots_copy}" "$HOME/"
    done

    # >>> Install Sources.list | .source To etc/apt/sources.list

    sudo cp -rf "$DOTFILES_REPO/sources.list" "/etc/apt/sources.list"
    echo -e "\t\t${GREEN}[+]Repace sources.list Done !${RESET}\n"

    # >>> Output.

    echo -e "\t\t${BLUE}New dotfiles is installed!\n${WHITE}" >&2
    echo -e "\t\tThere may be some errors when Terminal is restarted." >&2
    echo -e "\t\tPlease read carefully the error messages and make sure." >&2
    echo -e "\t\tall packages are installed. See more info in README.md." >&2
    echo -e "\t\tNote that the author of this dotfiles uses dev branch in some packages." >&2
    echo -e "\t\tIf you want to restore your old config, " >&2
    echo -e "\t\tyou can use ${RED}./install.sh -r${WHITE} command.\n" >&2
}

#------------------------------------------------------------------------------------------#
# Uninstall Dotfiles          
#------------------------------------------------------------------------------------------#

Uninstall_Dotfiles() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                 ____        _    __ _ _                                         ";
echo -e "                |  _ \  ___ | |_ / _(_) | ___  ___                               ";
echo -e "                | | | |/ _ \| __| |_| | |/ _ \/ __|                              ";
echo -e "                | |_| | (_) | |_|  _| | |  __/\__ \                              ";
echo -e "                |____/ \___/ \__|_| |_|_|\___||___/    - Restore                 ";
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Restore Dotfile Initial State${RESET}                     ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

    if [ -f "$BACKUP_DIR/check-backup.txt" ]; then
        for dots_copy in "${DOTFILES_COPY[@]}"
        do
            env rm -rf "$HOME/${dots_copy}"
            env cp -rf "$BACKUP_DIR/${dots_copy}" "$HOME/" &> /dev/null
            env rm -rf "$BACKUP_DIR/${dots_copy}"
        done

        # >>> Save Old Config In Backup Directory With Git.
        if [ -x "$(command -v git)" ]; then
            cd "$BACKUP_DIR" || exit
            git add -u &> /dev/null
            git add . &> /dev/null
            git commit -m "Restore original on $(date '+%Y-%m-%d %H:%M')" &> /dev/null
        fi
    fi

    if ! [ -f "$BACKUP_DIR/check-backup.txt" ]; then
        echo -e "\t\t${RED}You have not installed this dotfiles yet.${WHITE}" >&2
        exit 1
    else
        echo -e "\t\t${BLUE}Your old config has been restoRED!\n${WHITE}" >&2
        echo -e "\t\tThanks for using my dotfiles." >&2
        echo -e "\t\tEnjoy your next journey!" >&2
    fi

    env rm -rf "$BACKUP_DIR/check-backup.txt"

}

#------------------------------------------------------------------------------------------#
# Workspace Settings      
#------------------------------------------------------------------------------------------#

Workspace_Settings() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";
echo -e "                 _____   _   _  __     __                                        ";
echo -e "                | ____| | \ | | \ \   / /                                        ";
echo -e "                |  _|   |  \| |  \ \ / /                                         ";
echo -e "                | |___  | |\  |   \ V /                                          ";
echo -e "                |_____| |_| \_|    \_/                                           ";
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}System Environment Configuration${RESET}                  ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

# >>> Make Floder

if [ ! -d "$HOME/workspace" ]; then mkdir -p "$HOME/workspace"; fi
if [ ! -d "$HOME/desktop" ]; then mkdir -p "$HOME/desktop"; fi

}

#------------------------------------------------------------------------------------------#
# Repace Sources and System Update & Upgrade Packages        
#------------------------------------------------------------------------------------------#

System_Update() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";         
echo -e "                 ____            _                                               ";
echo -e "                / ___| _   _ ___| |_ ___ _ __ ___                                ";
echo -e "                \___ \| | | / __| __/ _ \ '_    _ \                              ";
echo -e "                 ___) | |_| \__ \ ||  __/ | | | | |                              ";
echo -e "                |____/ \__, |___/\__\___|_| |_| |_|                              ";
echo -e "                       |___/                                                     ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Repace Sources and System Update ${RESET}                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

sudo cp -rf "$DOTFILES_REPO/sources.list" "/etc/apt/sources.list"
echo -e "\t\t${GREEN}[+]Repace sources.list Done !${RESET}\n"
sudo apt update -y -qq > /dev/null 2>&1
echo -e "\t\t${GREEN}[+]Update Successful !${RESET}\n"
sudo apt upgrade -y -qq > /dev/null 2>&1
echo -e "\t\t${GREEN}[+]Upgrade Successful !${RESET}\n"

}

#------------------------------------------------------------------------------------------#
# Apt - Install     
#------------------------------------------------------------------------------------------#

Apt_Install() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";           
echo -e "                    _      ____    _____                                         ";
echo -e "                   / \    |  _ \  |_   _|                                        ";
echo -e "                  / _ \   | |_) |   | |                                          ";
echo -e "                 / ___ \  |  __/    | |                                          ";
echo -e "                /_/   \_\ |_|       |_|                                          ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Apt - Install${RESET}                                     ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

	APTAPPS=( \
        lua5.2 \
        # ruby-full \
        openssh-server \
        openssh-client \
        jq \
        w3m \
        zip \
        htop \
        wget \
        curl \
        ncdu \
        unzip \
        ranger \
        ripgrep \
        newsboat \
        tty-clock \
        python3-pip \
        inotify-tools \
        universal-ctags \
        silversearcher-ag \
        vim \
        tmux \
        msmtp \
        neomutt \
        offlineimap \
        yank \
        # pv \
        # rar \
        # vlc \
        # bat \
        # xvfb \
        # tree \
        # axel \
        # unrar \
        # aria2 \
        # ffmpeg \
        # xinput \
        # ctags \
        # solaar \
        # compton \
        # i3status \
        # calibre \
        # dbus-x11 \
        # alacritty \
        # xautolock \
        # zlib1g-dev \ 
        # p7zip-full \
        # python-pip \
        # gnome-keyring \
        # libsecret-tools \
        # x11-xserver-utils \
        # fonts-wqy-microhei \
        # fcitx-module-cloudpinyin \
    )

    for app in "${APTAPPS[@]}"
    do
        echo -e "\t\t[*] Installing: $app";
        sudo apt install -y -qq $app > /dev/null 2>&1
        Install_Status $? $app
    done

}

#------------------------------------------------------------------------------------------#
# Pip3 - Install        
#------------------------------------------------------------------------------------------#

Pip_Install() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";           
echo -e "                 ____    ___   ____    _____                                     ";
echo -e "                |  _ \  |_ _| |  _ \  |___ /                                     ";
echo -e "                | |_) |  | |  | |_) |   |_ \                                     ";
echo -e "                |  __/   | |  |  __/   ___) |                                    ";
echo -e "                |_|     |___| |_|     |____/                                     ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}PIP3 - Install${RESET}                                    ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

	PIPAPPS=( \
        flake8 \
        pygments==2.11.2 \
        you-get \
        pyvirtualdisplay 
        #mdv \
        #sncli \
        #pandas \
        #django \
        #litecli \
        #tabview \
        #you-get \
        #ipython \
        #xlsx2csv \
        #notebook \
        #selenium \
        #beautifulsoup4 \
        #prompt-toolkit \
        #powerline-shell \
    )

    for app in "${PIPAPPS[@]}"
    do
        echo -e "\t\t[*] Installing: $app";
        sudo pip3 install -q --timeout 1000 --retries 20  $app -i \
        https://pypi.tuna.tsinghua.edu.cn/simple > /dev/null 2>&1
        Install_Status $? $app
    done

}

#------------------------------------------------------------------------------------------#
# Local - Install & Config       
#------------------------------------------------------------------------------------------#

Deb_Install() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";           
echo -e "                 _                    _                                          ";
echo -e "                | |    ___   ___ __ _| |                                         ";
echo -e "                | |   / _ \ / __/ _  | |                                         ";
echo -e "                | |__| (_) | (_| (_| | |                                         ";
echo -e "                |_____\___/ \___\__,_|_|  - Dpkg Install                         ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Local - Install ${RESET}                                  ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

	wget -P $BIN_DIR $GITHUBRAW/fd.deb > /dev/null 2>&1
	wget -P $BIN_DIR $GITHUBRAW/bat.deb > /dev/null 2>&1
	wget -P $BIN_DIR $GITHUBRAW/glow.deb > /dev/null 2>&1
	wget -P $BIN_DIR $GITHUBRAW/delta.deb > /dev/null 2>&1
	# wget -P $BIN_DIR $GITHUBRAW/foliate.deb > /dev/null 2>&1
	# wget -P $BIN_DIR $GITHUBRAW/Alacritty.deb > /dev/null 2>&1
	# wget -P $BIN_DIR $GITHUBRAW/timeshift.deb > /dev/null 2>&1
	
	DPKGAPPS=( \
        fd.deb \
        bat.deb \
        glow.deb \
        delta.deb
        # Alacritty.deb
    )

    for app in "${DPKGAPPS[@]}"
    do
        echo -e "\t\t[*] Installing: $app";
        sudo dpkg -i $BIN_DIR/$app > /dev/null 2>&1
        Install_Status $? $app
    done

}

LoaclConfig() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";           
echo -e "                 _                    _                                          ";
echo -e "                | |    ___   ___ __ _| |                                         ";
echo -e "                | |   / _ \ / __/ _  | |                                         ";
echo -e "                | |__| (_) | (_| (_| | |                                         ";
echo -e "                |_____\___/ \___\__,_|_|  - Software Config & Settings           ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Local Software- Config & Settings  ${RESET}               ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

#------------------------------------------------------------------------------------------#
# Tmux                                
#------------------------------------------------------------------------------------------#

    if [ ! -d "$HOME/.tmux" ]; then
        git clone -q https://${GITHUB}/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
    fi
    
    tmux start-server
    tmux new-session -d
    $HOME/.tmux/plugins/tpm/scripts/install_plugins.sh > /dev/null 2>&1
    tmux kill-server
    echo -e "\t\t${GREEN}[√] TMUX Successful${RESET}\n"

#------------------------------------------------------------------------------------------#
# Install Vim Plug                      
#------------------------------------------------------------------------------------------#

    vim
    echo -e "\t\t${GREEN}[√] Vim Successful${RESET}\n"

}

#------------------------------------------------------------------------------------------#
# Apt Remove        
#------------------------------------------------------------------------------------------#

Apt_Remove() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";           
echo -e "                _ __ ___ _ __ ___   _____   _____                                ";
echo -e "               | '__/ _ \ '_ ' _ \ / _ \ \ / / _ \                               ";
echo -e "               | | |  __/ | | | | | (_) \ V /  __/                               ";
echo -e "               |_|  \___|_| |_| |_|\___/ \_/ \___|                               ";
echo -e "                                                                                 ";           
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Apt Remove ${RESET}                                       ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";
                                   
	APTAPPS=( \
        yelp \
        byobu \
        rxvt-unicode \
        gnome-terminal \
        xdg-desktop-portal-gtk 
    )

	for app in "${APTAPPS[@]}"
	do
        echo -e "\t\t[*] Remove: $app";
        sudo apt-get -y -qq --purge $app > /dev/null 2>&1
        sudo apt autoremove -y -qq > /dev/null 2>&1
        sudo apt-get clean > /dev/null 2>&1
        Install_Status $? $app
	done

}

#------------------------------------------------------------------------------------------#
# Install - Status      
#------------------------------------------------------------------------------------------#

Install_Status() {

	if [ $1 -eq 0 ]; then
        echo -e "\t\t${GREEN}[√] Install Success: $2${RESET}\n";
	else
        echo -e "\t\t${RED}[X] Install Failed: $2${RESET}\n";
	fi
	
}

#-----------------------------------------------------------------------------------------#
# Install - Hosts        
#-----------------------------------------------------------------------------------------#

Install_Hosts() {

    sudo sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts | sudo tee -a /etc/hosts > /dev/null 2>&1
    echo -e "\t\t${GREEN}[√] Hosts Repace Successful${RESET}\n"

}

#-----------------------------------------------------------------------------------------#
# Sync & Update - Dotfiles     
#-----------------------------------------------------------------------------------------#

Sync_Dotfiles() {

echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";
echo -e "                                                                                 ";
echo -e "                 _____ _ _   _           _                                       ";
echo -e "                |  __ (_) | | |         | |                                      ";
echo -e "                | |  \/_| |_| |__  _   _| |__    ___ _   _ _ __   ___            ";
echo -e "                | | __| | __| |_ \| | | | '_ \  / __| | | | |_ \ / __|           ";
echo -e "                | |_\ \ | |_| | | | |_| | |_| | \__ \ |_| | | | | |__            ";
echo -e "                 \____/_|\__|_| |_|\__,_|_.__/  |___/\__, |_| |_|\___|           ";
echo -e "                                                      __/ |                      ";
echo -e "                                                     |___/                       ";
echo -e "                                                                                 ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                ${BLUE}Github Sync ${RESET}                                      ";
echo -e "---------------------------------------------------------------------------------";
echo -e "                                                                                 ";

    git reset -q --hard && git pull -q
    echo -e "\t\t${GREEN} ● Dotfiles Update Sync Complete ${RESET}"
}

#------------------------------------------------------------------------------------------#
# Running Bash in Install.sh     
#------------------------------------------------------------------------------------------#

main() {

#------------------------------------------------------------------------------------------#
# Auto Sync Dotfiles               
#------------------------------------------------------------------------------------------#

    Sync_Dotfiles

    case "$1" in
        ''|-h|--help)
            usage
            exit 0
            ;;
        -a|--all)
            Install_Dotfiles
            Workspace_Settings
            System_Update
            Apt_Install
            Install_Hosts
            Pip_Install
            Deb_Install
            LoaclConfig
            Apt_Remove
            echo -e "\t\t${GREEN}[√] *** All Install Successful *** ${RESET}\n"
            cd $HOME
            bash
            ;;
        -d|--dotfiles)
            Install_Dotfiles
            bash
            ;;
        -D|--remove-dotfiles)
            Uninstall_Dotfiles
            bash
            ;;
        -w|--workspace)
            Workspace_Settings
            bash
            ;;
        -h|--hosts)
            Install_Hosts
            bash
            ;;
        -a|--apt)
            Apt_Install
            bash
            ;;
        -p|--pip)
            Pip_Install
            bash
            ;;
        -l|--local)
            LoaclConfig
            bash
            ;;
        -b|--deb)
            Deb_Install
            bash
            ;;
        -r|--remove)
            Apt_Remove
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
