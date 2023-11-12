import QtQuick 2.15

Canvas {
    id: mycanvas
    width: 100
    height: 200
    onPaint: {
        var ctx = getContext("2d");
        ctx.fillStyle = Qt.rgba(1, 0, 0, 1);
        ctx.fillRect(0, 0, width, height);
    }
}
