#ifndef HELLOWORLD_H
#define HELLOWORLD_H

#include <QObject>

class helloWorld : public QObject {
  Q_OBJECT
public:
  explicit helloWorld(QObject *parent = 0);

  Q_INVOKABLE void setHello(const QString &hello); // expose function to qml

  Q_INVOKABLE QString hello() const;

signals:
  void sigHello(QString content);

private:
  QString mHello;
};

#endif // HELLOWORLD_H
