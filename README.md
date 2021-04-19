# macbook base config setup
This script allows a quick base install of a colourful git prompt environment to be configured with homebrew/git/ohmyzsh & powerline fonts to be installed for new users.

<img width="650" alt="image" src="https://user-images.githubusercontent.com/7479585/112493489-1d2dcf00-8d7a-11eb-93cb-cef18de5d164.png">


Steps to use this script:

1) chmod +x setup.sh
2) ./setup.sh and follow user prompts
3) Edit /.zshrc and comment out ZSH_THEME=robbyrussell entry (Alternatively Ive uploaded my .zshrc - simply copy this to your home folder and overwrite your .zshrc. Assuming you have a vanilla .zshrc without any personal modifications)
4) Open iterm2 - goto Preferences > Profile > Text > Font and choose Meslo LG M for Powerline + change font size to your liking
5) Open iterm2 - goto Preferences > Profile > Colors > Color Presets > import and choose Clovis-iTerm2-Color-Scheme.itermcolors then select Color Presets again and select the new color scheme
6) Open Preferences -> Profiles -> Select Default Profile(default profile will be starred) -> General -> Command -> Select Login Shell -> Send text at start:
source ~/.zshrc

7) Close and reopen iterm2
