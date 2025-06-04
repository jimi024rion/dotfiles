#----------------------------------------------------------#
#  .zshrc                                                  #
#----------------------------------------------------------#

# Base Configuration
source "$ZRCDIR/base.zsh"

# Option
source "$ZRCDIR/option.zsh"

# Alias
source "$ZRCDIR/alias.zsh"

# Oh My Zsh
source "$ZRCDIR/ohmy.zsh"

# Key Bindings
source "$ZRCDIR/keybind.zsh"

# Starship
eval "$(starship init zsh)"
