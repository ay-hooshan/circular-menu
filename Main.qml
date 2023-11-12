import QtQuick 2.15
import QtQuick.Controls

Window {
    visible: true
    width: 900
    height: 900


    CircularMenu {
        outerRadius: 200
        innerRadius: 150
        listModel: ListModel {
            ListElement {
                name: "Abbas"
                color: 'blue'
            }
            ListElement {
                name: "Akbar"
                color: 'red'
            }
        }
    }


//    CanvasVersion {}


//    ExampleCircularText {}
//    ExampleCanvasCircle { anchors.centerIn: parent }
//    ExampleCanvas1 { anchors.centerIn: parent }


//    ExampleShape1 {}
//    ExampleShape2 {}


}
