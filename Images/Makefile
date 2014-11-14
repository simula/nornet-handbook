# Thomas Dreibholz's LaTeX Toolchain
# Copyright (C) 2007-2011 by Thomas Dreibholz, dreibh@iem.uni-due.de
#
# $Id: Makefile 3352 2011-11-04 16:09:02Z dreibh $
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
# Contact: dreibh@iem.uni-due.de

pdf-from-png  := $(patsubst Original/%.png,PDF/%.pdf,$(wildcard Original/*.png))
pdf-from-gif  := $(patsubst Original/%.gif,PDF/%.pdf,$(wildcard Original/*.gif))
pdf-from-jpeg := $(patsubst Original/%.jpeg,PDF/%.pdf,$(wildcard Original/*.jpeg))


all:   $(pdf-from-png) $(pdf-from-gif) $(pdf-from-jpeg)


$(pdf-from-png):	PDF/%.pdf: Original/%.png
	./image2pdf $< $@

$(pdf-from-gif):	PDF/%.pdf: Original/%.gif
	./image2pdf $< $@

$(pdf-from-jpeg):	PDF/%.pdf: Original/%.jpeg
	./image2pdf $< $@


clean:
	rm -f PDF/*

distclean:	clean
