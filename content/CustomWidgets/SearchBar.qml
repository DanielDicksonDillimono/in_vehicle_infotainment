// Copyright (C) 2024 Daniel Dickson Dillimono.
/*
   Search Bar
*/

import QtQuick 2.15
import QtQuick.Controls

TextField{
    anchors{
        top: parent.top
        left: parent.left
        topMargin: 10
        leftMargin: 100
    }
    placeholderText: "Search"
    placeholderTextColor: "#A2A2A2"
    width: parent.width * 0.70
    height: parent.height * 0.05


    background: Rectangle{
        color: "#323232"
        radius: 10
    }
}
