    /*
 *  SPDX-FileCopyrightText: 2013 David Edmundson <davidedmundson@kde.org>
 *  SPDX-FileCopyrightText: 2016 Eike Hein <hein@kde.org>
 *
 *  SPDX-License-Identifier: GPL-2.0-or-later
 */

import QtQuick 2.5
import QtQuick.Controls 2.5 as QQC2

import org.kde.kirigami 2.5 as Kirigami
import org.kde.plasma.plasmoid 2.0
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    readonly property bool isActivityPager: Plasmoid.pluginName === "org.kde.plasma.activitypager"

    property int cfg_displayedText
    property alias cfg_showWindowOutlines: showWindowOutlines.checked
    property alias cfg_showWindowIcons: showWindowIcons.checked
    property int cfg_currentDesktopSelected
    property alias cfg_pagerLayout: pagerLayout.currentIndex
    property alias cfg_showOnlyCurrentScreen: showOnlyCurrentScreen.checked
    property alias cfg_showOnlyCurrentDesktop: showOnlyCurrentDesktop.checked
    property alias cfg_wrapPage: wrapPage.checked
    property alias cfg_reverseScroll: reverseScroll.checked
    property alias cfg_command: command.text

    Kirigami.FormLayout {
        QQC2.ButtonGroup {
            id: displayedTextGroup
        }

        QQC2.ButtonGroup {
            id: currentDesktopSelectedGroup
        }

        QQC2.CheckBox {
            id: showWindowOutlines

            Kirigami.FormData.label: i18n("General:")

            text: i18n("Show window outlines")
        }

        QQC2.CheckBox {
            id: showWindowIcons
            text: i18n("Show application icons on window outlines")
            enabled: showWindowOutlines.checked
        }

        QQC2.CheckBox {
            id: showOnlyCurrentScreen
            text: i18n("Show only current screen")
        }

        QQC2.CheckBox {
            id: showOnlyCurrentDesktop
            text: i18n("Show only current desktop")
        }

        QQC2.CheckBox {
            id: wrapPage
            text: i18n("Navigation wraps around")
        }

        QQC2.CheckBox {
            id: reverseScroll
            text: i18n("Reverse scroll direction")
        }


        Item {
            Kirigami.FormData.isSection: true
        }


        QQC2.ComboBox {
            id: pagerLayout

            Kirigami.FormData.label: i18n("Layout:")

            model: [i18nc("The pager layout", "Default"), i18n("Horizontal"), i18n("Vertical")]
            visible: isActivityPager
        }


        Item {
            Kirigami.FormData.isSection: true
            visible: isActivityPager
        }


        QQC2.RadioButton {
            id: noTextRadio

            Kirigami.FormData.label: i18n("Text display:")

            QQC2.ButtonGroup.group: displayedTextGroup
            text: i18n("No text")
            checked: cfg_displayedText === 2
            onToggled: if (checked) cfg_displayedText = 2;
        }

        QQC2.RadioButton {
            id: desktopNumberRadio
            QQC2.ButtonGroup.group: displayedTextGroup
            text: isActivityPager ? i18n("Activity number") : i18n("Desktop number")
            checked: cfg_displayedText === 0
            onToggled: if (checked) cfg_displayedText = 0;
        }

        QQC2.RadioButton {
            id: desktopNameRadio
            QQC2.ButtonGroup.group: displayedTextGroup
            text: isActivityPager ? i18n("Activity name") : i18n("Desktop name")
            checked: cfg_displayedText === 1
            onToggled: if (checked) cfg_displayedText = 1;
        }


        Item {
            Kirigami.FormData.isSection: true
        }


        QQC2.RadioButton {
            id: doesNothingRadio

            Kirigami.FormData.label: isActivityPager ? i18n("Selecting current Activity:") : i18n("Selecting current virtual desktop:")

            QQC2.ButtonGroup.group: currentDesktopSelectedGroup
            text: i18n("Does nothing")
            checked: cfg_currentDesktopSelected === 0
            onToggled: if (checked) cfg_currentDesktopSelected = 0;
        }

        QQC2.RadioButton {
            id: showsDesktopRadio
            QQC2.ButtonGroup.group: currentDesktopSelectedGroup
            text: i18n("Shows the desktop")
            checked: cfg_currentDesktopSelected === 1
            onToggled: if (checked) cfg_currentDesktopSelected = 1;
        }

        QQC2.RadioButton {
            id: overviewRadio
            QQC2.ButtonGroup.group: currentDesktopSelectedGroup
            text: i18n("Toggle overview")
            checked: cfg_currentDesktopSelected === 3
            onToggled: if (checked) cfg_currentDesktopSelected = 3;
        }

        QQC2.RadioButton {
            id: commandRadio
            QQC2.ButtonGroup.group: currentDesktopSelectedGroup
            text: i18n("Execute command")
            checked: cfg_currentDesktopSelected === 2
            onToggled: if (checked) cfg_currentDesktopSelected = 2;
        }

        Kirigami.FormLayout {
            visible: commandRadio.checked
            Kirigami.FormData.isSection: true

            QQC2.TextField {
                id: command
                Kirigami.FormData.label: i18n("Command:")
                text: cfg_command
                onAccepted: cfg_command = text
            }
        }
    }
}
