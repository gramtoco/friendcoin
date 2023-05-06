
Debian
====================
This directory contains files used to package frend/fren-qt
for Debian-based Linux systems. If you compile frend/fren-qt yourself, there are some useful files here.

## fren: URI support ##


fren-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install fren-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your fren-qt binary to `/usr/bin`
and the `../../share/pixmaps/fren128.png` to `/usr/share/pixmaps`

fren-qt.protocol (KDE)

