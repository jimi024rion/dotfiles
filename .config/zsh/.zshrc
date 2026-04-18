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

# zoxide
eval "$(zoxide init zsh)"

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
