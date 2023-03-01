# GNU-Makefile for PyQwt3D
#
# There are at least two options to log the output of make:
#
# (1) Invoke make and tie stderr to stdout and redirect stdout to LOG.txt:
#       make all-static 2>&1 >LOG.txt
#     However, you do not see what is going on.
#
# (2) Use script to capture all screen output of make to LOG.txt:
#       script -c 'make all-static' LOG.txt
#     The script command appeared in 3.0BSD and is part of util-linux.
#
# Edit QWT3DOPTIONS first.

# To compile and link the QwtPlot3D sources statically into PyQwt3D.
QWT3DDIR := $(shell pwd)/qwtplot3d-0.2.7

# To compile and link the zlib sources statically into PyQwt3D.
ZLIBDIR := $(shell pwd)/zlib-1.2.3

# To compile and link the libpng sources statically into PyQwt3D.
PNGVER := 1.2.18
PNGDIR := $(shell pwd)/libpng-$(PNGVER)

# Edit QWT3DOPTIONS first (DarwinPorts install in /opt/local).
#QWT3DOPTIONS := -Q $(QWT3DDIR) -Z $(ZLIBDIR) -D HAVE_LIBPNG -l png
QWT3DOPTIONS := -Q $(QWT3DDIR) -D HAVE_ZLIB -l z -D HAVE_LIBPNG  -I /opt/local/include -L /opt/local/lib -l png

# Do not edit below this line, unless you know what you are doing.
JOBS := $(shell getconf _NPROCESSORS_ONLN)
UNAME := $(shell uname)

ifeq ($(UNAME),Linux)
JOBS := $(shell getconf _NPROCESSORS_ONLN)
endif

ifeq ($(UNAME),Darwin)
JOBS := $(shell sysctl -n hw.ncpu)
endif

.PHONY: dist qwtplot-0.2.7

# Build and link PyQwt3D including the local source tree of Qwt3D.
all: 3 4

debug: 3d 4d

trace: 3t 4t

3:
	cd configure \
	&& python configure.py -3 $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

4:
	cd configure \
	&& python configure.py -4 $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

3d:
	cd configure \
	&& python configure.py --debug $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

4d:
	cd configure \
	&& python configure.py --debug -4 $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

3t:
	cd configure \
	&& python configure.py --debug --trace -3 $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

4t:
	cd configure \
	&& python configure.py --debug --trace -4 $(QWT3DOPTIONS) -j $(JOBS) \
	&& $(MAKE) -j $(JOBS)

# Installation.
install-3: 3
	make -C configure install

install-4: 4
	make -C configure install

install: install-3 install-4

install-3d: 3d
	make -C configure install

install-4d: 4d
	make -C configure install

install-debug: install-3d install-4d

install-3t: 3t
	make -C configure install

install-4t: 4t
	make -C configure install

install-trace: install-3t install-4t

# QwtPlot3D code.
qwtplot3d-doc.zip:
	wget http://qwtplot3d.sourceforge.net/qwtplot3d-doc.zip

qwtplot3d-0.2.7.tgz:
	wget http://prdownloads.sourceforge.net/qwtplot3d/qwtplot3d-0.2.7.tgz

qwtplot3d-0.2.7: qwtplot3d-doc.zip qwtplot3d-0.2.7.tgz
	rm -rf qwtplot3d qwtplot3d-doc qwtplot3d-0.2.7
	(unzip qwtplot3d-doc.zip; mv qwtplot3d qwtplot3d-doc)
	(tar xfz qwtplot3d-0.2.7.tgz; mv qwtplot3d qwtplot3d-0.2.7)
	./unbieber.py qwtplot3d-0.2.7 .c .cpp .h
	patch -p0 --fuzz=10 -b -z .pyqwt3d <pyqwt3d-0.2.7.patch
	cp -r qwtplot3d-doc/doc/doxygenimages qwtplot3d-0.2.7/doc/doxygenimages
	(cd qwtplot3d-0.2.7/doc; \
         mv Doxyfile.doxygen Doxyfile.doxygen.in; \
	 egrep -iv '(c|v):' Doxyfile.doxygen.in >Doxyfile.doxygen; \
	 doxygen -u Doxyfile.doxygen; \
	 doxygen Doxyfile.doxygen)

LIBPNG_TAR_GZ := libpng-1.2.18-no-config.tar.gz

libpng-$(PNGVER)-no-config.tar.gz:
	wget http://prdownloads.sourceforge.net/libpng/$@

libpng: libpng-$(PNGVER)-no-config.tar.gz
	tar xfz $<

diff:
	./gendiff qwtplot3d-0.2.7 .pyqwt3d >pyqwt3d-0.2.7.patch

# PyQwt3D documentation.
doc:
	(cd Doc && make doc && make htdoc)

clean:
	rm -f *~ */*~ */*/*~

distclean: clean
	find . -name '.#*' -o -name '*.pyc' | xargs rm -f
	rm -rf configure/Makefile
	rm -rf configure/OpenGL_Qt3 configure/tmp-OpenGL_Qt3
	rm -rf configure/OpenGL_Qt4 configure/tmp-OpenGL_Qt4
	rm -rf configure/Qwt3D_Qt3 configure/tmp-Qwt3D_Qt3
	rm -rf configure/Qwt3D_Qt4 configure/tmp-Qwt3D_Qt4

dist: all distclean doc
	python setup.py sdist

# EOF
