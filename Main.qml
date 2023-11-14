import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 900
    height: 900

    // ---------------------------- test
    RowLayout {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        height: 50

        TextField {
            id: durationField
            text: '2200'
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

        Button {
            text: 'play animation'
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: {
                outerAnimation.running = true
                innerAnimation.running = true
            }
        }
    }

    CircularMenu {
//        outerRadius: 250
//        innerRadius: 150

        PropertyAnimation on outerRadius {
            id: outerAnimation
            easing.type: Easing.OutElastic
            from: 0
            to: 250
            duration: parseInt(durationField.text)
        }

        PropertyAnimation on innerRadius {
            id: innerAnimation
            easing.type: Easing.OutElastic
            from: 0
            to: 150
            duration: parseInt(durationField.text)
        }

        listModel: ListModel {
            ListElement {
                name: 'Abbas'
                color: 'gold'
                iconSource: 'hand.png'
            }
            ListElement {
                name: 'Akbar'
                color: 'tomato'
                iconSource: 'hand.png'
            }
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
