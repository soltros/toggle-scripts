# toggle-scripts

KDE Plasma display toggles for TV gaming and desktop monitors.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/soltros/toggle-scripts/main/install.sh | bash
```

Installs `tv-bigpicture-toggle`, `tv-retroarch-toggle`, `tv-display-toggle`, and `tv-xenia-toggle` into `~/.local/bin`.

## Xenia Canary

The Xenia TV toggle launches the same AppImage configured in `xenia_canary.desktop`:

```bash
env DESKTOPINTEGRATION=1 appimage-run ~/AppImages/xenia_canary.appimage
```

Bind `~/.local/bin/tv-xenia-toggle` to your preferred shortcut in System Settings → Keyboard → Shortcuts. Press once to switch to TV and launch Xenia, again to close Xenia and return to the desktop. Save your game first, since the script force-stops Xenia if it does not close within 4 seconds.

For **automatic maximization**, import [xenia-maximized.kwinrule](xenia-maximized.kwinrule) in System Settings → Window Management → Window Rules → Import. Verify the matched window class is `xenia_canary` (it may differ depending on how the AppImage runs). This maximizes the window; it does not enable exclusive fullscreen.
