// Copyright (C) 2024 Daniel Dickson Dillimono.
/*
   Search Bar
*/

import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Studio.Effects

TextField{

    anchors{
        top: parent.top
        left: parent.left
        topMargin: 10
        leftMargin: 100
    }
    placeholderText: "Search"
    placeholderTextColor: "#A2A2A2"
    width: parent.width * 0.35
    height: parent.height * 0.05


    background: Rectangle{
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
    }

}
