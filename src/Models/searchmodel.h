#ifndef SEARCHMODEL_H
#define SEARCHMODEL_H

#include <QAbstractListModel>
#include <QPlace>
#include "../controllers/mapscontroller.h"


//class MapsController;
class SearchModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QList<QPlace> * results READ results NOTIFY resultsChanged FINAL)
    Q_PROPERTY(MapsController * controller /*READ controller*/ WRITE setController)

public:
    explicit SearchModel(QObject *parent = nullptr);

    enum RoleNames
    {
        TitleRole = Qt::UserRole,
        Coordinate = Qt::UserRole+2,
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    Qt::ItemFlags flags(const QModelIndex &index) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    QList<QPlace> *results() const;

    //void setResults(const QList<QPlace> &);
    void setResults();
    void setController(MapsController *);

signals:
    void resultsChanged();

private:
    QSharedPointer<QList<QPlace>> m_results;
    QSharedPointer<MapsController> m_controller;
};

#endif // SEARCHMODEL_H
