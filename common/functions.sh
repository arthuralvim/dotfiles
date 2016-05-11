##################
# Code # Color   #
##################
#  00  # Off     #
#  30  # Black   #
#  31  # Red     #
#  32  # Green   #
#  33  # Yellow  #
#  34  # Blue    #
#  35  # Magenta #
#  36  # Cyan    #
#  37  # White   #
##################

export OSX=$(test "`uname`" == "Darwin" && echo "osx")
export LINUX=$(test "`uname`" == "Linux" && echo "linux")
export DOTFILES_DIR="$HOME/Dropbox/dotfiles"

function print { echo -e "\033[1;32m=> $1\033[0m"; }
function msg_checking { echo -e "\033[1;32m=> $1 ✔\033[0m"; }
function msg_installing { echo -e "\033[1;33m==> $1 [updating] ✔\033[0m"; }
function msg_install { echo -e "\033[1;33m==> $1 [installing]: $ $2\033[0m"; }
function msg_ok { echo -e "\033[1;32m==> $1 installed ✔\033[0m"; }
function msg { echo -e "\033[0;32m$1\033[0m"; }
function msg_alert { echo -e "\033[1;31m✖ $1 ✖\033[0m"; }

function file_to_array() {
    array=()
    while IFS= read -r line
    do
        array+=("$line")
    done < "$1"
}
