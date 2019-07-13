# Move dot files
dotfiles=(".aliases" ".gitconfig" ".profile" ".zshrc")
for dotfile in "${dotfiles[@]}";do
    cp "./${dotfile}" $HOME/
done