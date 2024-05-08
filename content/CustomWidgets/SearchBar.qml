// Copyright (C) 2024 Daniel Dickson Dillimono.
/*
   Search Bar
*/

import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Studio.Effects


Rectangle{

    width: parent.width * 0.35
    height: parent.height * 0.05
    color: "#D9D9D9"
    radius: 10

    layer.enabled: true
    layer.effect: DropShadowEffect{
        color: "#28000000"
        opacity: 0.681
        radius: 4
        spread: -4
        verticalOffset: 4
        horizontalOffset: 0
    }

    IconImage{
        id: search_icon_image
        anchors.verticalCenter: parent.verticalCenter
        anchors{
            left: parent.left
            leftMargin: 10
        }
        source: "qrc:/qt/qml/content/assets/search.png"
        sourceSize{
            width: 16
            height: 16
        }
    }

    TextField{
        id: search_text_field
        anchors{
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: search_icon_image.right
        }

        PlaceholderText{
            id: searchbar_placeholder_text
            anchors.verticalCenter: parent.verticalCenter
            anchors{
               left: parent.left
               leftMargin: 15
            }
            text: "Search Maps"
            color: "#A2A2A2"
            visible: !search_text_field.text
        }

        background: Rectangle{
            border.width: 0
            radius:10
            color: "transparent"
        }

        onEditingFinished:{
            maps_controller.searchForPlace(text)
        }

    }

}
