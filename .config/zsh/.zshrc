# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/takuya.omp.json)"

# alias
alias ls "ls --color=auto"

# abbr
# if type brew &>/dev/null; then
#   source /opt/homebrew/share/zsh-abbr@6/zsh-abbr.zsh
#   FPATH=$(brew --prefix)/share/zsh-abbr@6:$FPATH
#   autoload -Uz compinit
#   compinit
# fi


# ls
alias "ls"="ls --color=auto"
alias "ll"="ls -l"
alias "la"="ls -la"

alias "ls"="ls --color=auto"
alias "ll"="ls -l"
alias "la"="ls -la"

# grep
alias "grep"="grep --color=auto -n"
alias "gr"="grep -r"

# file operation
alias "cp"="cp -i"
alias "mv"="mv -i"
alias "rm"="rm -i"
alias "rmf"="rm -fr"

# etc
alias "hg"="history | grep"
alias "run-help"="man"
alias "which-command"="whence"

# node
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# python
export PATH="$HOME/.pyenv/shims:$PATH"

# go
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'; fi
