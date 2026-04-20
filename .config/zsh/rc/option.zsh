#----------------------------------------------------------#
##  Options                                               ##
#----------------------------------------------------------#
# 参考: https://zsh.sourceforge.io/Doc/Release/Options.html

# グローバル設定ファイル（/etc/zshrc 等）を読み込まない
setopt no_global_rcs

# コマンドライン上でのコメント入力を許可（# 以降を無視）
setopt interactive_comments

#--- 補完 ---
setopt always_to_end    # 補完後にカーソルを末尾へ移動する
setopt complete_in_word # 単語の途中の位置からでも補完を開始する
setopt path_dirs        # PATH 内のサブディレクトリもコマンドとして補完する

#--- Glob / 展開 ---
setopt extended_glob    # ^ や ** などの拡張グロブパターンを有効化（例: ls ^*.log）
setopt brace_ccl        # {a,b} 内で [0-9] などの文字クラスも展開する（例: echo {file[1-3],dir[1-2]}）
setopt globdots         # ドットファイルも glob でマッチさせる（例: ls * で .zshrc も表示）

#--- ディレクトリ移動 ---
setopt auto_cd              # コマンド名がディレクトリなら cd を省略できる（例: .. → cd ..）
setopt auto_pushd           # cd 時に pushd も実行してディレクトリスタックを維持する
setopt pushd_ignore_dups    # pushd スタックに重複を積まない

#--- ジョブ制御 ---
setopt notify           # バックグラウンドジョブ完了を即時通知する（次のプロンプト表示を待たない）
setopt no_bg_nice       # バックグラウンドジョブの優先度を下げない（デフォルトは nice +5）
setopt long_list_jobs   # jobs コマンドをデフォルトで verbose 表示にする

#--- 履歴 ---
setopt extended_history         # 履歴にタイムスタンプと実行時間を記録する
setopt share_history            # 全端末間でリアルタイムに履歴を共有する（inc_append_history を包含）
setopt hist_ignore_all_dups     # 重複したコマンドは古いほうを削除する
setopt hist_expire_dups_first   # 重複を削除するとき最も古いものを優先して削除する
setopt hist_ignore_space        # スペースで始まるコマンドは履歴に残さない（パスワード等の誤記録防止）
setopt hist_reduce_blanks       # 保存時に余分なスペースを除去する
setopt hist_save_no_dups        # 保存時に重複を除去する
