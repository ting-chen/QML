#include "helloWorld.h"

helloWorld::helloWorld(QObject *parent) : QObject(parent)
{

}

void helloWorld::setHello(const QString &hello)
{
    mHello = hello;
    emit sigHello(hello);
}

QString helloWorld::hello() const
{
    return mHello;
}
