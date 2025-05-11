#----------------------------------------------------------#
#                  Environment Variables                   #
#----------------------------------------------------------#

export LC_ALL="${LC_ALL:-ja_JP.UTF-8}"
export LANG="${LANG:-ja_JP.UTF-8}"

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZHOMEDIR=$XDG_CONFIG_HOME/zsh
export ZRCDIR=$ZHOMEDIR/rc
# export ZDATADIR=$XDG_DATA_HOME/zsh
# export ZCACHEDIR=$XDG_CACHE_HOME/zsh

# zsh options
setopt no_global_rcs
setopt autocd

typeset -U path PATH manpath sudo_path

export GOPATH=$(go env GOPATH)
export VOLTA_HOME="$HOME/.volta"

path=(
    $HOME/.pyenv/shims(N-/)
    $GOPATH/bin(N-/)
    $VOLTA_HOME/bin(N-/)
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    /opt/homebrew/bin(N-/)
    $path
)
export PATH

# zsh function search path
fpath=(
    # $HOME/.zfunc(N-/)
    # $ZHOMEDIR/zfunc(N-/)
    # $ZHOMEDIR/completions.local(N-/)
    # $ZHOMEDIR/completions(N-/)
    /usr/local/share/zsh/site-functions(N-/)
    /usr/share/zsh/site-functions(N-/)
    $fpath
)
export FPATH

# editor
export EDITOR=vim
export VISUAL=$EDITOR
