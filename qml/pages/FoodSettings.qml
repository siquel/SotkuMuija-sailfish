import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: root
    SilicaListView {
        id: settingsView
        anchors.fill: parent

        width: ( parent.width - ( 2.0 * Theme.paddingLarge ))
        height: parent.height

        header: PageHeader {
            title: "Aika settings vittu"
        }

        model: ListModel {
            ListElement { key: "bf"; name: "Aamupala" }
            ListElement { key: "lunch"; name: "Lounas" }
            ListElement { key: "dinner"; name: "Päivällinen" }
        }

        delegate: ListItem {
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
                spacing:Theme.paddingSmall
                anchors.leftMargin: Theme.paddingLarge
                Label {
                    id: nameContainer
                    text: name
                    color: Theme.primaryColor
                }
                Label {
                    id: time
                    text: "value"
                    color: Theme.highlightColor

                }
            }
        }

    }
}
