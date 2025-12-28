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

# abbr
source /opt/homebrew/share/zsh-abbr@6/zsh-abbr.zsh

# Key Bindings
source "$ZRCDIR/keybind.zsh"

# Starship
eval "$(starship init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# Pyenv
source "$ZRCDIR/pyenv.zsh"
