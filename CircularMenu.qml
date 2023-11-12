import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // properties
    property double outerRadius: 400
    property double innerRadius: 300
    property ListModel listModel: ListModel{}

    anchors.fill: parent

    Canvas {
        id: cMenuCanvas

        width: outerRadius * 2
        height: outerRadius * 2
        anchors.centerIn: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centreX = width / 2;
            var centreY = height / 2;
            var startCycle = Math.PI;

            for (var i = 0; i < listModel.count; i++) {
                var startAngle = startCycle + Math.PI * 0.2 * i;
                var endAngle = startAngle + 0.5;

                // outer circle
                ctx.beginPath();
                ctx.fillStyle = "red";
                ctx.moveTo(centreX, centreY);
                ctx.arc(centreX, centreY, outerRadius, startAngle, endAngle, false);
                ctx.lineTo(centreX, centreY);
                ctx.fill();

                // inner circle
                ctx.beginPath();
                ctx.fillStyle = "white";
                ctx.moveTo(centreX, centreY);
                ctx.arc(centreX, centreY, innerRadius, startAngle, endAngle, false);
                ctx.lineTo(centreX, centreY);
                ctx.fill();
            }
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
                cMenuCanvas.requestPaint()
            }
        }

        Button {
            id: remove
            text: 'remove item'
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: {
                console.log('items:')
                console.log(listModel.count)

                if (listModel.count > 0)
                    listModel.remove(0)
                cMenuCanvas.requestPaint()
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


