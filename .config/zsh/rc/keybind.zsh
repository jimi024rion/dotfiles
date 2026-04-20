#----------------------------------------------------------#
##  Key Bindings                                          ##
#----------------------------------------------------------#

# emacs キーバインドを使用（デフォルトだが明示）
bindkey -e

# Ctrl+R / Ctrl+S: 履歴のインクリメンタル検索
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

# ↑ / ↓: 行頭の入力内容に一致する履歴を検索（prefix マッチ）
# 例: "git" と入力して ↑ を押すと git で始まる直近の履歴に移動
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search    # ↑ (通常端末)
bindkey '^[[B' down-line-or-beginning-search  # ↓
bindkey '^[OA' up-line-or-beginning-search    # ↑ (一部端末)
bindkey '^[OB' down-line-or-beginning-search  # ↓

# Ctrl+← / Ctrl+→: 単語単位で移動
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ghq + fzf: リポジトリ選択して cd（Ctrl+G）
autoload -Uz ghq-fzf
zle -N ghq-fzf
bindkey '^g' ghq-fzf
