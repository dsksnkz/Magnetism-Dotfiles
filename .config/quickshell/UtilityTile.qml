import QtQuick
import Quickshell

Rectangle {
    id: root

    property string icon: ""
    property string title: ""
    property string subtitle: ""
    property string command: ""
    property bool toggled: false
    signal activated()

    implicitWidth: 166
    implicitHeight: 66
    radius: 3
    color: toggled ? "#f5f5f5" : (mouse.containsMouse ? "#202020" : "#101010")
    border.width: toggled ? 0 : 1
    border.color: mouse.containsMouse ? "#f5f5f5" : "#333333"
    scale: mouse.pressed ? 0.97 : 1

    Text {
        id: iconText
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        text: root.icon
        color: root.toggled ? "#050505" : "#f5f5f5"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 19
    }

    Column {
        anchors.left: iconText.right
        anchors.leftMargin: 11
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        spacing: 2

        Text {
            width: parent.width
            text: root.title
            elide: Text.ElideRight
            color: root.toggled ? "#050505" : "#f5f5f5"
            font.family: "Inter"
            font.pixelSize: 12
            font.weight: Font.DemiBold
        }
        Text {
            width: parent.width
            text: root.subtitle
            elide: Text.ElideRight
            color: root.toggled ? "#444444" : "#8f8f8f"
            font.family: "Inter"
            font.pixelSize: 10
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if (root.command.length > 0)
                Quickshell.execDetached(["sh", "-lc", root.command])
            root.activated()
        }
    }

    Behavior on color { ColorAnimation { duration: 160; easing.type: Easing.OutCubic } }
    Behavior on border.color { ColorAnimation { duration: 160; easing.type: Easing.OutCubic } }
    Behavior on scale { NumberAnimation { duration: 90; easing.type: Easing.OutCubic } }
}
