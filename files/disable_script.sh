# Disable this script
script_name=$(basename "$0")
mkdir -p "$HOME/.config/autostart/"
cp "/etc/xdg/autostart/$script_name_wrapper.sh.desktop" "$HOME/.config/autostart/$script_name_wrapper.sh.desktop"
sed -i 's/X-GNOME-Autostart-enabled=true/X-GNOME-Autostart-enabled=false/g' "$HOME/.config/autostart/$script_name_wrapper.sh.desktop"
chmod +x "$HOME/.config/autostart/$script_name_wrapper.sh.desktop"
