# KDE Pager Plasmoid (Customized)

This is a customized version of the KDE Pager plasmoid, originally copied from `/usr/share/plasma/plasmoids/` and adapted to fit my needs.

---

## ✨ Added Features

New options have been added, highlighted in red below:

![New options screenshot](images/Screenshot_20250706_093930.png)

---

## 🚀 Installation

1. Copy the entire directory to your local plasmoids folder:
    ```sh
    cp -r org.kde.plasma.pager ~/.local/share/plasma/plasmoids/
    ```
    Ensure that [metadata.json](http://_vscodecontentref_/0) ends up at:
    ```
    ~/.local/share/plasma/plasmoids/org.kde.plasma.pager/metadata.json
    ```

2. Restart Plasma to apply changes:
    - Either run:
      ```sh
      killall plasmashell && kstart5 plasmashell
      ```
    - Or simply log out and log back in.

    > **Note:** If you already had a Pager widget, it will be replaced with this customized version.

---

## ❌ Uninstallation

To remove the plasmoid, simply delete its directory:
```sh
rm -rf ~/.local/share/plasma/plasmoids/org.kde.plasma.pager
```

---

## 🐞 Debugging

After installing, you can test the plasmoid using:
```sh
plasmawindowed org.kde.plasma.pager
```

---

## 💡 Tips

For testing commands, you can use:
- `kdialog --msgbox "This is a test message box!"`

For scrolling commands, it's better to use something like:
- `pactl set-sink-volume @DEFAULT_SINK@ -1%` since it shows an OSD/popup
