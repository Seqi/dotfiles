# Turn off autocomplete beeps
unsetopt LIST_BEEP

# Set aliases
source ~/.aliases

# Add bin directories to PATH
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# If WSL, import WSL settings
function is_wsl() {
	if grep -q Microsoft /proc/version; then
  		echo 1
	fi
}

if [ $(is_wsl) ]
then 
	source ~/.wsl
fi