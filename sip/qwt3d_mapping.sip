// The SIP interface definition for:
// - class Mapping
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


class Mapping
{

%TypeHeaderCode
#include <qwt3d_mapping.h>
#include <qwt3d_function.h>
#include <qwt3d_parametricsurface.h>
#include <qwt3d_gridmapping.h>
class PyFunction;
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
%ConvertToSubClassCode
    // traverse the inheritance tree left->right and bottom->up.
    if (dynamic_cast<const Function *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Function);
    else if (dynamic_cast<const ParametricSurface *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_ParametricSurface);
    else if (dynamic_cast<const GridMapping *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_GridMapping);
    else if (dynamic_cast<const Mapping *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Mapping);
    else
        sipClass = 0;
%End // ConvertToSubClassCode

    virtual ~Mapping();
    virtual QString name() const;

}; // class Mapping


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
