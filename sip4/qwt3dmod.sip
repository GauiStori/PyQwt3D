// The SIP interface definition for the _Qwt3D module of PyQwt3D.
//
// Copyright (C) 2004-2008 Gerard Vermeulen
//
// This file is part of PyQwt3D.
//
// PyQwt3D is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// PyQwt3D is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with PyQwt3D; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
// In addition, as a special exception, Gerard Vermeulen gives permission
// to link PyQwt3D dynamically with non-free versions of Qt and PyQt,
// and to distribute PyQwt3D in this form, provided that equally powerful
// versions of Qt and PyQt have been released under the terms of the GNU
// General Public License.
//
// If PyQwt3D is dynamically linked with non-free versions of Qt and PyQt,
// PyQwt3D becomes a free plug-in for a non-free program.


%Include features.sip
%Include types.sip


%ModuleHeaderCode
#if PY_VERSION_HEX < 0x02050000 && !defined(PY_SSIZE_T_MIN)
typedef int Py_ssize_t;
#define PY_SSIZE_T_MAX INT_MAX
#define PY_SSIZE_T_MIN INT_MIN
#endif

#include <qwt3d_python.h>
%End

%PostInitialisationCode
#ifdef HAS_NUMARRAY
    qwt3d_import_numarray();
#endif
#ifdef HAS_NUMERIC
    qwt3d_import_numeric();
#endif
#ifdef HAS_NUMPY
    qwt3d_import_numpy();
#endif
%End

// automagically generated
%Include qwt3d_axisvector.sip
%Include qwt3d_cell.sip
%Include qwt3d_cellfield.sip
%Include qwt3d_colorvector.sip
%Include qwt3d_doublevector.sip
%Include qwt3d_freevectorfield.sip
%Include qwt3d_triplefield.sip

// blood, sweat and tears
%Include qwt3d_autoscaler.sip
%Include qwt3d_axis.sip
%Include qwt3d_color.sip
%Include qwt3d_colorlegend.sip
%Include qwt3d_coordsys.sip
%Include qwt3d_drawable.sip
%Include qwt3d_enrichment.sip
%Include qwt3d_enrichment_std.sip
%Include qwt3d_function.sip
%Include qwt3d_gridmapping.sip
%Include qwt3d_io.sip
%Include qwt3d_io_gl2ps.sip
%Include qwt3d_io_reader.sip
%Include qwt3d_label.sip
%Include qwt3d_mapping.sip
%Include qwt3d_openglhelper.sip
%Include qwt3d_parametricsurface.sip
%Include qwt3d_plot.sip
%Include qwt3d_portability.sip
%Include qwt3d_scale.sip
%Include qwt3d_surfaceplot.sip
%Include qwt3d_types.sip


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
