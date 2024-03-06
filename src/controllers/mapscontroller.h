#ifndef MAPSCONTROLLER_H
#define MAPSCONTROLLER_H

#include <QObject>

class MapsController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString searchTerm READ searchTerm WRITE setSearchTerm NOTIFY searchTermChanged FINAL)
    Q_PROPERTY(double_t mapZoomLevel READ mapZoomLevel WRITE setMapZoomLevel NOTIFY mapZoomLevelChanged FINAL)
public:
    explicit MapsController(QObject *parent = nullptr);
    QString searchTerm () const;
    double_t mapZoomLevel () const;

signals:
    void searchTermChanged();
    void mapZoomLevelChanged();

public slots:
    void setSearchTerm(const QString&);
    void setMapZoomLevel(const double_t&);

private:
    QString m_search_term;
    double_t m_map_zoom_level;
};

#endif // MAPSCONTROLLER_H
