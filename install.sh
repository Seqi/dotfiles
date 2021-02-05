# Bring in OS Helpers
source ./os_check.zsh

#######################
#         Zsh         #
#######################

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

### Plugins ###
echo -e "\033[0m\033[42m\n############ Installing zsh plugins ############\n\e[0m\e[32m"

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Firebase
git clone https://github.com/seqi/firebase-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase

### Themes ###
echo -e "\033[0m\033[45m\n############ Installing zsh themes ############\n\033[0m\033[35m"

# Dracula
echo "Installing dracula theme"
ln -s $(pwd)/themes/dracula-zsh/dracula.zsh-theme ${ZSH:-~/.oh-my-zsh}/themes/dracula.zsh-theme 

echo "Adding zsh helpers"
cp "$(pwd)/os_check.zsh" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

#######################
#       .files        #
#######################

# Move dot files
echo -e "\033[0m\033[46m\n############ Moving .files ############\n\033[0m\033[36m"

dotfiles=(".aliases" ".gitconfig" ".profile" ".zshrc")
for dotfile in "${dotfiles[@]}";do	
	echo -e "Copying ${dotfile}"
    cp "$(pwd)/${dotfile}" $HOME/
done

if [ $(is_wsl) ]
then
	echo -e "Copying .wsl"
	cp "$(pwd)/.wsl" $HOME/

	echo -e "Copying wsl.conf"
	cp "$(pwd)/wsl.conf" /etc/
fi

# Install fonts
echo -e "Copying fonts"
mkdir -p ~/.fonts
cp ./fonts/* ~/.fonts/

#######################
#      Finish up      #
#######################

# Make zsh default shell
echo -e "\033[0m\033[42m\n############ Setting zsh as default shell (password required) ############\n\033[0m\033[32m"
chsh -s $(which zsh)
