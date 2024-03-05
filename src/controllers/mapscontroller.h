#ifndef MAPSCONTROLLER_H
#define MAPSCONTROLLER_H

#include <QObject>

class MapsController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString searchTerm READ searchTerm WRITE setSearchTerm NOTIFY searchTermChanged FINAL)
public:
    explicit MapsController(QObject *parent = nullptr);
    QString searchTerm () const;

signals:
    void searchTermChanged();

public slots:
    void setSearchTerm(QString);

private:
    QString m_search_term;

};

#endif // MAPSCONTROLLER_H
