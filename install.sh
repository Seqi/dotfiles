# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

### Install Zsh Plugins ###

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Firebase
git clone https://github.com/seqi/firebase-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase

### Install Zsh Themes ###

# Dracula
git clone https://github.com/dracula/zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula

# Move dot files
bash ./update.sh

# Install fonts
mkdir -p ~/.fonts
cp ./fonts/* ~/.fonts/

# Make zsh default shell
chsh -s $(which zsh)