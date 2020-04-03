import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Dialogs 1.2
import Hello.backend 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        id: mainform
        anchors.fill: parent
        button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
        button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))

    }
    Dialog {
        id: processDialog
        title: qsTr("hello qml")

    }
    Rectangle {
            id: rect1
            x: 12; y: 12
            width: 176; height: 96
            gradient: Gradient {
                GradientStop { position: 0.0; color: "lightsteelblue" }
                GradientStop { position: 1.0; color: "slategray" }
            }
            MouseArea {
                       id: area
                       width: parent.width
                       height: parent.height
                       onClicked: {
                           thisLabel.visible = !thisLabel.visible
                           hell.setHello("yes")

                       }
                   }
            border.color: "slategray"
            anchors.centerIn: mainform
            anchors.fill: mainform

            Rectangle {
                width: 200
                height: 80
                color: "linen"

                TextInput {
                    id: input1
                    x: 8; y: 8
                    width: 96; height: 20
                    focus: true
                    text: "Text Input 1"
                    KeyNavigation.tab: input2
                    onEditingFinished: {
                        hell.setHello(input1.text)
                        console.log('log content textinput1 change', input1.text)
                    }

                }

                TextInput {
                    id: input2
                    x: 8; y: 36
                    width: 96; height: 20
                    text: "Text Input 2"
                    KeyNavigation.tab: input1
                }
            }
        }

    Hello {
            id: hell
            onSigHello: { // c++ transport signal with parameter content
                input2.text =content
                console.log('log hello change', hell.hello(),content)
            }

    }
    Text {
            // (1) identifier
            id: thisLabel

            // (2) set x- and y-position
            x: 24; y: 16

            // (3) bind height to 2 * width
            height: 2 * width

            // (4) custom property
            property int times: 24

            // (5) property alias
            property alias anotherTimes: thisLabel.times

            // (6) set text appended by value
            text: "Greetings " + times

            // (7) font is a grouped property
            font.family: "Ubuntu"
            font.pixelSize: 24

            // (9) signal handler for property changes
            onHeightChanged: console.log('height:', height)

            // focus is need to receive key events
            focus: true

            // change color based on focus value
            color: focus?"red":"black"
            onFocusChanged: thisLabel.times=thisLabel.times+1
        }
    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}



//import QtQuick 2.6
//import QtQuick.Window 2.12
//import Qt3D

//Window {
//  id: window
//  visible: true
//  width: 1280
//  height: 720

//  // Viewport for 3D content
//  View3D {
//    id: view

//    anchors.fill: parent
//    // Scene to view
//    Node {
//      id: scene

//      Light {

//        id: directionalLight

//      }

//      Camera {
//        id: camera
//        // It's important that your camera is not inside
//        // your model so move it back along the z axis
//        // The Camera is implicitly facing up the z axis,
//        // so we should be looking towards (0, 0, 0)
//        z: -600
//      }

//      Model {
//        id: cubeModel
//        // #Cube is one of the "built-in" primitive meshes
//        // Other Options are:
//        // #Cone, #Sphere, #Cylinder, #Rectangle
//        source: "#Cube"

//        // When using a Model, it is not enough to have a
//        // mesh source (ie "#Cube")
//        // You also need to define what material to shade
//        // the mesh with. A Model can be built up of
//        // multiple sub-meshes, so each mesh needs its own
//        // material. Materials are defined in an array,
//        // and order reflects which mesh to shade

//        // All of the default primitive meshes contain one
//        // sub-mesh, so you only need 1 material.

//        materials: [

//          DefaultMaterial {

//            // We are using the DefaultMaterial which
//            // dynamically generates a shader based on what
//            // properties are set. This means you don't
//            // need to write any shader code yourself.
//            // In this case we just want the cube to have
//            // a red diffuse color.
//            id: cubeMaterial
//            diffuseColor: "red"
//          }
//        ]
//      }
//    }
//  }
//}
