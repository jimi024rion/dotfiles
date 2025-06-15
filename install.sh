#!/usr/bin/env bash

# スクリプトのあるディレクトリ（dotfilesルート）を取得
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

link_file() {
    local src="$1"
    local dest="$2"

    mkdir -p "$(dirname "$dest")"

    if [[ -e "$dest" || -L "$dest" ]]; then
        echo "⚠️  既に存在: $dest（スキップ）"
    else
        ln -s "$src" "$dest"
        echo "✅ リンク作成: $dest → $src"
    fi
}

echo "🔧 dotfiles インストール"
echo "------------------------------------------------"

#-----------------------------------------------------------#
# root
#-----------------------------------------------------------#

link_file "$DOTFILES_DIR/.zshenv" "$HOME_DIR/.zshenv"

#-----------------------------------------------------------#
# .config配下
#-----------------------------------------------------------#

# ディレクトリ単位でリンクするもの（完全管理対象）
CONFIG_DIR_LINKS=(
    "zsh"
    # "wezterm"
)

# ファイル単位でリンクするもの（部分管理や共存が必要）
CONFIG_FILE_LINKS=(
    "starship.toml"
    "gh/config.yml"
    "git/config"
    "git/ignore"
    "Code/User/settings.json"
    "zsh-abbr/user-abbreviations"
)

# ディレクトリ単位リンク処理
for dir in "${CONFIG_DIR_LINKS[@]}"; do
    link_file "$DOTFILES_DIR/.config/$dir" "$HOME_DIR/.config/$dir"
done

# ファイル単位リンク処理
for file in "${CONFIG_FILE_LINKS[@]}"; do
    link_file "$DOTFILES_DIR/.config/$file" "$HOME_DIR/.config/$file"
done

echo "------------------------------------------------"
echo "✅ インストール完了：必要なリンクを作成しました"
