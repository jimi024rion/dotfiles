#----------------------------------------------------------#
#  .zshrc                                                  #
#----------------------------------------------------------#

# 補完システムのロードと初期化(Oh My Zshで行うためコメントアウト)
# autoload -Uz compinit
# compinit

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
