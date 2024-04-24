#include "searchmodel.h"
#include <QDebug>
#include <QGeoLocation>
#include <QGeoCoordinate>
#include <QGeoAddress>

SearchModel::SearchModel(QObject *parent)
    : QAbstractListModel(parent)
{

}

int SearchModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid() || m_results.isNull())
        return 0;

    return m_results->size();
}


QVariant SearchModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !m_results)
        return QVariant("Error");

    const QPlace place = m_results->at(index.row());

    switch (role)
    {
        case TitleRole:
            return QVariant(place.name()/*QStringLiteral("Place Name")*/);
        case Coordinate:
        {
            QVariant var;
            var.setValue(place.location().coordinate());
            return var;
        }
        case Street:
        {
            QVariant var;
            var.setValue(place.location().address().street());
            return var;
        }
        case StreetNumber:
        {
            QVariant var;
            var.setValue(place.location().address().streetNumber());
            return var;
        }
        case FullAddress:
        {
            QVariant var;
            QString fullAddress = place.location().address().street() + " " + place.location().address().streetNumber();
            var.setValue(fullAddress);
            return var;
        }
        default:
            return QVariant("Error");
    }
}


Qt::ItemFlags SearchModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return QAbstractItemModel::flags(index) | Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> SearchModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[TitleRole] = "title";
    names[Coordinate] = "coordinate";
    names[Street] = "Street";
    names[StreetNumber] = "StreetNumber";
    names[FullAddress] = "fullAddress";
    return names;
}

QList<QPlace> * SearchModel::results() const
{
    return m_results.data();
}

void SearchModel::setResults()
{
    beginResetModel();
    m_results = QSharedPointer<QList<QPlace>>(new QList<QPlace>(m_controller->placeSearchResults()));
    endResetModel();
}

void SearchModel::setController(MapsController *new_controller)
{
    m_controller = QSharedPointer<MapsController>(new_controller);

    if(m_controller.isNull())
    {
        qDebug() << "SEARCH MODEL: MapsController is null";
        return;
    }

    connect(m_controller.data(), &MapsController::placeResultsHandled, this, &SearchModel::setResults);
}
