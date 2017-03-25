import QtQuick 2.0

Item {
    property alias img: image1
    property alias mA1: mouseArea1
    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 150
        height: 150
        color: "#ffffff"
        radius: 8
        border.width: 4

        Image {
            id: image1
            x: 8
            y: 8
            width: 134
            height: 134
            source: "p.png"
        }

        MouseArea {
            id: mouseArea1
            x: 8
            y: 8
            width: 134
            height: 134
        }
    }
    function change(a) {
        if (a==1) {
            image1.source = "o.png"
            mouseArea1.enabled = false
        } else if (a==2) {
            image1.source = "iks.png"
            mouseArea1.enabled = false
        } else {
            image1.source = "p.png"
            mouseArea1.enabled = true
        }
    }
}
