#!/bin/bash

#Check if Homebrew is installed
command -v brew
if [[ $? != 0 ]] ; then
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users\/$USER/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    brew update
fi

sudo chown -R "$(whoami)" /opt/homebrew

#Install Rosetta as Bluejeans and Signal require it on M1 Macs
if [[ $(uname -m) == 'arm64' ]] ; then
   echo 'Installing Rosetta for M1 platform as needed for Bluejeans and Signal'
   /usr/sbin/softwareupdate --install-rosetta --agree-to-licence
   if [ $? -eq 0 ]; then
      echo 'Rosetta has been installed - all is groovy'
    else
      echo 'Rosetta install failed - please install manually'
    fi
else
    echo 'Plaform is not M1 - continuing'
fi

#Install required packages for new mac install - remove as required if you dont need them
brew install wget
brew install grep
brew install git
brew install --cask iterm2
brew install --cask slack
brew install --cask zoom
brew install --cask bluejeans
brew install --cask discord
brew install --cask whatsapp
brew install --cask cyberduck
brew install --cask skype
brew install --cask wireshark
brew install --cask firefox
brew install --cask signal
brew install --cask viscosity
brew install --cask royal-tsx
brew install zsh zsh-completions
brew install zsh-syntax-highlighting
brew install authy
brew install teamviewer
#brew install bitwarden > no longer required switched to 1password
brew install 1password
#brew install spectacle > no longer required switched to rectangle
brew install rectangle
brew install htop
brew install homebrew/cask-drivers/logitech-options
brew install tfenv
brew install awscli
brew install pyenv
brew install packer
brew install terragrunt
brew install ack
brew install azure-cli
brew install ncdu
brew install tree
brew install aws-okta
brew install atom
brew install python3



#Install fonts
cd "$HOME" || exit
git clone https://github.com/powerline/fonts.git
cd fonts || exit
./install.sh

#Install oh my zsh
cd "$HOME" || exit
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
chmod +x install.sh
./install.sh --unattended

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

#Add zsh autosuggestions
#Source zshrc to populate zsh_custom variable
source "$HOME"/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM"/plugins/zsh-autosuggestions

cat <<EOF >> ~/.zshrc
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
plugins=(git zsh-autosuggestions)
ZSH_THEME="powerlevel9k/powerlevel9k"
# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"
# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF
