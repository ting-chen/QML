import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3

Item {
    width: 640
    height: 480
    property alias radioButton2: radioButton2
    property alias radioButton1: radioButton1
    property alias button2: button2

    property alias button1: button1

    RowLayout {
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Press Me 1")
        }

        Button {
            id: button2
            text: qsTr("Press Me 2")
        }
    }

    Slider {
        id: sliderHorizontal1
        x: 226
        y: 288
    }

    ColumnLayout {
        id: columnLayout1
        x: 226
        y: 120
        width: 100
        height: 100

        RadioButton {
            id: radioButton1
            text: qsTr("开始")
        }

        RadioButton {
            id: radioButton2
            text: qsTr("加速")
        }
    }
}
