# Turn off autocomplete beeps
unsetopt LIST_BEEP

# Configure firebase-zsh plugin
FIREBASE_ZSH_ICON=false
FIREBASE_ZSH_STYLE=plain

# Configure pure theme
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:prompt:success color cyan

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
