
#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/soltros/toggle-scripts.git"
INSTALL_DIR="$HOME/.local/bin"
SCRIPTS=(
    "tv-retroarch-toggle"
    "tv-xenia-toggle"
    "tv-rpcs3-toggle"
    "tv-display-toggle"
    "tv-bigpicture-toggle"
)

# Check dependencies
if ! command -v git &>/dev/null; then
    echo "Error: Git is required."
    exit 1
fi

# Create installation directory
mkdir -p "$INSTALL_DIR"

# Clone repository into temporary directory
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

echo "Downloading toggle scripts..."
git clone --depth 1 "$REPO" "$TEMP_DIR/toggle-scripts"

# Install each script
for script in "${SCRIPTS[@]}"; do
    SOURCE="$TEMP_DIR/toggle-scripts/$script"

    if [[ ! -f "$SOURCE" ]]; then
        echo "Error: Missing $script in repository."
        exit 1
    fi

    install -m 755 "$SOURCE" "$INSTALL_DIR/$script"
    echo "Installed: $script"
done

echo ""
echo "All toggle scripts installed successfully!"
echo "Location: $INSTALL_DIR"
