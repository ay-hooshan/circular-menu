import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // properties
    property double outerRadius: 400
    property double innerRadius: 300
    property ListModel listModel

    anchors.fill: parent

    Canvas {
        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centreX = width / 2;
            var centreY = height / 2;

            // outer circle
            ctx.beginPath();
            ctx.fillStyle = "red";
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, outerRadius, -Math.PI * 0.8, -Math.PI * 0.2, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();

            // inner circle
            ctx.beginPath();
            ctx.fillStyle = "white";
            ctx.moveTo(centreX, centreY);
            ctx.arc(centreX, centreY, innerRadius, -Math.PI * 0.8, -Math.PI * 0.2, false);
            ctx.lineTo(centreX, centreY);
            ctx.fill();
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
                listModel.append({name: 'Abbas', iconSource: 'hand.png'})
            }
        }

        Button {
            id: remove
            text: 'remove item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                console.log(listModel)
            }
        }
    }



    Rectangle {
        id: fakeOuterCircle

        width: outerRadius * 2
        height: outerRadius * 2
        radius: outerRadius
        opacity: 0.5

        color: 'pink'
        anchors.centerIn: parent

        Rectangle {
            id: fakeInnerCircle

            width: innerRadius * 2
            height: innerRadius * 2
            radius: innerRadius
            opacity: 0.5

            color: 'gold'
            anchors.centerIn: parent
        }
    }
}


