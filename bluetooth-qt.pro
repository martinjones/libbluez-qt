!exists(bluemanager.h):system(qdbusxml2cpp -p bluemanager.h:bluemanager.cpp manager.xml)
!exists(blueadapter.h):system(qdbusxml2cpp -p blueadapter.h:blueadapter.cpp adapter.xml)
!exists(bluedevice.h):system(qdbusxml2cpp -p bluedevice.h:bluedevice.cpp -i devicetypes.h device.xml)
!exists(audio.h):system(qdbusxml2cpp -p audio.h:audio.cpp audio.xml)
!exists(audiosink.h):system(qdbusxml2cpp -p audiosink.h:audiosink.cpp audiosink.xml)
!exists(audiosource.h):system(qdbusxml2cpp -p audiosource.h:audiosource.cpp audiosrc.xml)
!exists(headset.h):system(qdbusxml2cpp -p headset.h:headset.cpp headset.xml)
include(obex/obex.pri)

VERSION+= 0.0.4

TEMPLATE = lib
TARGET = bluetooth-qt
QT += dbus
CONFIG += link_pkgconfig \
	debug
OTHER_FILES += bluetooth-qt.conf \
	manager.xml \
	device.xml \
	audiosrc.xml \
	audiosink.xml \
	adapter.xml \
	headset.xml
HEADERS += agentadaptor.h \
	bluemanager.h \
	bluedevice.h \
	blueadapter.h \
	audiosource.h \
	audiosink.h \
	headset.h \
	btprofiles.h \
	nearbydevicesmodel.h \
	bluetoothbaseagent.h \
	asyncagent.h \
	devicetypes.h \
    bluetoothdevice.h \
	bluetoothdevicemodel.h \
	audio.h
SOURCES += agentadaptor.cpp \
	bluemanager.cpp \
	bluedevice.cpp \
	blueadapter.cpp \
	audiosource.cpp \
	audiosink.cpp \
	headset.cpp \
	nearbydevicesmodel.cpp \
	bluetoothbaseagent.cpp \
	asyncagent.cpp \
    bluetoothdevice.cpp \
	bluetoothdevicemodel.cpp \
	audio.cpp

target.path = $$INSTALL_ROOT/usr/lib
headers.path = $$INSTALL_ROOT/usr/include/bluetooth-qt/
headers.files = $$HEADERS
INSTALLS += target \
	headers

CONFIG += create_pc create_prl
QMAKE_PKGCONFIG_DESCRIPTION = Qt Bluetooth Library
QMAKE_PKGCONFIG_INCDIR = $$headers.path
pkgconfig.path = $$INSTALL_ROOT/usr/lib/pkgconfig
pkgconfig.files = bluetooth-qt.pc

INSTALLS += pkgconfig

dbusfiles.path = $$INSTALL_ROOT/etc/dbus-1/system.d
dbusfiles.files = bluetooth-qt.conf

INSTALLS += dbusfiles
