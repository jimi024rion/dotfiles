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
export ZRCDIR=$ZDOTDIR/rc
export ZDATADIR=$XDG_DATA_HOME/zsh
export ZCACHEDIR=$XDG_CACHE_HOME/zsh

# aqua
export AQUA_ROOT_DIR="$XDG_DATA_HOME/aquaproj-aqua"
export AQUA_GLOBAL_CONFIG="${AQUA_GLOBAL_CONFIG:-$XDG_CONFIG_HOME/aquaproj-aqua/aqua.yaml}"
export AQUA_PROGRESS_BAR=true   # Show progress bar
export AQUA_REMOVE_MODE=pl      # Remove links and packages
export AQUA_LOG_COLOR=always    # Always use color in logs

# abbr
export ABBR_SET_EXPANSION_CURSOR=1

# Homebrew
if [[ -d /opt/homebrew ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -x /usr/local/bin/brew ]]; then
    export HOMEBREW_PREFIX="/usr/local"
else
    export HOMEBREW_PREFIX=$(brew --prefix)
fi

typeset -U path PATH manpath sudo_path
typeset -xTU FPATH fpath

path=(
    $AQUA_ROOT_DIR/bin(N-/)
    $HOME/bin(N-/)
    $HOME/.local/bin(N-/)
    $HOME/.pyenv/shims(N-/)
    $HOME/go/bin(N-/)
    $HOME/.volta/bin(N-/)
    /opt/homebrew/bin(N-/)
    $path
)

fpath=(
    $ZDOTDIR/widgets(N-/)
    $ZDOTDIR/completions(N-/)
    /usr/share/zsh/site-functions(N-/)
    $HOMEBREW_PREFIX/share/zsh/site-functions(N-/)
    $HOMEBREW_PREFIX/share/zsh-abbr@6(N-/)
    $HOMEBREW_PREFIX/share/zsh-completions(N-/)
    $fpath
)

# editor
export EDITOR=vim
export VISUAL=$EDITOR
