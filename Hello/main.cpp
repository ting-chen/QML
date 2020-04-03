#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "helloWorld.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<helloWorld>("Hello.backend", 1, 0, "Hello");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
