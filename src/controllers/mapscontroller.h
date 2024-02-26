#ifndef MAPSCONTROLLER_H
#define MAPSCONTROLLER_H

#include <QObject>

class MapsController : public QObject
{
    Q_OBJECT
public:
    explicit MapsController(QObject *parent = nullptr);

signals:
};

#endif // MAPSCONTROLLER_H
