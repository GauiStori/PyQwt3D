// The SIP interface definition for:
// - class Enrichment
// - class VertexEnrichment
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


class Enrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    enum TYPE {
        VERTEXENRICHMENT,
        EDGEENRICHMENT,
        FACEENRICHMENT,
        VOXELENRICHMENT,
    };

%ConvertToSubClassCode
    // traverse the inheritance tree left->right and bottom->up.
    if (dynamic_cast<const Arrow *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Arrow);
    else if (dynamic_cast<const Cone *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Cone);
    else if (dynamic_cast<const CrossHair *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_CrossHair);
    else if (dynamic_cast<const Dot *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Dot);
    else if (dynamic_cast<const VertexEnrichment *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_VertexEnrichment);
    else if (dynamic_cast<const Enrichment *>(sipCpp))
        sipClass = (sipWrapperType *) sipTypeAsPyTypeObject (sipType_Enrichment);
    else
        sipClass = 0;
%End

    Enrichment();
    virtual ~Enrichment();
    virtual Enrichment * clone() const = 0 /Factory/;
    virtual void drawBegin();
    virtual void drawEnd();
    virtual void assign(const Plot3D &);
    virtual TYPE type() const = 0;

public: // protected in QwtPlot3D, works because of a fake header
    const Plot3D *plot;

}; // class Enrichment


class VertexEnrichment: Enrichment
{

%TypeHeaderCode
#include <qwt3d_enrichment.h>
using namespace Qwt3D;
%End

public:
    VertexEnrichment();
    virtual Enrichment * clone() const = 0 /Factory/;
    virtual void draw(const Triple &) = 0;
    virtual TYPE type() const;

}; // class VertexEnrichment


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
