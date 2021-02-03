# Turn off autocomplete beeps
unsetopt LIST_BEEP

# Set aliases
source ~/.aliases

# Add bin directories to PATH
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Add Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# If WSL, import WSL settings
function is_wsl() {
        if grep -q -i Microsoft /proc/version; then
                echo 1
        fi
}

if [ $(is_wsl) ]
then
        source ~/.wsl
fi
