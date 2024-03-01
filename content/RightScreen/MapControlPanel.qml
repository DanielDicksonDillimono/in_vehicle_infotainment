// Copyright (C) 2024 Daniel Dickson Dillimono.
/*
   Maps control console.
   Includes panning direction buttons and zoom manipulation button
*/

import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
Item{
    width: parent.width * 0.10
    height: parent.width * 0.20
    anchors{
        bottom: parent.bottom
        right: parent.right
        rightMargin: 10
        bottomMargin: 10
    }
    Row{
        anchors{
            right: parent.right
        }

        spacing: 5
        ColumnLayout{
            anchors{
                bottom: parent.bottom
            }
            spacing: 5
            RoundButton{
                Layout.alignment: Qt.AlignCenter
                radius: 0
                icon.source: "qrc:/qt/qml/content/assets/up-arrow.png"
                height: parent.height / 3
                width: parent.width / 2
                onClicked: {map.pan(0,10)}
            }
            // Image {
            //     id: name
            //     source: "qrc:/qt/qml/content/assets/up-arrow.png"
            //     Layout.alignment: Qt.AlignCenter
            //     sourceSize{
            //         width: 24
            //         height: 24
            //     }
            //     MouseArea{
            //         anchors.fill: parent
            //         hoverEnabled: true
            //         onClicked: (mousebutton) => {}
            //     }

            //  }
            Row{
                height: parent.height / 3
                //width: parent.width
                RoundButton{
                    //width: parent.width / 2
                    radius: 0
                    icon.source: "qrc:/qt/qml/content/assets/left-arrow.png"
                    onClicked: {    map.pan(10,0)     }
                }
                RoundButton{
                    //width: parent.width / 2
                    radius: 0
                    icon.source: "qrc:/qt/qml/content/assets/right-arrow.png"
                    onClicked: {    map.pan(10,0)     }
                }
            }
            RoundButton{
                Layout.alignment: Qt.AlignCenter
                radius: 0
                icon.source: "qrc:/qt/qml/content/assets/down-arrow.png"
                height: parent.height / 3
                width: parent.width / 2
                onClicked: {map.pan(0,10)}
            }
        }
       ColumnLayout{
           RoundButton{
               Layout.alignment: Qt.AlignCenter
               radius: 0
               icon.source: "qrc:/qt/qml/content/assets/add.png"
               height: parent.height / 3
               width: parent.width / 2
               onClicked: {map.zoomLevel += 1}
           }
           RoundButton{
               Layout.alignment: Qt.AlignCenter
               radius: 0
               icon.source: "qrc:/qt/qml/content/assets/minus.png"
               height: parent.height / 3
               width: parent.width / 2
               onClicked: {map.zoomLevel -= 1}
           }
       }
    }
}
