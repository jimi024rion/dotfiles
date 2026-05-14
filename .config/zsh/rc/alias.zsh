#----------------------------------------------------------#
##  Aliases                                               ##
##  コマンドショートカットは abbr で管理する。            ##
##  alias はコマンドを常時・無条件に上書きする場合のみ。  ##
#----------------------------------------------------------#

# カラー表示を常時有効化（端末の色設定に関わらず常に上書き）
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# 破壊的操作に確認プロンプトを追加（誤操作防止）
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias ll='eza --group-directories-first --icons --git -l -I .git'
alias la='eza --group-directories-first --icons -la --git -I .git'
alias tree='eza --group-directories-first --icons -Ta --git -I .git'

# alias / abbr の検索・一覧表示ユーティリティ
# 引数なし: 全エイリアスを表示、引数あり: grep でフィルタ
als() {
  if [[ -z "$1" ]]; then
    alias | sort
  else
    alias | grep -i "$1"
  fi
}
