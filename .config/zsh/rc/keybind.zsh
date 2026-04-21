#----------------------------------------------------------#
##  Key Bindings                                          ##
#----------------------------------------------------------#

# ghq + fzf: リポジトリ選択して cd（Ctrl+G）
autoload -Uz ghq-fzf
zle -N ghq-fzf
bindkey '^g' ghq-fzf
