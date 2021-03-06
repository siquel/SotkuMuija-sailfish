/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import Sailfish.Silica 1.0


Page {
    id: page

    property string dataURL: "https://dl.dropboxusercontent.com/u/22171160/food.xml"

    property string filter: "[@name='1']"

    SilicaFlickable {

        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: "Asetukset"
                onClicked: pageStack.push(Qt.resolvedUrl("FoodSettings.qml"))
            }
        }

       XmlListModel {
            id: foodModel
            source: page.dataURL
            query: "/week/day"+filter

            XmlRole {
                name: "breakfast"
                query: "breakfast/string()"
            }

            XmlRole { name: "supper"; query: "supper/string()" }
            XmlRole { name: "dinner"; query: "dinner/string()" }
            XmlRole { name: "lunch"; query: "lunch/string()" }
            XmlRole { name: "name"; query: "@name/string()" }

            onStatusChanged: {
                if (status == XmlListModel.Error) {
                    console.log("ERROR! " + errorString())
                } else if (status == XmlListModel.Ready) {
                    console.log("JEEE!")
                }
            }
        }

       SilicaListView {
           id: foodView
           width: parent.width
           height: parent.height
           anchors.centerIn: parent

           header: PageHeader {
               title: "Leijona vittu"
           }

           model: foodModel

           // miltä tulis näyttää
           delegate: Item {
               height: labelType.height + 20
                visible: true

                Label {
                    id: labelType
                    font.pixelSize: Theme.fontSizeSmall
                    font.bold: false
                    text: model.breakfast

                    color: Theme.secondaryColor
                }

                Label {
                    id: foodType


                }

           }
       }
    }
}





