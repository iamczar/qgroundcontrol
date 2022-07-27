#include "pdactmain.h"

PdactMain::PdactMain(QObject *parent)
    : QObject{parent}
{

}

void PdactMain::restartRpi(QVariant ipaddress, QVariant portNumber)
{
    QJsonObject rpiOutgoingMsgJson;

    rpiOutgoingMsgJson.insert("msg_src","qgc");
    rpiOutgoingMsgJson.insert("cmd","restart");

    QJsonDocument doc(rpiOutgoingMsgJson);
    QString strJson(doc.toJson(QJsonDocument::Compact));
    QByteArray byteArrayJson = strJson.toUtf8();
    QNetworkDatagram datagram(byteArrayJson,QHostAddress(ipaddress.toString()),portNumber.toInt());
    socket.writeDatagram(datagram);
    qInfo() << "restart rpi msg sent";
}
