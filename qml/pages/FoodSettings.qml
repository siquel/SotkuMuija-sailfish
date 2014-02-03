import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: root
    anchors.top: parent.top
    SilicaListView {
        id: settingsView

        anchors.fill: parent

        width: parent.width
        height: parent.height

        header: PageHeader {
            title: "Aika settings vittu"
        }

        model: ListModel {
            ListElement { key: "bf"; name: "Aamupala" }
            ListElement { key: "lunch"; name: "Lounas" }
            ListElement { key: "dinner"; name: "Päivällinen" }
            ListElement { key: "supper"; name: "Iltapala" }
        }

        delegate: BackgroundItem {
            width: ListView.view.width
            height: Theme.itemSizeSmall
            onClicked: {
                var dialog = pageStack.push("Sailfish.Silica.TimePickerDialog", {
                    hour: 13,
                    minute: 30,
                    hourMode: DateTime.TwentyFourHours
                })
                dialog.accepted.connect(function() {
                    time.text = dialog.timeText
                })
            }

            Row {
                x: Theme.paddingLarge
                spacing: Theme.paddingSmall
                height: Theme.itemSizeSmall

                Label {
                    height: parent.height
                    id: nameContainer
                    text: name
                    color: Theme.primaryColor
                    font.pixelSize: Theme.fontSizeSmall
                    verticalAlignment: Text.AlignVCenter

                }

                Label {
                    height: parent.height
                    id: time
                    text: "value"
                    color: Theme.highlightColor
                    font.pixelSize: Theme.fontSizeSmall
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

    }
}
