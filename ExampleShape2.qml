import QtQuick 2.15
import QtQuick.Shapes

Shape {
    anchors.fill: parent
    ShapePath {
        startX: 100; startY: 0
        strokeColor: 'black'
        strokeWidth: 2
        PathArc {
            x: 0; y: 100
            radiusX: 100; radiusY: 100
            useLargeArc: true
        }
    }
}

