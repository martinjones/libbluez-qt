system(qdbusxml2cpp -p bluemanager.h:bluemanager.cpp manager.xml)
system(qdbusxml2cpp -p blueadapter.h:blueadapter.cpp adapter.xml)
system(qdbusxml2cpp -p bluedevice.h:bluedevice.cpp -i devicetypes.h device.xml)
system(qdbusxml2cpp -p audio.h:audio.cpp audio.xml)
system(qdbusxml2cpp -p audiosink.h:audiosink.cpp audiosink.xml)
system(qdbusxml2cpp -p audiosource.h:audiosource.cpp audiosrc.xml)
system(qdbusxml2cpp -p headset.h:headset.cpp headset.xml)
system(qdbusxml2cpp -p input.h:input.cpp input.xml)
include(obex/obex.pri)

VERSION+= 0.0.9

TEMPLATE = lib
TARGET = bluez-qt
QT += dbus
CONFIG += link_pkgconfig \
	debug
OTHER_FILES += bluez-qt.conf \
	manager.xml \
	device.xml \
	audiosrc.xml \
	audiosink.xml \
	adapter.xml \
	headset.xml \
    input.xml
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
	audio.h \
	input.h
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
	audio.cpp \
	input.cpp

target.path = $$INSTALL_ROOT/usr/lib
headers.path = $$INSTALL_ROOT/usr/include/bluez-qt/
headers.files = $$HEADERS
INSTALLS += target \
	headers

CONFIG += create_pc create_prl
QMAKE_PKGCONFIG_DESCRIPTION = Bluez Qt Bindings Library
QMAKE_PKGCONFIG_INCDIR = $$headers.path
pkgconfig.path = $$INSTALL_ROOT/usr/lib/pkgconfig
pkgconfig.files = bluez-qt.pc

INSTALLS += pkgconfig

dbusfiles.path = $$INSTALL_ROOT/etc/dbus-1/system.d
dbusfiles.files = bluez-qt.conf

INSTALLS += dbusfiles
