#-----------------------------------------------------------#
#  Environment Variables                                    #
#-----------------------------------------------------------#

export LC_ALL="${LC_ALL:-ja_JP.UTF-8}"
export LANG="${LANG:-ja_JP.UTF-8}"

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZHOMEDIR=$XDG_CONFIG_HOME/zsh
export ZRCDIR=$ZHOMEDIR/rc
export ZDATADIR=$XDG_DATA_HOME/zsh
export ZCACHEDIR=$XDG_CACHE_HOME/zsh

typeset -U path PATH manpath sudo_path

export VOLTA_HOME="$HOME/.volta"

path=(
    $HOME/.pyenv/shims(N-/)
    $HOME/go/bin(N-/)
    $VOLTA_HOME/bin(N-/)
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    /opt/homebrew/bin(N-/)
    $path
)
export PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi

# zsh function search path
fpath=(
    $ZHOMEDIR/widgets(N-/)
    /usr/local/share/zsh/site-functions(N-/)
    /usr/share/zsh/site-functions(N-/)
    $fpath
)
export FPATH

# editor
export EDITOR=vim
export VISUAL=$EDITOR
