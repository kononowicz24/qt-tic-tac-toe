import QtQuick 2.0
import QtQuick.Extras 1.4

Item {
    Field {
        id: field1
        x: 8
        y: 8
        mA1.onClicked: {
            setFieldValue(0,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field2
        x: 169
        y: 8
        mA1.onClicked: {
            setFieldValue(1,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field3
        x: 330
        y: 8
        mA1.onClicked: {
            setFieldValue(2,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field4
        x: 8
        y: 167
        mA1.onClicked: {
            setFieldValue(3,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field7
        x: 8
        y: 327
        mA1.onClicked: {
            setFieldValue(6,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field5
        x: 169
        y: 167
        mA1.onClicked: {
            setFieldValue(4,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field6
        x: 330
        y: 167
        mA1.onClicked: {
            setFieldValue(5,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field8
        x: 169
        y: 327
        mA1.onClicked: {
            setFieldValue(7,tura)
            change(tura);
            changePlayer()
        }
    }

    Field {
        id: field9
        x: 330
        y: 327
        mA1.onClicked: {
            setFieldValue(8,tura)
            change(tura);
            changePlayer()
        }
    }

    Rectangle {
        id: rectangle1
        x: 485
        y: 8
        width: 147
        height: 57
        color: "#ffffff"
        radius: 8
        border.width: 4

        Text {
            id: text1
            x: 8
            y: 8
            width: 131
            height: 41
            text: qsTr("RESET")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24
        }

        MouseArea {
            id: mouseArea1
            x: 8
            y: 8
            width: 131
            height: 41
            onClicked: reset()
        }
    }

    Rectangle {
        id: rectangleVS
        x: 485
        y: 71
        width: 147
        height: 56
        color: "#ffffff"
        radius: 8
        border.width: 4

        Text {
            id: text2
            x: 8
            y: 8
            width: 131
            height: 40
            color: "#ff1f1f"
            text: qsTr("AI")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 24

            MouseArea {
                id: mouseArea2
                x: 0
                y: 0
                width: 131
                height: 40
                onClicked: {
                    rectangleAI.visible = false
                    rectangleVS.visible = false
                    useAI = true
                }
            }
        }
    }

    Rectangle {
        id: rectangleAI
        x: 485
        y: 133
        width: 147
        height: 57
        color: "#ffffff"
        radius: 8
        border.width: 4

        Text {
            id: text3
            x: 8
            y: 8
            width: 131
            height: 41
            color: "#008d1f"
            text: qsTr("VS")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 24

            MouseArea {
                id: mouseArea3
                x: 0
                y: 0
                width: 131
                height: 41
                onClicked: {
                    rectangleAI.visible = false
                    rectangleVS.visible = false
                    useAI = false
                }
            }
        }
    }
    property int tura: 1
    property variant plansza: [0,0,0, 0,0,0, 0,0,0]
    property bool  useAI: true
    property int ruchy: 0
    property bool koniec: false
    function changePlayer() {
        sprawdz();
        console.log("changePlayer() lastplayer:"+tura)
        ruchy++
        if (ruchy == 9) koniec = true
        if (tura == 1) tura = 2; else tura = 1;

        console.log("ruchy"+ruchy+"koniec"+koniec)
        if (useAI && !koniec && tura==2) {ruchAI();}

    }
    function sprawdz() {
        console.log("sprawdz")
        if (!koniec) {
            if (check()) {
                console.log("checked() "+tura)
                logPlansza()
                lockmouse()
                tura+=2
            }
        }
    }

    function check() {
        console.log("check")
        if (    ((plansza[0] === plansza[1] && plansza[1] === plansza[2]) && plansza[2] != 0) ||
                ((plansza[3] === plansza[4] && plansza[4] === plansza[5]) && plansza[5] != 0) ||
                ((plansza[6] === plansza[7] && plansza[7] === plansza[8]) && plansza[8] != 0) ||
                ((plansza[0] === plansza[3] && plansza[3] === plansza[6]) && plansza[6] != 0) ||
                ((plansza[1] === plansza[4] && plansza[4] === plansza[7]) && plansza[7] != 0) ||
                ((plansza[2] === plansza[5] && plansza[5] === plansza[8]) && plansza[8] != 0) ||
                ((plansza[0] === plansza[4] && plansza[4] === plansza[8]) && plansza[8] != 0) ||
                ((plansza[2] === plansza[4] && plansza[4] === plansza[6]) && plansza[6] != 0))
        {
            console.log("passed")
            koniec=true;
            return true;
        } else return false;
    }
    function lockmouse() {
        field1.mA1.enabled = false
        field2.mA1.enabled = false
        field3.mA1.enabled = false
        field4.mA1.enabled = false
        field5.mA1.enabled = false
        field6.mA1.enabled = false
        field7.mA1.enabled = false
        field8.mA1.enabled = false
        field9.mA1.enabled = false
    }
    function reset() {
        field1.change(0)
        field2.change(0)
        field3.change(0)
        field4.change(0)
        field5.change(0)
        field6.change(0)
        field7.change(0)
        field8.change(0)
        field9.change(0)
        resetPlansza()
        rectangleAI.visible = true
        rectangleVS.visible = true
        tura = 1
        koniec = false
        ruchy = 0
    }
    property bool momentumAI: false
    function ruchAI() {
        console.log("ruchAI()")
        obronaatakAI()
        randomAI()
        momentumAI = false
        logPlansza();
        changePlayer()
    } //AI ma zawsze turę nr 2
    property bool pusta: false
    property int pole: 0
    function obronaatakAI() {
        if (!momentumAI) {
            for (var k=2; k>=1; k--) {
                if (k==1)
                    console.log("trying obronaAI()")
                    if (momentumAI) console.log("obronaAI() not passed, AI has already perfored a movein this turn")
                else if (k==2)
                    console.log("trying atakAI()")
                for (var i=0; i<3; i++) { //OOp poziom
                    for (var j=0; j<3; j++) {
                        if (((plansza[(0+j)%3+3*i] === plansza[(1+j)%3+3*i] && plansza[(1+j)%3+3*i] == k) && plansza[(2+j)%3+3*i] == 0) && !momentumAI) {
                            console.log("poziom " + (i+1) + " offset "+ j)
                            setFieldValue((2+j)%3+3*i,tura)
                            momentumAI = true
                        }
                    }
                }
                for (var i=0; i<3; i++) {
                    for (var j=0; j<9; j+=3) { //OOp pion
                        if (((plansza[(i+j)%9] === plansza[(i+3+j)%9] && plansza[(i+3+j)%9] == k) && plansza[(i+6+j)%9] == 0) && !momentumAI) {
                            console.log("pion " + (i+1) + " offset "+ j)
                            setFieldValue((i+6+j)%9,tura)
                            momentumAI = true
                        }
                    }
                }
                for (var i=0; i<=8; i+=4) {
                    if (((plansza[(0+i)%12] === plansza[(4+i)%12] && plansza[(4+i)%12] == k) && plansza[(8+i)%12] == 0) && !momentumAI) {
                        console.log("ukos długi, offset "+ (i/4))
                        setFieldValue((8+i)%12,tura)
                        momentumAI = true
                    }
                }
                for (var i=0; i<=4; i+=2) {
                    if (((plansza[2+(i+0)%6] === plansza[2+(i+2)%6] && plansza[2+(i+2)%6] == k) && plansza[2+(i+4)%6] == 0) && !momentumAI) {
                        console.log("ukos krótki, offset "+ (i/2))
                        setFieldValue(2+(i+4)%6,tura)
                        momentumAI = true
                    }
                }
            }
        }
    }

    function randomAI() {
        if (!momentumAI) {
            console.log("randomAI()")
            pusta = false;
            while (!pusta) {
                pole = Math.floor(Math.random()*9)
                console.log("wybrano"+pole)
                if (plansza[pole] == 0) pusta =  true; else pusta = false;
            }
            setFieldValue(pole,tura)
            momentumAI = true
        }
    }
    function setFieldValue(pole,tura) {
        console.log("sestFieldValue ")
        plansza[pole]=tura;
        switch (pole) {
        case 0: {field1.change(tura); break;}
        case 1: {field2.change(tura); break;}
        case 2: {field3.change(tura); break;}
        case 3: {field4.change(tura); break;}
        case 4: {field5.change(tura); break;}
        case 5: {field6.change(tura); break;}
        case 6: {field7.change(tura); break;}
        case 7: {field8.change(tura); break;}
        case 8: {field9.change(tura); break;}
        }
    }
    function logPlansza() {
        for (var i=0; i<9; i++) {
            console.log(""+(i+1)+" "+plansza[i])
        }
    }
    function resetPlansza() {
        for (var i=0; i<9; i++) {
            plansza[i]=0
        }
    }
}
