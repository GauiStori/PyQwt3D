// The SIP interface definition for:
// - enum PLOTSTYLE
// - enum SHADINGSTYLE
// - enum COORDINATESTYLE
// - enum SCALETYPE
// - enum FLOORSTYLE
// - enum DATATYPE
// - enum AXIS
// - enum SIDE
// - enum ANCHOR
// - struct Tuple
// - struct Triple
// - struct ParallelEpiped
// - struct FreeVector
// - struct RGBA
// - function GL2Qt
// - function Qt2GL
// - class Data
// - class GridData
// - class CellData
// - function normalizedcross (FIXME: normalizedCross?)
// - function dotProduct
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


%ModuleHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %ModuleHeaderCode


enum PLOTSTYLE
{
    NOPLOT,
    WIREFRAME,
    HIDDENLINE,
    FILLED,
    FILLEDMESH,
    POINTS,
    USER,
}; // enum PLOTSTYLE


enum SHADINGSTYLE
{
    FLAT,
    GOURAUD,
}; // enum SHADINGSTYLE


enum COORDSTYLE
{
    NOCOORD,
    BOX,
    FRAME,
}; // enum COORDSTYLE


enum SCALETYPE
{
    LINEARSCALE,
    LOG10SCALE,
    USERSCALE,
}; // enum SCALETYPE


enum FLOORSTYLE
{
    NOFLOOR,
    FLOORISO,
    FLOORDATA,
}; // enum FLOORSTYLE


enum DATATYPE
{
    GRID,
    POLYGON,
}; // enum DATATYPE


enum AXIS
{
    X1 = X1,
    X2 = X2,
    X3 = X3,
    X4 = X4,
    Y1 = Y1,
    Y2 = Y2,
    Y3 = Y3,
    Y4 = Y4,
    Z1 = Z1,
    Z2 = Z2,
    Z3 = Z3,
    Z4 = Z4,
}; // enum AXIS


enum SIDE
{
    NOSIDEGRID = NOSIDEGRID,
    LEFT = LEFT,
    RIGHT = RIGHT,
    CEIL = CEIL,
    FLOOR = FLOOR,
    FRONT = FRONT,
    BACK = BACK,
}; // enum SIDE


enum ANCHOR
{
    BottomLeft,
    BottomRight,
    BottomCenter,
    TopLeft,
    TopRight,
    TopCenter,
    CenterLeft,
    CenterRight,
    Center
}; // enum ANCHOR


struct Tuple
{
%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End

    double x;
    double y;

    Tuple();
    Tuple(double, double);
}; // struct Tuple


struct Triple
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode


    double x;
    double y; 
    double z;

    Triple(double = 0, double = 0, double = 0);
    Triple & operator+=(Triple);
    Triple & operator-=(Triple);
    Triple & operator*=(double);
    Triple & operator/=(double);
    Triple& operator*=(Triple);
    bool operator!=(Triple) const;
    bool operator==(Triple) const;
    double length() const;
    void normalize();

    // Triple operator+(const Triple &, const Triple &);
    Triple __add__(const Triple &);
    // Triple operator-(const Triple &, const Triple &);
    Triple __sub__(const Triple &);
    // FIXME: Triple operator*(double, const Triple &);
    // Triple operator*(const Triple &, double);
    Triple __mul__(const Triple &);
    // Triple operator*(const Triple &, const Triple &);
    Triple __mul__(double);
    // FIXME: Triple operator/(double, const Triple &);
    // Triple operator/(const Triple &, double);
    Triple __div__(double);
}; // struct Triple


struct ParallelEpiped
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

    Triple minVertex;
    Triple maxVertex;

    ParallelEpiped();
    ParallelEpiped(Triple, Triple);
}; // struct ParallelEpiped


struct FreeVector
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

    Triple base;
    Triple top;

    FreeVector();
    FreeVector(Triple, Triple);
}; // struct FreeVector

// FIXME: templates

struct RGBA
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

    double r;
    double g;
    double b;
    double a;

    RGBA();
    RGBA(double, double, double, double = 1);
}; // struct RGBA


QColor GL2Qt(GLdouble, GLdouble, GLdouble);
RGBA Qt2GL(QColor);

//typedef double *Vertex;
//typedef std::vector<Vertex> DataRow;
//typedef std::vector<DataRow> DataMatrix;


class Data
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    DATATYPE datatype;

    Data();
    virtual ~Data();
    virtual void clear() = 0;
    virtual bool empty() const = 0;
    void setHull(const ParallelEpiped &);
    const ParallelEpiped & hull() const;

//protected:
//    Qwt3D::ParallelEpiped hull_p;
}; // class Data

class GridData: Data
{

%TypeHeaderCode
#include <qwt3d_types.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    //DataMatrix vertices;
    //DataMatrix normals;

    GridData();
    GridData(unsigned int, unsigned int);
    ~GridData();

    int columns() const;
    int rows() const;

    void clear();
    bool empty() const;
    void setSize(unsigned int, unsigned int);
    
    void setPeriodic(bool, bool);
    bool uperiodic() const;
    bool vperiodic() const;
}; // class GridData


class CellData: Data
{

%TypeHeaderCode
#include <qwt3d_types.h>
#include <sip_Qwt3DCellField.h>
#include <sip_Qwt3DTripleField.h>
using namespace Qwt3D;
%End // %TypeHeaderCode

public:
    CellField cells;
    TripleField nodes;
    TripleField normals;
    
    CellData();
    ~CellData();

    void clear();
    bool empty() const;

    const Triple & operator()(unsigned, unsigned);
%MethodCode
    sipRes = const_cast<Triple*>(&(sipCpp->operator()(a0, a1)));
%End
}; // class CellData


Triple normalizedcross(const Triple &, const Triple &);
double dotProduct(const Triple &, const Triple &);


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
