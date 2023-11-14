import QtQuick 2.15
import QtQuick.Shapes
import QtQuick.Controls
import QtQuick.Layouts

Item {
    // properties
    property string cutText: 'cutText'
    property color cutBackgroundColor: 'transparent'
    property color cutIconColor: 'blue'
    property color cutIconHoverColor: 'lightblue'
    property string cutIconSource: 'hand.png'
    property double cutOuterRadius: 400
    property double cutInnerRadius: 300

    required property double cutStartAngle
    property double cutLen: 90

    // functions
    function toDegree (radianAngle) {
        return radianAngle * Math.PI / 180;
    }

    // signals
    signal cutClicked()

    anchors.fill: parent

    Shape {
        id: cMenuShape

        anchors.centerIn: parent
        containsMode: Shape.FillContains

        // ------------------------ outer circle
        ShapePath {
            id: cutOuter
    //        strokeWidth: 4
    //        strokeColor: 'blue'

            fillColor: cutBackgroundColor

            PathAngleArc {
                centerX: 0
                centerY: 0
                radiusX: cutOuterRadius
                radiusY: cutOuterRadius
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
//            strokeWidth: 4
//            strokeColor: 'blue'

            fillColor: "white"

            PathAngleArc {
                centerX: 0
                centerY: 0
                radiusX: cutInnerRadius
                radiusY: cutInnerRadius
                startAngle: cutStartAngle
                sweepAngle: cutLen
            }
            PathLine {
                x: 0
                y: 0
            }
        }

        // ------------------------ text
        ColumnLayout {

            z: 2

            anchors {
                centerIn: parent
                horizontalCenterOffset: (cutInnerRadius + cutOuterRadius) / 2 * Math.cos(toDegree(cutStartAngle + cutLen / 2))
                verticalCenterOffset: (cutInnerRadius + cutOuterRadius) / 2 * Math.sin(toDegree(cutStartAngle + cutLen / 2))
            }

//            rotation: 90 + (2 * cutStartAngle + cutLen) / 2

            Button {
                padding: 0
//                x: 0
//                y: 0
                width: 28
                height: 28

                icon {
                    source: 'hand.png'
                    width: 50
                    height: 50
                    color: hovered ? cutIconHoverColor : cutIconColor
                }

                hoverEnabled: true

                display: AbstractButton.IconOnly

                background: Rectangle {
                    color: 'transparent'
                }

                onClicked: cutClicked()

                PropertyAnimation on width {
                    from: 0
                    to: cutLen
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }

//            Image {
//                width: 28
//                height: 28
//                source: 'hand.png'

//                MouseArea {
//                    anchors.fill: parent

//                    onClicked: cutClicked()
//                }
//            }

//            Text {
//                text: cutText
//                font.pixelSize: 30

//                MouseArea {
//                    anchors.fill: parent

//                    onClicked: cutClicked()
//                }
//            }
        }
    }
}


