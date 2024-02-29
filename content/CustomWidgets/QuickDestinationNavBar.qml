import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Studio.Effects
import QtQuick.Layouts

Rectangle {
    anchors{
        right: parent.right
        top: parent.top
        topMargin: 10
        rightMargin: 10
    }

    height: parent.height * 0.30
    width: parent.width * 0.05
    radius: 10
    color: "#D9D9D9"
    layer.enabled: true
    layer.effect: DropShadowEffect{
        color: "#28000000"
        opacity: 0.681
        radius: 4
        spread: -4
        verticalOffset: 4
        horizontalOffset: 0
    }

    ColumnLayout{
        spacing:0
        anchors.fill: parent
        Image {
            id: restRoomButton
            source: "../assets/toilet.png"
            Layout.alignment: Qt.AlignCenter
            sourceSize{
                width: 24
                height: 24
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: (mousebutton) => {}
            }
        }
        Image {
            id: foodButton
            source: "../assets/burger.png"
            Layout.alignment: Qt.AlignCenter
            sourceSize{
                width: 24
                height: 24
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: (mousebutton) => {}
            }
        }
        Image {
            id: gasStationButton
            source: "../assets/gas-station.png"
            Layout.alignment: Qt.AlignCenter
            sourceSize{
                width: 24
                height: 24
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: (mousebutton) => {}
            }
        }
    }
}
