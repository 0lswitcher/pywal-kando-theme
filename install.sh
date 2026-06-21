#!/usr/bin/env bash
# install.sh - installs pywal-to-kando.sh from bash-scripts repo

CONFIG_DIR=""

check_for_flatpak() {
  FLATPAK_APPID="menu.kando.Kando"
  flatpak info "$FLATPAK_APPID" >/dev/null 2>&1
}

echo "Checking Kando configuration directory..."
if check_for_flatpak; then
  CONFIG_DIR="$HOME/.var/app/menu.kando.Kando/config/kando"
else
  CONFIG_DIR="$HOME/.config/kando"
fi
echo "Kando's config directory determined as $CONFIG_DIR"
echo ""

echo "Cloning repo for nether-labels theme..."
git clone https://github.com/0lswitcher/pywal-kando-theme.git
echo ""

echo "Moving nether-labels/ directory to $CONFIG_DIR/menu-themes/nether-labels"
mv ./pywal-kando-theme/nether-labels "$CONFIG_DIR/menu-themes/"
echo ""

echo "Deleting leftover repository files/directory"
rm -R ./pywal-kando-theme
echo ""

echo "Installing pywal-to-glance.sh..."
curl -sLO https://raw.githubusercontent.com/0lswitcher/bash-scripts/refs/heads/main/scripts/pywal-to-kando.sh
echo ""

echo "Updating execution permissions..."
chmod +x ./pywal-to-kando.sh
echo ""

echo "Moving script to ~/.local/bin..."
echo "Feel free to relocate!"
mkdir -p ~/.local/bin && mv ./pywal-to-kando.sh ~/.local/bin/
echo ""

echo "Installation complete!"
