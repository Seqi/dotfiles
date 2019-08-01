function dotfiles_path() {
	echo $(realpath $(dirname $0))
}

function is_wsl() {
	if grep -q Microsoft /proc/version; then
  		echo 1
	fi
}

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

#######################
#         Zsh         #
#######################

### Plugins ###
echo -e "\e[42m\n############ Installing zsh plugins ############\n\e[0m\e[32m"

# Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Firebase
git clone https://github.com/seqi/firebase-zsh ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/firebase

### Themes ###
echo -e "\e[0m\e[45m\n############ Installing zsh themes ############\n\e[0m\e[35m"

# Dracula
echo "Installing dracula theme"
ln -s $(dotfiles_path)/themes/dracula-zsh/dracula.zsh-theme ${ZSH:-~/.oh-my-zsh}/themes/dracula.zsh-theme 

#######################
#       .files        #
#######################

# Move dot files
echo -e "\e[0m\e[45m\n############ Moving .files ############\n\e[0m\e[35m"

dotfiles=(".aliases" ".gitconfig" ".profile" ".zshrc")
for dotfile in "${dotfiles[@]}";do	
	echo -e "Copying ${dotfile}"
    cp "$(dotfiles_path)/${dotfile}" $HOME/
done

if [ $(is_wsl) ]
then
	echo -e "Copying .wsl"
	cp "$(dotfiles_path)/.wsl" $HOME/
fi

#######################
#       VS Code       #
#######################

# Copy settings file across (linux only, non-WSL)
# Can't seem to reliably find Windows install location (%APPDATA)
if [ -e $HOME/.config/Code ]
then
	echo -e "\e[0m\e[41m\n############ Copying VS Code Config ############\n\e[0m"
	cp -f ./code/vscode/settings.json $HOME/.config/Code/User/settings.json
fi

# Install extensions
if hash code 2>/dev/null
then
	echo -e "\e[0m\e[46m\n############ Installing VS Code Extensions ############\n\e[0m\e[36m"
	code --install-extension CoenraadS.bracket-pair-colorizer
	code --install-extension dbaeumer.vscode-eslint
	code --install-extension Equinusocio.vsc-material-theme
	code --install-extension esbenp.prettier-vscode
	code --install-extension kuscamara.electron
	code --install-extension ms-azuretools.vscode-docker
	code --install-extension msjsdiag.debugger-for-chrome
	code --install-extension Orta.vscode-jest
	code --install-extension PKief.material-icon-theme
	code --install-extension robinbentley.sass-indented
	code --install-extension shd101wyy.markdown-preview-enhanced
	code --install-extension teabyii.ayu
	code --install-extension wart.ariake-dark
	code --install-extension xabikos.ReactSnippets
	code --install-extension Zignd.html-css-class-completion
	code --install-extension dracula-theme.theme-dracula
fi

# Install fonts
echo -e "Copying fonts"
mkdir -p ~/.fonts
cp ./fonts/* ~/.fonts/

# Make zsh default shell
echo -e "\e[0m\e[42m\n############ Setting zsh as default shell (password required) ############\n\e[0m\e[32m"
chsh -s $(which zsh)