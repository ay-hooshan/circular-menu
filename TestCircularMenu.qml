import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    anchors.fill: parent

    CircularMenu {
        id: circularMenu

        outerRadius: 250
        innerRadius: 150

        listModel: ListModel {
            ListElement {
                name: 'Abbas'
                color: 'gold'
                iconSource: 'hand.png'
            }
            ListElement {
                name: 'Akbar'
                color: 'tomato'
                iconSource: 'hand.png'
            }
        }
    }

    // ----------------------------------------- tests
    RowLayout {
        id: textFieldsRow

        height: 50
        anchors.bottom: buttonsRow.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10

        TextField {
            id: nameField
            text: 'add'
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        TextField {
            id: colorField
            text: 'orange'
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: buttonsRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        height: 50

        Button {
            id: addButton
            text: 'add item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                circularMenu.listModel.append({name: nameField.text, color: colorField.text, icon: 'hand.png'})
            }
        }

        Button {
            id: remove
            text: 'remove item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                console.log(circularMenu.listModel.count)

                if (circularMenu.listModel.count > 0)
                    circularMenu.listModel.remove(0)
            }
        }
    }
}
