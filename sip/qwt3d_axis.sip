// The SIP interface definition for:
// - class Axis
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


class Axis: Drawable
{

%TypeHeaderCode
#include <qwt3d_axis.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    Axis();
    Axis(Triple, Triple);
    virtual ~Axis();
    
    virtual void draw();

    void setPosition(const Triple &, const Triple &);
    void position(Triple &, Triple &) const;
    Triple begin() const;
    Triple end() const;
    double length() const;

    void setTicLength(double, double);
    void ticLength(double &, double &);
    void setTicOrientation(double, double, double);
    void setTicOrientation(const Triple &);
    Triple ticOrientation() const;
    void setSymmetricTics(bool);

    void setLabelFont(const QString &, int, int = QFont::Normal, bool = false);
    void setLabelFont(const QFont);
    const QFont & labelFont() const;

    void setLabelString(const QString &);
    void setLabelPosition(const Triple &, ANCHOR);
    void setLabelColor(RGBA);
    void setLabel(bool);
    void adjustLabel(int);
    void setScaling(bool);
    bool scaling() const;
    void setScale(SCALETYPE);
    void setScale(Scale *);
    void setNumbers(bool);
    bool numbers() const;
    void setNumberColor(RGBA);
    RGBA numberColor() const;
    void setNumberFont(
        const QString &, int, int = QFont::Normal, bool = false);
    void setNumberFont(const QFont &);
    const QFont & numberFont() const;
    void setNumberAnchor(ANCHOR);
    void adjustNumbers(int);

    void setAutoScale(bool = true);
    bool autoScale() const;

    void setMajors(int);
    void setMinors(int);
    int majors() const;
    int minors() const;

    const TripleField & majorPositions() const;
    const TripleField & minorPositions() const;

    void setLineWidth(double, double = 0.9, double = 0.5);
    double lineWidth() const;
    double majLineWidth() const;
    double minLineWidth() const;

    void setLimits(double, double);
    void limits(double &, double &) const;

    void recalculateTics();

}; // class Axis


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
