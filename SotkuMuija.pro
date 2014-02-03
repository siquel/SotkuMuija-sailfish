# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = SotkuMuija

CONFIG += sailfishapp

SOURCES += src/SotkuMuija.cpp

OTHER_FILES += qml/SotkuMuija.qml \
    qml/cover/CoverPage.qml \
    rpm/SotkuMuija.spec \
    rpm/SotkuMuija.yaml \
    SotkuMuija.desktop \
    qml/pages/TjPage.qml \
    qml/pages/FoodPage.qml \
    qml/pages/FoodSettings.qml

