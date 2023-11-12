import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // properties
    property double outerRadius: 400
    property double innerRadius: 300
    property double startAngle: 180

    property ListModel listModel: ListModel{}

    anchors.fill: parent


    Repeater {
        anchors.fill: parent
        model: listModel.count

        CircularCut {
            required property var model

            cutText: listModel.get(model.index).name
            cutOuterRadius: outerRadius
            cutInnerRadius: innerRadius
            cutStartAngle: startAngle + model.index * 45
            cutLen: 45
            cutColor: listModel.get(model.index).color
        }
    }

    RowLayout {
        id: textFieldsRow

        height: 50
        anchors.bottom: buttonsRow.top
        anchors.left: parent.left
        anchors.right: parent.right

        TextField {
            id: nameField
            text: 'add item'
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    RowLayout {
        id: buttonsRow
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 50

        Button {
            id: addButton
            text: 'add item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                listModel.append({name: nameField.text, color: 'purple'})
            }
        }

        Button {
            id: remove
            text: 'remove item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                console.log(listModel.count)

                if (listModel.count > 0)
                    listModel.remove(0)
            }
        }
    }



    Rectangle {
        id: fakeOuterCircle

        visible: false

        width: outerRadius * 2
        height: outerRadius * 2
        radius: outerRadius
        opacity: 0.4

        color: 'pink'
        anchors.centerIn: parent

        Rectangle {
            id: fakeInnerCircle

            width: innerRadius * 2
            height: innerRadius * 2
            radius: innerRadius
            opacity: 0.4

            color: 'gold'
            anchors.centerIn: parent
        }
    }
}
