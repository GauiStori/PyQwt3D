// The SIP interface definition for:
// - class CoordinateSystem
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


class CoordinateSystem: Drawable
{

%TypeHeaderCode
#include <qwt3d_coordsys.h>
#include <sip_Qwt3DAxisVector.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    CoordinateSystem(
        Triple = Triple(0,0,0), Triple = Triple(0,0,0), COORDSTYLE = BOX);
    ~CoordinateSystem();

    void init(Triple = Triple(0,0,0), Triple = Triple(0,0,0));
    void setStyle(COORDSTYLE, AXIS = X1, AXIS = Y1, AXIS = Z1);
    COORDSTYLE style() const;
    void setPosition(Triple, Triple);

    void setAxesColor(RGBA);

    void setNumberFont(
        const QString &, int, int = QFont::Normal, bool = false);
    void setNumberFont(const QFont &);
    void setNumberColor(RGBA);
    void setStandardScale();

    void adjustNumbers(int);
    void adjustLabels(int);

    void setGridLinesColor(RGBA);

    void setLabelFont(const QString &, int, int = QFont::Normal, bool = false);
    void setLabelFont(const QFont &);
    void setLabelColor(RGBA);

    void setLineWidth(double, double = 0.9, double = 0.5);
    void setTicLength(double, double);

    void setAutoScale(bool = true);

    Triple first() const;
    Triple second() const;

    void setAutoDecoration(bool = true);
    bool autoDecoration() const;

    void setLineSmooth(bool = true);
    bool lineSmooth() const;

    void draw();

    void setGridLines(bool, bool, int = NOSIDEGRID);
    int grids() const;

    AxisVector axes;

}; // class CoordinateSystem


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
