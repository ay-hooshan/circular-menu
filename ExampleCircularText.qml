import QtQuick

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Canvas {

        function drawTextAlongArc(context, str, centerX, centerY, radius, angle)
        {
            context.save();
            context.translate(centerX, centerY);
            context.rotate(-1 * angle / 2);
            context.rotate(-1 * (angle / str.length) / 2);
            for (var n = 0; n < str.length; n++) {
                context.rotate(angle / str.length);
                context.save();
                context.translate(0, -1 * radius);
                var char1 = str[n];
                context.fillText(char1, 0, 0);
                context.restore();
            }
            context.restore();

        }


      anchors.fill: parent
      onPaint: {

          var ctx = getContext("2d");
          ctx.fillStyle = Qt.rgba(1, 1, 1, 1);
          ctx.fillRect(0, 0, width, height);


          ctx.font='50px Verdana'

          //ctx.font = '30px Courier New'
          ctx.textAlign = "center";

          var centerX = width / 2;
          var centerY = height/2; //height - 30;
          var angle   = Math.PI * 2; // radians
          var radius  = 180;
          ctx.fillStyle="#000000"
          drawTextAlongArc(ctx, "Hello World and this is something else and another else again", centerX, centerY, radius, angle);

      }
    }
}
