#include "appmanager.h"
#include "qdebug.h"

AppManager::AppManager(QObject *parent)
    : QObject{parent}
{
    qDebug() << "class created";
}
