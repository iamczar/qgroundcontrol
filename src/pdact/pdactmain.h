#ifndef PDACTMAIN_H
#define PDACTMAIN_H

#include <QObject>
#include <QObject>
#include <QDebug>
#include <QVariant>
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>
#include <QUdpSocket>
#include <QNetworkDatagram>
#include <QHostAddress>
#include <QNetworkInterface>
#include <QAbstractSocket>

class PdactMain : public QObject
{
    Q_OBJECT
public:
    explicit PdactMain(QObject *parent = nullptr);

signals:

public slots:
    void restartRpi(QVariant ipaddress,QVariant portNumber);

private:
    QUdpSocket socket;

};

#endif // PDACTMAIN_H
