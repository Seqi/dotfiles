# Turn off autocomplete beeps
unsetopt LIST_BEEP

# Configure firebase-zsh plugin
FIREBASE_ZSH_ICON=true

# Set aliases
source ~/.aliases

# Add bin directories to PATH
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Add Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# If WSL, import WSL settings
if [ $(is_wsl) ]
then
        source ~/.wsl
fi
