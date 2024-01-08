// The SIP interface definition for:
// - class Drawable
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


class Drawable
{

%TypeHeaderCode
#include <qwt3d_drawable.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:

%ConvertToSubClassCode
    // traverse the inheritance tree left->right and bottom->up.
    if (dynamic_cast<const Axis *>(sipCpp))
        sipClass = sipClass_Axis;
    else if (dynamic_cast<const ColorLegend *>(sipCpp))
        sipClass = sipClass_ColorLegend;
    else if (dynamic_cast<const CoordinateSystem *>(sipCpp))
        sipClass = sipClass_CoordinateSystem;
    else if (dynamic_cast<const Label *>(sipCpp))
        sipClass = sipClass_Label;
    else if (dynamic_cast<const Drawable *>(sipCpp))
        sipClass = sipClass_Drawable;
    else
        sipClass = 0;
%End

    virtual ~Drawable() = 0;

    virtual void draw();

    virtual void saveGLState();
    virtual void restoreGLState();

    void attach(Drawable *);
    void detach(Drawable *);
    void detachAll();

    virtual void setColor(double, double, double, double = 1);
    virtual void setColor(RGBA);
    Triple relativePosition(Triple);

protected:

    void Enable(GLenum, GLboolean);
    Triple ViewPort2World(Triple, bool * = 0);
    Triple World2ViewPort(Triple, bool * = 0);

}; // class Drawable


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
