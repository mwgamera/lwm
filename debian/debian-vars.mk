#!/usr/bin/make -f
#
#   debian-vars.mk -- Common variables
#
#   Copyright
#
#	Copyright (C) 2005-2010 Jari Aalto <jari.aalto@cante.net>
#
#   License
#
#       This program is free software; you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation; either version 2 of the License, or
#       (at your option) any later version.
#
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#       GNU General Public License for more details.
#
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#   Description
#
#	This is GNU makefile part that defines common variables and
#	macros to be used from debian/rules. To install, add following
#	to the beginning of debian/rules:
#
#	    PACKAGE = foo
#	    include debian/debian-vars.mk

ifneq (,)
    This makefile requires GNU Make.
endif

PACKAGE		?= foo
PIXPACKAGE	?= $(PACKAGE)
ICONPACKAGE	?= $(PACKAGE)
TOPDIR		:= $(shell pwd)
PKGDIR		= $(shell pwd)/debian/$(PACKAGE)

SHAREROOTDIR	= $(PKGDIR)/usr/share
SHAREDIR	= $(SHAREROOTDIR)/$(PACKAGE)
DOCROOTDIR	= $(SHAREROOTDIR)/doc
PKGDOCDIR	= $(DOCROOTDIR)/$(PACKAGE)
SITELISPDIR	= $(SHAREROOTDIR)/emacs/site-lisp
PKGLISPDIR	= $(SITELISPDIR)/$(PACKAGE)
DESKTOPDIR	= $(SHAREROOTDIR)/applications
XSESSIONDIR	= $(SHAREROOTDIR)/xsessions
LOCALEDIR	= $(SHAREROOTDIR)/locale
INFODIR		= $(SHAREROOTDIR)/info
PIXDIR		= $(SHAREROOTDIR)/pixmaps
PKGPIXDIR	= $(PIXDIR)/$(PIXPACKAGE)
ICONDIR		= $(SHAREROOTDIR)/icons
PKGICONDIR	= $(ICONDIR)/$(ICONPACKAGE)

MANROOTDIR	= $(SHAREROOTDIR)/man
MAN1DIR		= $(MANROOTDIR)/man1
MAN5DIR		= $(MANROOTDIR)/man5
MAN7DIR		= $(MANROOTDIR)/man7
MAN8DIR		= $(MANROOTDIR)/man8

LIBROOTDIR	= $(PKGDIR)/usr/lib
LIBDIR		= $(LIBROOTDIR)/$(PACKAGE)
LIBPERLDIR	= $(LIBROOTDIR)/perl

BINDIR		= $(PKGDIR)/usr/bin
SBINDIR		= $(PKGDIR)/usr/sbin
GAMEBINDIR	= $(PKGDIR)/usr/games

INSTALL		?= /usr/bin/install
INSTALL_DIR	= $(INSTALL) -m 755 -d
INSTALL_DATA	= $(INSTALL) -p -m 644

# The difference is that "BIN" may contain binary strip option
INSTALL_SCRIPT	= $(INSTALL) -p -m 755
INSTALL_BIN	= $(INSTALL) -p -m 755

ifeq (,$(findstring nostrip,$(DEB_BUILD_OPTIONS)))
    INSTALL_BIN += -s
endif

# End of Makefile part
