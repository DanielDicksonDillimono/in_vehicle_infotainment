import QtQuick 2.15
import Search_Controller 1.0
import QtQuick.Controls
import QtQuick.Layouts
Rectangle{
    id:parentContainer

    property Search_Model searchModel
    implicitWidth: parent.width * 0.35
    implicitHeight: parent.height
    anchors{
            left: parent.left
            bottom: parent.bottom
            top: parent.top
        }
    Image {
        id: closeButton
        source: "../assets/close.png"
        anchors{
                right: parent.right
                top: parent.top
                rightMargin: 10
            }
        sourceSize{
            width: 20
            height: 20
        }
        MouseArea
        {
            anchors.fill: parent
            onClicked: maps_controller.setShowSearchList(!maps_controller.showSearchList)
        }
    }
    ListView{
        spacing: 20
        anchors.fill: parent
        anchors{
              topMargin: 20
              bottomMargin: 5
              leftMargin: 30
           }
        Component{
            id: locationCard
            MouseArea{
                height: childrenRect.height
                width: parentContainer.width
                RowLayout{
                    Image {
                        id: locationPinImage
                        source: "qrc:/qt/qml/content/assets/location-pin.png"
                        sourceSize{
                            width:30
                            height:30
                        }
                    }
                    ColumnLayout{
                        Text {
                            id: locationName
                            text: qsTr(model.title === "" ? "Unknown Place" : model.title)
                        }
                        Text {
                            id: locationAddress
                            text: qsTr(model.fullAddress === "" ? model.coordinate : model.fullAddress)
                        }

                    }
                }
                onClicked: maps_controller.setMapCenter(model.coordinate)
            }
        }
        model: searchModel
        delegate: locationCard
    }
}
