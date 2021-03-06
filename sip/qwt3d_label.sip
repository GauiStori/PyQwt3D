// The SIP interface definition for:
// - class Label
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


class Label: Drawable
{

%TypeHeaderCode
#include <qwt3d_label.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    Label();
    Label(const QString &, int, int = QFont::Normal, bool = false);

    void setFont(const QString &, int, int = QFont::Normal, bool = false);

    void adjust(int);
    double gap() const;

    void setPosition(Triple, ANCHOR = BottomLeft);
    void setRelPosition(Tuple, ANCHOR);
    Triple first() const;
    Triple second() const;
    ANCHOR anchor() const;
    virtual void setColor(double, double, double, double = 1);
    virtual void setColor(RGBA);

    void setString(const QString &);
    void draw();

    static void useDeviceFonts(bool);

}; // class Label


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
