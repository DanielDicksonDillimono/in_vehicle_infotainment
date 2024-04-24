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
import Search_Controller 1.0
//import "Search_Contoller"

Rectangle {
    color: "#D9D9D9"

    anchors{
        top: parent.top
        left: media_playback_screen.right
        right: parent.right
        bottom: parent.bottom
    }

    Connections{
        target: maps_controller
        onMapZoomLevelChanged: mapView.map.zoomLevel = maps_controller.mapZoomLevel
    }

    Connections{
        target: searchModel
        onResultsChanged: searchResultListView.visible = searchModel.rowCount() > 1
    }


    Search_Model{
        id: searchModel
        controller: maps_controller
    }

    Plugin{
        id: plugin
        name: "osm"
        PluginParameter { name: "osm.mapping.providersrepository.address"; value: "https://tile.thunderforest.com/transport/{z}/{x}/{y}.png?apikey=d12e3d8af8964a75aeecf1964ea87d71" }
        PluginParameter { name: "osm.mapping.highdpi_tiles"; value: true }
    }


    MapView{
        id: mapView
        anchors.fill: parent
        map.plugin: plugin
        map.zoomLevel: maps_controller.mapZoomLevel
        map.center: maps_controller.mapCenter
        map.onZoomLevelChanged: {
            maps_controller.setMapZoomLevel(map.zoomLevel)
        }

        //User location marker
        MapItemView
        {
            id: userLocationItem
            model: maps_controller.positionSource
            parent: mapView.map
            delegate: MapQuickItem
            {
                coordinate: maps_controller.deviceLocation
                anchorPoint.x: userLocationImage.width * 0.5
                anchorPoint.y: userLocationImage.height

                sourceItem: Image {
                    id: userLocationImage
                    source: "../assets/car.png"
                    sourceSize{
                        width: 30
                        height: 30
                    }
                }
            }
        }

        //Search result marker(s)
        MapItemView
        {
            id: mapItemView
            model: searchModel
            parent: mapView.map
            delegate: MapQuickItem
            {
                coordinate: model.coordinate

                anchorPoint.x: makerImage.width * 0.5
                anchorPoint.y: makerImage.height

                sourceItem: Image {
                    id: makerImage
                    source: "../assets/location-pin.png"
                    sourceSize{
                        width: 30
                        height: 30
                    }
                }
            }
        }
    }

    SearchBar{
        id:searchbar
        anchors{
            top: parent.top
            left: searchResultListView.visible ? searchResultListView.right : parent.left
            topMargin: 10
            leftMargin: 100
        }
    }

    QuickDestinationNavBar{
        id:quickDestinationNavBar
    }

    MapControlPanel{
        id:map_control_panel
    }

    SearchResultListView{
        id: searchResultListView
        visible: maps_controller.showSearchList
        searchModel: searchModel
    }
}
