#----------------------------------------------------------#
#  .zshrc                                                  #
#----------------------------------------------------------#

# ZDATADIR が存在しない場合に作成（zcompdump や zsh_history の保存先）
mkdir -p "$ZDATADIR"

# Git 認証情報（対話シェルでのみ読み込む）
if [[ -f ~/.config/git/credentials.zsh ]]; then
  source ~/.config/git/credentials.zsh
fi

# zsh-autocomplete: compinit より前に読み込む必要がある
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# 補完システムの初期化（zcompdump を 1 日キャッシュして高速化）
autoload -Uz compinit
if [[ -n ${ZDATADIR}/.zcompdump(#qN.m-1) ]]; then
  compinit -C -d "$ZDATADIR/.zcompdump"   # キャッシュが 1 日以内なら再生成しない
else
  compinit -d "$ZDATADIR/.zcompdump"      # 期限切れなら再生成
fi

# 基本設定（HISTFILE / WORDCHARS / colors / ターミナルタイトル 等）
source "$ZRCDIR/base.zsh"

# zsh オプション（setopt 群）
source "$ZRCDIR/option.zsh"

# エイリアス（システム常時上書き分のみ: ls/grep/cp/mv/rm）
source "$ZRCDIR/alias.zsh"

# zsh-abbr: コマンドショートカットを abbr で管理
source $HOMEBREW_PREFIX/share/zsh-abbr@6/zsh-abbr.zsh

# キーバインド（履歴検索 / 単語移動 / ghq-fzf 等）
source "$ZRCDIR/keybind.zsh"

# Starship: クロスシェル対応プロンプト
eval "$(starship init zsh)"

# Direnv: ディレクトリ移動時に .envrc を自動読み込み
_direnv_hook() {
  trap -- '' SIGINT
  eval "$(direnv export zsh)"
  trap - SIGINT
}
typeset -ag precmd_functions
if (( ! ${precmd_functions[(I)_direnv_hook]} )); then
  precmd_functions=(_direnv_hook $precmd_functions)
fi
typeset -ag chpwd_functions
if (( ! ${chpwd_functions[(I)_direnv_hook]} )); then
  chpwd_functions=(_direnv_hook $chpwd_functions)
fi

# Pyenv: eval を避けて手動で shell 関数を定義（起動高速化）
source "$ZRCDIR/pyenv.zsh"

# zoxide: cd の拡張（z コマンドで頻繁訪問ディレクトリへジャンプ）
eval "$(zoxide init zsh)"

# Google Cloud SDK: PATH 設定と補完
if [ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
fi

# zsh-autosuggestions: 履歴・前コマンドに基づくグレーのサジェスト表示
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)

# zsh-syntax-highlighting: コマンドのリアルタイム色付け（必ず最後に読み込む）
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
