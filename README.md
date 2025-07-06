

This was copied from `/usr/share/plasma/plasmoids/`


# How to install
1. Copy the whole directory to `~/.local/share/plasma/plasmoids/`, 
    so that the metadata file ends up at `~/.local/share/plasma/plasmoids/org.kde.plasma.pager/metadata.json`.

2. Either `killall plasmashell && kstart5 plasmashell`, or just log out and back in again
    if you had a pager on your desktop somewhere, it will have been replaced with the new one.

# How to uninstall
Delete `~/.local/share/plasma/plasmoids/org.kde.plasma.pager`

# How to debug
After installing to the share folder, just `plasmawindowed NAME_OF_PLASMOID`


# Tips
To test the commands, try:
- `kdialog --msgbox "This is a test message box!"`

Or for scrolling commands, better something like:
- `pactl set-sink-volume @DEFAULT_SINK@ -1%` since it shows an OSD/popup
