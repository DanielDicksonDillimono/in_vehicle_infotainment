// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import in_vehicle_infotainment
import QtQuick.Controls
import QtQuick.Layouts
import "RightScreen"
import "LeftScreen"

Window
{
    width: 1920
    height: 1080

    visible: true
    title: "in_vehicle_infotainment"
    MapsMainScreen{
        id:maps_main_screen
    }
    MediaPlaybackScreen{
        id:media_playback_screen
    }
}

