import QtQuick 2.15
import QtQuick.Controls.Material

Button {
    id: fileButton
    text: "File"
    onClicked: menu.open()

    Menu {
        id: menu

        MenuItem {
            text: "New..."
            onTriggered: document.reset()
        }
        MenuItem {
            text: "Open..."
            onTriggered: openDialog.open()
        }
        MenuItem {
            text: "Save"
            onTriggered: saveDialog.open()
        }
    }
}
