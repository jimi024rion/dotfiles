#----------------------------------------------------------#
##  Key Bindings                                          ##
#----------------------------------------------------------#

# ghq + fzf: リポジトリ選択して cd（Ctrl+G）
autoload -Uz ghq-fzf
zle -N ghq-fzf
bindkey '^g' ghq-fzf

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

# ↑: カーソル左に改行があれば上の行へ移動、なければ履歴へ
_zle-up-line-or-history() {
    if [[ $LBUFFER == *$'\n'* ]]; then
        zle up-line
    else
        zle up-line-or-history
    fi
}
zle -N _zle-up-line-or-history
bindkey '^[[A' _zle-up-line-or-history  # 通常モード (CSI A)
bindkey '^[OA' _zle-up-line-or-history  # アプリケーションカーソルモード (SS3 A)

# ↓: カーソル右に改行があれば下の行へ移動、なければ履歴へ
_zle-down-line-or-history() {
    if [[ $RBUFFER == *$'\n'* ]]; then
        zle down-line
    else
        zle down-line-or-history
    fi
}
zle -N _zle-down-line-or-history
bindkey '^[[B' _zle-down-line-or-history  # 通常モード (CSI B)
bindkey '^[OB' _zle-down-line-or-history  # アプリケーションカーソルモード (SS3 B)
