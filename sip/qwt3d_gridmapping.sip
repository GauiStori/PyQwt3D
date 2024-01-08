// The SIP interface definition for:
// - class GridMapping
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


class GridMapping: Mapping
{

%TypeHeaderCode
#include <qwt3d_gridmapping.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    GridMapping();

    void setMesh(unsigned int, unsigned int);
    void setDomain(double, double, double, double);
    void restrictRange(const ParallelEpiped &);

protected:
    //ParallelEpiped range_p;
    //SurfacePlot* plotwidget_p;
    //unsigned int umesh_p;
    //unsigned int vmesh_p;
    //double minu_p, maxu_p, minv_p, maxv_p;

}; // class GridMapping


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
