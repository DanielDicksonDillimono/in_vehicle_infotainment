#ifndef APPMANAGER_H
#define APPMANAGER_H

#include <QObject>

class AppManager : public QObject
{
    Q_OBJECT
public:
    explicit AppManager(QObject *parent = nullptr);

signals:
};

#endif // APPMANAGER_H
