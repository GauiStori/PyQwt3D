# This is the build script for the PyQwt3D Python bindings.
#
# Copyright (c) 2023 Riverbank Computing Limited <info@riverbankcomputing.com>
# 
# This file is part of PyQwt3D.
# 
# This file may be used under the terms of the GNU General Public License
# version 3.0 as published by the Free Software Foundation and appearing in
# the file LICENSE included in the packaging of this file.  Please review the
# following information to ensure the GNU General Public License version 3.0
# requirements will be met: http://www.gnu.org/copyleft/gpl.html.
# 
# If you do not wish to use this file under the terms of the GPL version 3.0
# then you may purchase a commercial license.  For more information contact
# info@riverbankcomputing.com.
# 
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


import os

from pyqtbuild import PyQtBindings, PyQtProject
from sipbuild import Option


class QwtPlot3DProject(PyQtProject):
    """ The QwtPlot3D project. """

    def __init__(self):
        """ Initialise the project. """

        super().__init__()

        self.bindings_factories = [PyQwt3DBindings]

        # If there is a 'src' subdirectory then we are part of an sdist rather
        # than a full source distribution.  If part of an sdist then the
        # QwtPlot3D source is compiled along with the bindings.  Otherwise an
        # external (ie. already built) QwtPlot3D library is used (which may be
        # static or dynamic).
        self.pyqwt3d_external_lib = not os.path.isdir('src')

    def apply_user_defaults(self, tool):
        """ Set default values for user options that haven't been set yet. """

        super().apply_user_defaults(tool)

        #if not self.qsci_external_lib:
        #    # If a directory to install the .api files was given then add the
        #    # bundled .api files as well.
        #    if self.api_dir:
        #        self.wheel_includes.append(
        #                ('qsci/api/python/*.api', self.api_dir))

        #if self.qsci_translations_dir:
        #    self.wheel_includes.append(
        #            ('src/*.qm', self.qsci_translations_dir))

    def get_options(self):
        """ Return the list of configurable options. """

        options = super().get_options()

        # The directory within the wheel to install the translation files to.
        #options.append(
        #        Option('qsci_translations_dir',
        #                help="the QwtPlot3D translation files will be installed in DIR",
        #                metavar="DIR", tools=['wheel']))

        return options


class PyQwt3DBindings(PyQtBindings):
    """ The PyQwt3D bindings. """

    def __init__(self, project):
        """ Initialise the bindings. """

        if project.pyqwt3d_external_lib:
            qmake_CONFIG = ['qwtplot3d']
        else:
            qmake_CONFIG = []

        super().__init__(project, 'QwtPlot3D', qmake_CONFIG=qmake_CONFIG)

    def apply_user_defaults(self, tool):
        """ Set default values for user options that haven't been set yet. """

        project = self.project
        qt6 = (project.builder.qt_version >= 0x060000)

        # Set the name of the .sip file now that we know the Qt version number.
        self.sip_file = 'Qwt3D_Qt6_Module.sip' if qt6 else 'Qwt3D_Qt5_Module.sip'

        #if self.project.pyqwt3d_external_lib:
        #if self.pyqwt3d_features_dir is not None:
        #    os.environ['QMAKEFEATURES'] = os.path.abspath(
        #            self.pyqwt3d_features_dir)

        if self.qwtplot3d_include_dir is not None:
            self.include_dirs.append(
                    os.path.abspath(self.qwtplot3d_include_dir))
        self.include_dirs.append(
                    os.path.abspath("/usr/include/qwtplot3d"))
        #if self.qwtplot3d_library_dir is not None:
        #    self.library_dirs.append(
        #            os.path.abspath(self.qwtplot3d_library_dir))
        #else:
        # We configure CONFIG and QT textually because it's too late to
        # update qmake_CONFIG and qmake_QT.
        self.builder_settings.append('QT += widgets')

        #if project.py_platform != 'ios':
        #    self.builder_settings.append('QT += printsupport')

        #if project.py_platform in ('darwin', 'ios') and not qt6:
        #    self.builder_settings.append('QT += macextras')

        self.builder_settings.append(
                'CONFIG += warn_off thread exceptions')

        #self.define_macros.extend(
        #        ['SCINTILLA_QT', 'SCI_LEXER',
        #            'INCLUDE_DEPRECATED_FEATURES'])

        if self.qwtplot3d_include_dir is not None:
            self.include_dirs.append(self.qwtplot3d_include_dir)
        #if self.qwt_featuresdir is not None:
        #    os.environ['QMAKEFEATURES'] = abspath(self.qwt_features_dir)
        if self.qwtplot3d_library_dir is not None:
            self.library_dirs.append(self.qwtplot3d_library_dir)
        if self.qwtplot3d_library is not None:
            self.libraries.append(self.qwtplot3d_library)

        self.include_dirs.append("include")
        self.include_dirs.append("numpy")

        self._add_internal_lib_sources()

        super().apply_user_defaults(tool)

    def get_options(self):
        """ Return the list of configurable options. """

        options = super().get_options()

        #if self.project.pyqwt3d_external_lib:
            # The directory containing the features file.
            #options.append(
            #        Option('qsci_features_dir',
            #                help="the qscintilla2.prf features file is in DIR",
            #                metavar="DIR"))

            # The directory containing the include directory.
        options.append(
                Option('qwtplot3d_include_dir',
                        help="the QwtPlot3D include file directory is in DIR",
                        metavar="DIR"))

        # The directory containing the library.
        options.append(
                Option('qwtplot3d_library_dir',
                        help="the QwtPlot3D library is in DIR",
                        metavar="DIR"))

        # The library.
        options.append(
                Option('qwtplot3d_library',
                        help="the QwtPlot3D library",
                        metavar="LIB"))

        return options

    def handle_test_output(self, test_output):
        """ Handle the output from the external test program and return True if
        the bindings are buildable.
        """

        project = self.project

        installed_version = int(test_output[0])
        installed_version_str = test_output[1]

        if project.version != installed_version:
            project.progress(
                    "QwtPlot3D v{0} is required but QwtPlot3D v{1} is "
                    "installed.".format(project.version_str,
                            installed_version_str))
            return False

        return True

    def is_buildable(self):
        """ Return True if the bindings are buildable. """

        # We need to check the compatibility of an external QwtPlot3D library.
        if self.project.pyqwt3d_external_lib:
            return super().is_buildable()

        return True

    def _add_dir_sources(self, dname):
        """ Add the headers and sources from a particular directory. """

        for fn in os.listdir(dname):
            # Skip the printer support on iOS.
            if self.project.py_platform == 'ios' and fn.startswith('pyqwt3dprinter.'):
                continue

            if fn.endswith('.h'):
                self.headers.append(os.path.join(dname, fn))
            elif fn.endswith('.cpp'):
                self.sources.append(os.path.join(dname, fn))

    def _add_internal_lib_sources(self):
        """ Add to the lists of include directories, header files and source
        files to build the QwtPlot3D library.
        """

        include_dirs = []

        #for dn in ('include', 'lexers', 'lexlib', 'src'):
        #    include_dirs.append(os.path.join('scintilla', dn))

        self._add_dir_sources('numpy')
        self._add_dir_sources('include')

        #for dn in include_dirs:
        #    self._add_dir_sources(dn)

        self.include_dirs.extend(include_dirs)
