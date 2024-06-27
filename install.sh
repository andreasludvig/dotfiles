#!/bin/bash
# A shebang. Shell + bang. When executed tells the OS touse /bin/bash to interpret the script

# /bin contains binaries for every user. 
# /sbin contains essential binaries for the system to run
# /user/bin contains binaries whic are user-specific.
# In arch linux /bin and /sbin are just symlinks pointing to /usr/bin. As a result we can consider every
# binary to be in /usr/bin.

set -e # Exit immediately if a command exits with a non-zero status

########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo_hist" # Create this because its used in the nvim config file

ln -sf  "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"
# -s for symlink, and -f for force creation of the link - it removes any existin lnk or file with the
# same name before creating a new symlink. 
# ln -s <target> <symlink>. 
# So for our newly created link: when something looks for $XDG_CONFIG_HOME/nvim, redirect to the dotfiles folder
# instead
# When getting downloading this script from github and running it to recreate our configs, if the dirs does
# not exist (which they dont do if we have not created on our new machine/OS etc) we will get an error.
# So lets create the folders above the symlink

#####
# X #
#####

# Now symlink for .Xresources.
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"
# Creaete a symlink targeting the whole X11 dir this time, becase everythin in this dir shold be shared between systems. Here, we need to remove the dis manually, if it alreqady exists, for the symlink to be created. For symlinks to FILES that already exist, we can use the -f option, but this does not work for dirs.

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

###########
# WezTerm #
###########
rm -rf "$XDG_CONFIG_HOME/wezterm"
ln -s "$DOTFILES/wezterm" "$XDG_CONFIG_HOME/wezterm"

#######
# Zsh #
#######

# Create Zsh config folder and files and symlink them
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh/"



# Three ways to run our script
# 1 ./install.sh		The OS will run as a program. The shebang specifies the program to run it.
# 				Will run in a new non.interactive subshell.
# 2 bash install.sh		Tells the system to use bash to run the file, bypassing the shebang.
#				Will run in a bash subshell
# 3 source ./ install.sh	If we dont want to use a subshelle, this command will run it in our actual shell
# Before we can run teh scipt we must allow the file to be executable
echo "install script executed"
