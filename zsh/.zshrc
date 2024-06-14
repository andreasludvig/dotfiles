# Set the fpath. https://zsh.sourceforge.io/Doc/Release/Functions.html
# A function can be marked as undefined using the autoload builtin. Such a function has no body. When the function is first executed, the shell searches for its definition using the elements of the fpath variable. Thus to define functions for autoloading, a typical sequence is:
#	fpath=(~/myfuncs $fpath)
#	autoload myfunc1 myfunc2 ...

# Set our fpath (function path)
fpath=($ZDOTDIR/external $fpath)

# Source the aliases file
source "$XDG_CONFIG_HOME/zsh/aliases"

# Load the zsh module complist. Modules have functionalies not part of core Zsh
# Complisti gives acces to menuselect, to customise move of cursor doing 
# autocomplete.
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


# Setup Zsh autocompletion. Call the function compinit
autoload -Uz compinit; compinit
# autoload command loads a file containing shell commands.
# To find this file zsh will look in teh directories of the Zsh file searc path defined in the variable $fpath. From there it'll try and find a file named compinit
# When the file compinit is found its loaded as a function# 
# Autocomplete fidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh
# By default autocompletion does not work for dotfiles. 
# The second line is the source file competion.zsh

# Setup new custom prompt. Function is in dotfiles/zsh/external
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Setup up directory stack. 
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using
setopt PUSHD_SILENT
# Each dir visited will be added to the stack. 
# dirs -v displays dirs visited by numbered line
# cd $<number> jumps to that dir. Will setup an alias for this

# Enable Vi mode
bindkey -v
export KEYTIMEOUT=1
# Switch between insert and normal mode with ESC. KEYTIMEOUT makes the switch faster. 
# Load function for cursor changing style dependent on the current Vi mode
autoload -Uz cursor_mode && cursor_mode
# Editing commands for the command line using an editor (here nvim)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# When in command mode in the commandline, press v to enter prefered editor
# Type the command you want, and exit with :wq.

# BD
source ~/dotfiles/zsh/external/bd.zsh

#############
#### FZF ####
#############
#If fzf exists source completion for Zsh and create keybindings:
# If the fzf command works redirect the output of the command to the bin box/garebage can, that is /dev/null. 2>&1 mean redirect the exit code to the same plase. 
if command -v "fzf" >/dev/null 2>&1; then
    if source /usr/share/fzf/completion.zsh; then
        echo "Successfully sourced completion.zsh"
    else
        echo "Failed to source completion.zsh"
    fi

    if source /usr/share/fzf/key-bindings.zsh; then
        echo "Successfully sourced key-bindings.zsh"
    else
        echo "Failed to source key-bindings.zsh"
    fi
else
    echo "fzf is not installed"
fi


# Check if the command `fzf` exists in the system
if command -v "fzf" >/dev/null 2>&1; then
    # If `fzf` exists, attempt to source the completion script
    if ! source /usr/share/fzf/completion.zsh; then
        # If sourcing `completion.zsh` fails, print an error message
        echo "Error: completion.zsh not found or failed to source"
    fi
    
    # Attempt to source the key-bindings script
    if ! source /usr/share/fzf/key-bindings.zsh; then
        # If sourcing `key-bindings.zsh` fails, print an error message
        echo "Error: key-bindings.zsh not found or failed to source"
    fi
else
    # If `fzf` is not found, print an error message
    echo "Error: fzf is not installed"
fi

# Setup fzf searches:
# Use ripgrep, rg, by default. Search for files, adn hidden files, exclude anu file or directory called .git. 
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# CTRL+t searhc file in current and subdirectories
# CTRL+r Search entry in the command history
# ALT+c search and select a subdirecotyr to make it pwd/cwd
# Can aso fzf for a process to kill by typing "kill" followed by TAB
# By default fzf uses the find command under the hood, but a faster alternaitve is ripgrep. Install it:
# sudo pacman -S ripgrep
# Can now also use the rg command instead of grep.

# Launch i3 on startup
if [ "$(tty) = /dev/tty1" ];
then
	pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
# pgrep (process grep) allows to fetch a specific process. 
# If the i3 process does not exist, the exec ... command is done
# exec replaces the shell rocess (running after logging in) with teh startx process which is tehn replace by i3 due to our .xinitrc file. 
# The $() notation runs a command and return its output. if it was not there
# we were just setting tty = /dev/tty1 which is of course never true. 
	

# Load custom scripts 
source $DOTFILES/zsh/scripts.sh

# ZSH PLUGINS
# External pieces of configuration we can add to our own. 
# download and use Zsh additional autocompletion
# sudo pacman -S zsh-completions
# Zsh now supports more CLIs to aouto-complete their arguments
# zsh syntax hightlighting:
# sudo pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# syntax highlighting should be sourced in the script, everything loaded
# before will tehn be able to use syntax highlighting if needed. 
