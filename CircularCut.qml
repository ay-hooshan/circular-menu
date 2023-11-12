import QtQuick 2.15
import QtQuick.Shapes

Item {
    // properties
    property string cutText: 'cutText'
    property double cutOuterRadius: 400
    property double cutInnerRadius: 300
    property color cutColor: "red"
    required property double cutStartAngle
    required property double cutLen

    function toDegree (radianAngle) {
        return radianAngle * Math.PI / 180;
    }

    anchors.fill: parent

    Shape {
        id: cMenuShape

        anchors.centerIn: parent
        containsMode: Shape.FillContains

        // ------------------------ outer circle
        ShapePath {
    //        strokeWidth: 4
    //        strokeColor: 'blue'

            fillColor: cutColor

            PathAngleArc {
                centerX: 0
                centerY: 0
                radiusX: outerRadius
                radiusY: outerRadius
                startAngle: cutStartAngle
                sweepAngle: cutLen
            }
            PathLine {
                x: 0
                y: 0
            }
        }

        // ------------------------ inner circle
        ShapePath {
    //        strokeWidth: 4
    //        strokeColor: 'blue'

            fillColor: "white"

            PathAngleArc {
                centerX: 0
                centerY: 0
                radiusX: innerRadius
                radiusY: innerRadius
                startAngle: cutStartAngle
                sweepAngle: cutLen
            }
            PathLine {
                x: 0
                y: 0
            }
        }

        // ------------------------ text
        Text {
            text: cutText
//            font.family: 'Roboto'
            font.pixelSize: 30
            z: 2

            anchors {
                centerIn: parent
                horizontalCenterOffset: (innerRadius + outerRadius) / 2 * Math.cos(toDegree(cutStartAngle + cutLen / 2))
                verticalCenterOffset: (innerRadius + outerRadius) / 2 * Math.sin(toDegree(cutStartAngle + cutLen / 2))
            }

            rotation: 90 + (2 * cutStartAngle + cutLen) / 2
        }
    }
}


