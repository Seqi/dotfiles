function is_wsl() {
        if grep -q -i Microsoft /proc/version; then
                echo 1
        fi
}

function is_osx() {
        if [ "$(uname 2> /dev/null)" != "Linux" ]; then
                echo 1
        fi
}
