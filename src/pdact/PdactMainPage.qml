
import QtQuick          2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts  1.2

import QGroundControl               1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0

Rectangle {
    id:     pdactMainPage
    color:  "black"
    z:      QGroundControl.zOrderTopMost

    readonly property real _defaultTextHeight:  ScreenTools.defaultFontPixelHeight
    readonly property real _defaultTextWidth:   ScreenTools.defaultFontPixelWidth
    readonly property real _horizontalMargin:   _defaultTextWidth / 2
    readonly property real _verticalMargin:     _defaultTextHeight / 2
    readonly property real _buttonHeight:       ScreenTools.isTinyScreen ? ScreenTools.defaultFontPixelHeight * 3 : ScreenTools.defaultFontPixelHeight * 2

    property int middleY: height /2
    property int middleX: width / 2

    property date currentDate: new Date()

    property string ipAddress: "192.168.1.97"
    property int portNumber: 6565

    PdactMain{
        id: pdactMain
    }

    Rectangle {
           id: ipAdddressBlock
           height: parent.height * 0.30
           width: parent.width * 0.50
           color: "#161618"
           anchors{
               left: parent.left
               top: parent.top
           }

           Text {
               id: ipAdddressText
               text: qsTr("Raspberry Pi IP Address")
               color: "white"
               font.pointSize: 15
               anchors{
                   left: parent.left
                   top: parent.top
                   topMargin: 20
                   leftMargin: 100
               }
           }

           Rectangle {
               id: ipAddressRectangle
               height: parent.height * 0.40
               width: parent.width * 0.80
               color: "#282828"
               anchors{
                   top: ipAdddressText.bottom
                   topMargin: 10
                   left: parent.left
                   leftMargin: 100
               }

               TextInput{
                   id: ipAddressRectangleTextInput
                   text: ipAddress
                   anchors.fill: parent
                   font.pointSize: 15
                   anchors.verticalCenter: parent.verticalCenter
                   anchors.left: parent.left
                   anchors.leftMargin: 20
                   anchors.topMargin: 25
                   color: "white"
               }
           }
       }

    Rectangle {
            id: portNumberBlock
            height: parent.height * 0.30
            width: parent.width * 0.50
            color: "#161618"
            anchors{
                right: parent.right
                top: parent.top
            }

            Text {
                id: portNumberText
                text: qsTr("Raspberry Pi Port Number")
                color: "white"
                font.pointSize: 15
                anchors{
                    left: parent.left
                    top: parent.top
                    topMargin: 20
                }
            }

            Rectangle {
                id: portNumberRectangle
                height: parent.height * 0.40
                width: parent.width * 0.80
                color: "#282828"
                anchors{
                    top: portNumberText.bottom
                    topMargin: 10
                    left: parent.left
                }

                TextInput{
                    id: portNumberRectangleTextInput
                    text: portNumber
                    anchors.fill: parent
                    font.pointSize: 15
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 20
                    anchors.topMargin: 25
                    color: "white"
                    validator: IntValidator {bottom: 0; top: 65353}
                    inputMethodHints: Qt.ImhDigitsOnly
                }
            }
        }

    Rectangle {
            id: updateSettingButton
            width: parent.width * 0.20
            height: parent.height * 0.10
            anchors.right: parent.right
            anchors.rightMargin: 150
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            color:"#d7003f"

            Text {
                id: updateSettingButtonText
                text: qsTr("Restart Rpi")
                font.pointSize: 15
                font.bold: true
                color: "white"
                anchors.centerIn: parent
            }

            MouseArea {
                id: updateSettingButtonMouseArea
                anchors.fill: parent
                onPressed: {
                    updateSettingButtonText.color = "#d7003f"
                    updateSettingButton.color = "white"
                }
                onReleased: {
                    updateSettingButtonText.color = "white"
                    updateSettingButton.color = "#d7003f"
                    console.log("restarting rpi")
                    pdactMain.restartRpi(ipAddressRectangleTextInput.text,portNumberRectangleTextInput.text)
                    ipAddress = ipAddressRectangleTextInput.text
                    portNumber = portNumberRectangleTextInput.text

                }
            }
        }
}

