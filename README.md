# toggle-scripts

KDE Plasma display toggles for TV gaming and desktop monitors.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/soltros/toggle-scripts/main/install.sh | bash
```

Installs `tv-bigpicture-toggle`, `tv-retroarch-toggle`, `tv-display-toggle`, `tv-xenia-toggle`, and `tv-rpcs3-toggle` into `~/.local/bin`.

## Xenia Canary

The Xenia TV toggle launches the same AppImage configured in `xenia_canary.desktop`:

```bash
env DESKTOPINTEGRATION=1 appimage-run ~/AppImages/xenia_canary.appimage
```

Bind `~/.local/bin/tv-xenia-toggle` to your preferred shortcut in System Settings → Keyboard → Shortcuts. Press once to switch to TV and launch Xenia, again to close Xenia and return to the desktop. Save your game first, since the script force-stops Xenia if it does not close within 4 seconds.

For **automatic maximization**, import [xenia-maximized.kwinrule](xenia-maximized.kwinrule) in System Settings → Window Management → Window Rules → Import. Verify the matched window class is `xenia_canary` (it may differ depending on how the AppImage runs). This maximizes the window; it does not enable exclusive fullscreen.

## RPCS3

The RPCS3 toggle uses `rpcs3` from your PATH by default, and can be overridden with `RPCS3_COMMAND=/path/to/rpcs3` if installed elsewhere. Bind `~/.local/bin/tv-rpcs3-toggle` to your preferred shortcut. First press launches RPCS3 on the TV, second terminates RPCS3 and restores the desktop. Save gameplay before switching off; the script may force-kill a process that does not exit.

For automatic maximization import [rpcs3-maximized.kwinrule](rpcs3-maximized.kwinrule) in KDE Plasma Window Rules, and adjust the detected window class if necessary.
