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
                id: panUpButton
                Layout.alignment: Qt.AlignCenter
                radius: 2
                icon.source: "qrc:/qt/qml/content/assets/up-arrow.png"
                height: parent.height / 3
                width: parent.width / 2
                onClicked: {mapView.map.pan(0,-10)}
            }
            Row{
                height: parent.height / 3
                RoundButton{
                    id: panLeftButton
                    radius: 2
                    icon.source: "qrc:/qt/qml/content/assets/left-arrow.png"
                    onClicked: {    mapView.map.pan(-10,0)     }
                }
                RoundButton{
                    id: panRightButton
                    radius: 2
                    icon.source: "qrc:/qt/qml/content/assets/right-arrow.png"
                    onClicked: {    mapView.map.pan(10,0)     }
                }
            }
            RoundButton{
                id: panDownButton
                Layout.alignment: Qt.AlignCenter
                radius: 2
                icon.source: "qrc:/qt/qml/content/assets/down-arrow.png"
                height: parent.height / 3
                width: parent.width / 2
                onClicked: {mapView.map.pan(0,10)}
            }
        }
       ColumnLayout{
           RoundButton{
               id: zoomInButton
               Layout.alignment: Qt.AlignCenter
               radius: 2
               icon.source: "qrc:/qt/qml/content/assets/add.png"
               height: parent.height / 3
               width: parent.width / 2
               onClicked: {mapView.map.zoomLevel += 1}
           }
           RoundButton{
               id: zoomOutButton
               Layout.alignment: Qt.AlignCenter
               radius: 2
               icon.source: "qrc:/qt/qml/content/assets/minus.png"
               height: parent.height / 3
               width: parent.width / 2
               onClicked: {mapView.map.zoomLevel -= 1}
           }
           RoundButton{
               id:centerOnDeviceButton
               Layout.alignment: Qt.AlignCenter
               radius: 2
               icon.source: "qrc:/qt/qml/content/assets/arrow.png"
               height: parent.height / 3
               width: parent.width / 2
               onClicked: {maps_controller.centerMapOnDeviceLocation()}
           }
       }
    }
}
