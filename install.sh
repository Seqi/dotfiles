# Bring in OS Helpers
source ./os_check.zsh

#######################
#         Zsh         #
#######################
echo -e "\033[0m\033[41m############ Installing oh-my-zsh ############\033[0m\033[31m\n"

# Install oh-my-zsh
if [[ -d "~/.oh-my-zsh" ]]
then
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
else
	echo "oh-my-zsh already installed"
fi

### Plugins ###
echo -e "\n\033[30m\033[44m############ Installing zsh plugins ############\033[0m\033[34m\n"

# Syntax Highlighting
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]]
then
	echo 'Installing zsh-syntax-highlighting'
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
	echo 'Updating zsh-syntax-highlighting'
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting pull
fi

# Autosuggestions
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]
then
	echo 'Installing zsh-autosuggestions'
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
	echo 'Updating zsh-syntax-autosuggestions'
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions pull
fi

# Firebase
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase ]]
then
	echo 'Installing firebase-zsh'
	git clone https://github.com/seqi/firebase-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase	
else
	echo 'Updating firebase-zsh'
	git -C ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase pull
fi

### Themes ###
echo -e "\n\033[30m\033[42m############ Installing zsh themes ############\033[0m\033[32m\n"

echo 'Installing theme..'

if [[ -d "$HOME/.zsh/pure" ]]
then
	echo 'Already exists, removing current'
	rm -r "$PWD/themes/pure"
fi

mkdir -p $HOME/.zsh
cp -r "$PWD/themes/pure" "$HOME/.zsh"
echo 'Installed'

#######################
#       .files        #
#######################

# Move dot files
echo -e "\n\033[30m\033[46m############ Moving .files ############\033[0m\033[36m\n"

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
#    Finishing Up     #
#######################

echo -e "\n\033[30m\033[43m############ Finishing up ############\033[0m\033[33m\n"
echo "Adding zsh helpers"
cp "$(pwd)/os_check.zsh" ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

echo -e "\n\033[0m\033[32mComplete!\033[0m"
