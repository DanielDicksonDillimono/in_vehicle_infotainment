// Copyright (C) 2024 Daniel Dickson Dillimono.
/*
   Main map view
*/

import QtQuick 2.15
import QtLocation
import QtPositioning
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import QtQuick.Studio.Effects
import "../CustomWidgets"

Rectangle {
    color: "#D9D9D9"

    anchors{
        top: parent.top
        left: media_playback_screen.right
        right: parent.right
        bottom: parent.bottom
    }


    Plugin{
        id: plugin
        name: "osm"
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=d12e3d8af8964a75aeecf1964ea87d71" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }

    PositionSource {
        id: positionSource
        onPositionChanged: {
           map.center = position.coordinate
        }
    }

    MapView{
        id: mapView
        anchors.fill: parent
        map.plugin: plugin
        map.center: positionSource.position.coordinate
        map.zoomLevel: 14
    }

    SearchBar{
        id:searchbar
    }

    QuickDestinationNavBar{
        id:quickDestinationNavBar
    }

    MapControlPanel{
        id:map_control_panel
    }
}
