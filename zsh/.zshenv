# Set environment variables
# https://zsh.sourceforge.io/FAQ/zshfaq03.html#l19:
# When zsh starts up, there are four files you can change which it will run under various circumstances: .zshenv, .zprofile, .zshrc and .zlogin. They are usually in your home directory, but the variable $ZDOTDIR may be set to alter that. 
#
# Config / dot files
export XDG_CONFIG_HOME="$HOME/.config"

# For specific data
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

# For cached files
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Add our dotfiles folder to environment variable
export DOTFILES="$HOME/dotfiles"

# Set preferred editor
export EDITOR="nvim"
export VISUAL="nvim"

# Set the varialbe $ZDOTDIR. Determines where the zsh should look for config files
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"


