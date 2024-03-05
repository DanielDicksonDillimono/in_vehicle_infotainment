#include "mapscontroller.h"
#include <qdebug.h>

MapsController::MapsController(QObject *parent)
    : QObject{parent}
    ,m_search_term("Enschede Prinsestraat 21")
{
    qDebug() << "maps controller created";
}

QString MapsController::searchTerm() const
{
    return m_search_term;
}

void MapsController::setSearchTerm(QString new_term)
{
    if(m_search_term != new_term)
    {
        m_search_term = new_term;
        qDebug() << "new term" + new_term;
        emit searchTermChanged();
    }
}

