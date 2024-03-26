#include "mapscontroller.h"
#include <qdebug.h>
#include <QGeoCircle>
#include <QPlaceManager>
#include <QPlace>

enum Quick_Destinations {};



MapsController::MapsController(QObject *parent)
    : QObject{parent}
    ,m_search_term("")
    ,m_map_zoom_level(14)
{
    initializeProvider();
    initializePositionSource();
    m_position_source.data();
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

void MapsController::setCenterOnResult(const bool center_result)
{
    m_center_on_first_search_result = center_result;
}

bool MapsController::providerError(){

    if(m_geo_service_provider->error() != QGeoServiceProvider::NoError)
    {
        qDebug() << "GeoServiceProvider: " << m_geo_service_provider->errorString();
        return true;
    }
    return false;
}

void MapsController::initializeProvider()
{
    qDebug() << QGeoServiceProvider::availableServiceProviders();
    m_geo_service_provider = QSharedPointer<QGeoServiceProvider>(new QGeoServiceProvider("osm"));
    if(providerError())
        return;

    m_place_manager = QSharedPointer<QPlaceManager>(m_geo_service_provider->placeManager());

    if(providerError())
        return;
}

void MapsController::initializePositionSource()
{
    m_position_source = QSharedPointer<QGeoPositionInfoSource>(QGeoPositionInfoSource::createDefaultSource(this));
    //m_position_source = QGeoPositionInfoSource::createDefaultSource(this);
    if(!m_position_source || m_position_source->error() != QGeoPositionInfoSource::NoError)
    {
        qDebug() << "PositionSource Error: " << m_position_source->error();
        return;
    }
    connect(m_position_source.data(), &QGeoPositionInfoSource::positionUpdated, this, &MapsController::handlePositionUpdated);
    m_position_source->startUpdates();
}

QGeoPositionInfoSource* MapsController::positionSource() const
{
    return m_position_source.data();
}


// void MapsController::setPositionSource(const QGeoPositionInfoSource*)
// {
//     emit positionSourceChanged();
// }

void MapsController::handlePositionUpdated(const QGeoPositionInfo &new_position_info)
{
    setDeviceLocation(new_position_info.coordinate());
    qDebug() << m_device_location.latitude() << ":" << m_device_location.longitude();
}

void MapsController::setDeviceLocation(const QGeoCoordinate &new_location)
{
    if(m_device_location != new_location)
    {
        m_device_location = new_location;
        emit deviceLocationChanged();
        emit positionSourceChanged();
    }
}

QGeoCoordinate MapsController::deviceLocation() const
{
    return m_device_location;
}

void MapsController::setSearchTerm(const QString &new_term)
{
    if(m_search_term != new_term)
    {
        m_search_term = new_term;
        emit searchTermChanged();
    }
}

void MapsController::searchForPlace(const QString &search_term)
{
    m_place_search_result = {}; //empty results

    if(m_search_reply)
        m_search_reply->disconnect();

    QPlaceSearchRequest search_request;
    search_request.setSearchTerm(search_term);
    search_request.setSearchArea(QGeoCircle(m_device_location));
    m_search_reply = QSharedPointer<QPlaceSearchReply>(m_place_manager->search(search_request));
    connect(m_search_reply.data(), &QPlaceSearchReply::finished, this, &MapsController::handlePlaceSearchReply);

}

void MapsController::handlePlaceSearchReply()
{
    // m_place_search_result = {}; //empty results

    if (m_search_reply->error() != QPlaceReply::NoError)
    {
        qDebug() << "SEARCH_REPLY_ERROR: " << m_search_reply->errorString();
        return;
    }
    for(const QPlaceSearchResult &result : m_search_reply->results())
    {
        if(result.type() == QPlaceSearchResult::PlaceResult)
        {
            QPlaceResult placeResult =result;
            m_place_search_result.append(placeResult.place());
        }
    }

    emit placeResultsHandled();

}

const QList<QPlace>& MapsController::placeSearchResults() const
{
    return m_place_search_result;
}
