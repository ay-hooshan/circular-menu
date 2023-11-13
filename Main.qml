import QtQuick 2.15
import QtQuick.Controls

Window {
    visible: true
    width: 900
    height: 900


    CircularMenu {
//        outerRadius: 250
//        innerRadius: 150

        PropertyAnimation on outerRadius {
            from: 0
            to: 250
            duration: 500
        }

        PropertyAnimation on innerRadius {
            from: 0
            to: 150
            duration: 500
        }

        listModel: ListModel {
            ListElement {
                name: 'Abbas'
                color: 'blue'
                iconSource: 'hand.png'
            }
            ListElement {
                name: 'Akbar'
                color: 'red'
                iconSource: 'hand.png'
            }
//            ListElement {
//                name: 'something'
//                color: 'tomato'
//                iconSource: 'hand.png'
//            }
        }
    }


//    CanvasVersion {}


//    ExampleCircularText {}
//    ExampleCanvasCircle { anchors.centerIn: parent }
//    ExampleCanvas1 { anchors.centerIn: parent }


//    ExampleShape1 {}
//    ExampleShape2 {}


//    ExampleMenu {}


//    ExampleActoin1 {}

}
