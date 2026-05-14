#----------------------------------------------------------#
##  Key Bindings                                          ##
#----------------------------------------------------------#

# ghq + fzf: リポジトリ選択して cd（Ctrl+G）
autoload -Uz ghq-fzf
zle -N ghq-fzf
bindkey '^g' ghq-fzf

# fzf: Ctrl+R で履歴検索、Ctrl+T でファイル選択
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# ── マルチライン編集（fish 風 \ 継続）────────────────────────────────────────
#
# デフォルトの accept-line は \ 行末を recursive ZLE session で処理するため
# 継続行で ↑↓ や Backspace がバッファを認識できない。
# accept-line を上書きして同一セッション内に \n を挿入することで解決する。

# Enter: 行末が \ なら同一 ZLE セッション内で改行を挿入して継続
_zle-accept-line() {
    local current_line="${LBUFFER##*$'\n'}"
    if [[ -z $RBUFFER && $current_line =~ '\\$' ]]; then
        LBUFFER+=$'\n'
    else
        zle .accept-line
    fi
}
zle -N accept-line _zle-accept-line

# Backspace: LBUFFER の末尾が \+改行 なら両方まとめて削除して前の行へ戻る
# ※ glob パターンで \ を安全に扱うため [\\] (文字クラス) を使用する
_zle-backward-delete-char-or-join() {
    if [[ ${#LBUFFER} -ge 2 && "${LBUFFER: -2}" == [\\]$'\n' ]]; then
        LBUFFER="${LBUFFER[1,-3]}"
    else
        zle backward-delete-char
    fi
}
zle -N _zle-backward-delete-char-or-join
bindkey '^?' _zle-backward-delete-char-or-join

# zsh-autocomplete 等が ^[[A/B にバインドしたウィジェットを上書き前に保存する
# (.zshrc で zsh-autocomplete → keybind.zsh の順に読み込まれるため取得できる)
_saved_up_widget="${$(bindkey '^[[A' 2>/dev/null)##* }"
_saved_up_widget="${_saved_up_widget:-up-line-or-history}"
_saved_down_widget="${$(bindkey '^[[B' 2>/dev/null)##* }"
_saved_down_widget="${_saved_down_widget:-down-line-or-history}"

# ↑: マルチライン中は上の行へ移動、それ以外は元のウィジェット（補完 or 履歴）に委譲
_zle-up-line-or-history() {
    if [[ $LBUFFER == *$'\n'* ]]; then
        zle up-line
    else
        zle -- "$_saved_up_widget"
    fi
}
zle -N _zle-up-line-or-history
bindkey '^[[A' _zle-up-line-or-history  # 通常モード (CSI A)
bindkey '^[OA' _zle-up-line-or-history  # アプリケーションカーソルモード (SS3 A)

# ↓: マルチライン中は下の行へ移動、それ以外は元のウィジェット（補完 or 履歴）に委譲
_zle-down-line-or-history() {
    if [[ $RBUFFER == *$'\n'* ]]; then
        zle down-line
    else
        zle -- "$_saved_down_widget"
    fi
}
zle -N _zle-down-line-or-history
bindkey '^[[B' _zle-down-line-or-history  # 通常モード (CSI B)
bindkey '^[OB' _zle-down-line-or-history  # アプリケーションカーソルモード (SS3 B)
