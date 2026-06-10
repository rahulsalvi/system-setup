#!/bin/bash
set -euo pipefail

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please use 'sudo bash install.sh' or 'curl ... | sudo bash'."
    exit 1
fi

# Detect Operating System
if [ -f /etc/os-release ]; then
    # shellcheck source=/dev/null
    source /etc/os-release
else
    echo "Unsupported OS: /etc/os-release not found."
    exit 1
fi

case "$ID" in
ubuntu)
    echo "Detected Ubuntu. Installing dependencies..."
    apt-get update
    apt-get install -y python3 ansible git
    ;;
arch)
    echo "Detected Arch Linux. Installing dependencies..."
    pacman -Syu --noconfirm python ansible git
    ;;
*)
    echo "Unsupported OS: $ID. This script only supports Ubuntu and Arch Linux."
    exit 1
    ;;
esac

# Install system-setup script
echo "Installing system-setup utility..."
RAW_URL="https://raw.githubusercontent.com/rahulsalvi/system-setup/main/roles/ansible/files/system-setup"

if [ -f /usr/local/bin/system-setup ]; then
    echo "/usr/local/bin/system-setup already exists. Exiting"
    exit 0
fi

curl -fsSL "$RAW_URL" -o /usr/local/bin/system-setup || {
    echo "Download failed."
    exit 1
}

chmod +x /usr/local/bin/system-setup

echo ""
echo "-------------------------------------------------------------------"
echo "Installation complete!"
echo "The 'system-setup' utility is now installed in /usr/local/bin."
echo ""
echo "You can now bootstrap your machine using a role (e.g., desktop, laptop):"
echo "  system-setup bootstrap <role>"
echo ""
echo "Example:"
echo "  system-setup bootstrap desktop"
echo "-------------------------------------------------------------------"
