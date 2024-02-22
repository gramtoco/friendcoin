
Debian
====================
This directory contains files used to package pejecoind/pejecoin-qt
for Debian-based Linux systems. If you compile pejecoind/pejecoin-qt yourself, there are some useful files here.

## pejecoin: URI support ##


pejecoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install pejecoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your pejecoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/peje128.png` to `/usr/share/pixmaps`

pejecoin-qt.protocol (KDE)

