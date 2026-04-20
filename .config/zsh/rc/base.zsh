#----------------------------------------------------------#
##  Base Configuration                                    ##
#----------------------------------------------------------#

# ホスト名（プロンプト等で参照するため）
HOSTNAME="$HOST"

# 履歴ファイルの設定
HISTFILE="${ZDATADIR}/zsh_history"
HISTSIZE=10000   # メモリ上に保持する件数
SAVEHIST=100000  # ファイルに保存する件数
HISTORY_IGNORE="(ls|cd|pwd|exit)"  # 履歴に残さないコマンド

# 補完候補数の表示しきい値（0=常に表示、1=常に確認なし）
LISTMAX=0

# Ctrl+W の単語削除対象から = : @ を除外（URL や変数を単語として扱うため）
WORDCHARS=${WORDCHARS//[=:@\/]}

# 色変数を有効化（${fg[red]}, ${bg[blue]}, ${reset_color} などが使えるようになる）
autoload -Uz colors && colors

# ESC-h で組み込みコマンドのヘルプを表示（man の代替）
autoload -Uz run-help
alias help=run-help

# zmv: パターンによる一括リネーム（例: zmv '(*).txt' '$1.md'）
autoload -Uz zmv

# ターミナルタイトル設定
# precmd: コマンド待機中はカレントディレクトリを表示
precmd_set_title() {
  print -Pn "\e]2;%~\a"
}
# preexec: 実行中は実行コマンド名を表示
preexec_set_title() {
  print -Pn "\e]2;$1\a"
}
typeset -ag precmd_functions
if (( ! ${precmd_functions[(I)precmd_set_title]} )); then
  precmd_functions+=(precmd_set_title)
fi
typeset -ag preexec_functions
if (( ! ${preexec_functions[(I)preexec_set_title]} )); then
  preexec_functions+=(preexec_set_title)
fi

# git_current_branch: カレントブランチ名を返す（abbr の gpu 等で利用）
git_current_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}
