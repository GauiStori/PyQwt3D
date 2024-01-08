// The SIP interface definition for:
// - class CrossHair
// - class Dot
// - class Cone
// - class Arrow
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


class CrossHair: VertexEnrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
#include <qwt3d_enrichment_std.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    CrossHair();
    CrossHair(double, double, bool, bool);

    Enrichment * clone() const;

    void configure(double, double, bool, bool);
    void drawBegin();
    void drawEnd();
    void draw(const Triple &);

}; // class CrossHair


class Dot: VertexEnrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
#include <qwt3d_enrichment_std.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    Dot();
    Dot(double, bool);

    Enrichment * clone() const;

    void configure(double, bool);
    void drawBegin();
    void drawEnd();
    void draw(const Triple &);

}; // class Dot


class Cone: VertexEnrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
#include <qwt3d_enrichment_std.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    Cone();
    Cone(double, unsigned);
    ~Cone();

    Enrichment * clone() const;
    
    void configure(double, unsigned);
    void draw(const Triple &);

}; // class Cone


class Arrow: VertexEnrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
#include <qwt3d_enrichment_std.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    Arrow();
    ~Arrow();
 
    Enrichment * clone() const;

    void configure(int, double, double, double);
    void setQuality(int);
    void draw(const Triple &);
    
    void setTop(Triple);
    void setColor(RGBA);

}; // class Arrow


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
