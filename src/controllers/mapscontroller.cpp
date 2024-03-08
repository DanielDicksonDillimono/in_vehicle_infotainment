#include "mapscontroller.h"
#include <qdebug.h>

enum Quick_Destinations {};

MapsController::MapsController(QObject *parent)
    : QObject{parent}
    ,m_search_term("")
    ,m_map_zoom_level(14)
{
}

QString MapsController::searchTerm() const
{
    return m_search_term;
}

double_t MapsController::mapZoomLevel() const
{
    return m_map_zoom_level;
}

void MapsController::setMapZoomLevel(const double_t &new_level)
{
    if(m_map_zoom_level != new_level)
    {
        m_map_zoom_level = new_level;
        emit mapZoomLevelChanged();
    }
}

void MapsController::setSearchTerm(const QString &new_term)
{
    if(m_search_term != new_term)
    {
        m_search_term = new_term;
        emit searchTermChanged();
    }
}

void MapsController::setCenterOnResult(const bool center_result)
{
    m_center_on_first_search_result = center_result;
}
