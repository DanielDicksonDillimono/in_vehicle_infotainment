#include "mapscontroller.h"
#include <qdebug.h>

MapsController::MapsController(QObject *parent)
    : QObject{parent}
    ,m_search_term("")
{
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
        emit searchTermChanged();
    }
}

