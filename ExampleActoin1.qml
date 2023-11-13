import QtQuick 2.15
import QtQuick.Controls.Material

Item {
    anchors.fill: parent
    Action {
        id: copyAction
        text: qsTr("&Copy")
//        icon.name: "edit-paste"
        icon.source: 'hand.png'
        shortcut: StandardKey.Copy
        onTriggered: window.activeFocusItem.copy()
    }

    ToolButton {
        id: toolButton
        anchors.centerIn: parent
        action: copyAction
    }
}
