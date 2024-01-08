// The SIP interface definition for:
// - class SurfacePlot
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


class SurfacePlot: Plot3D
{

%TypeHeaderCode
#include <qwt3d_surfaceplot.h>
using namespace Qwt3D;

#ifdef PYQWT3D_DEBUG
#include <iostream>
using namespace std;
#endif

%End // %TypeHeaderCode 

public:
%If (HAS_QT3)
    SurfacePlot(QWidget * /TransferThis/ = 0, const char * = 0);
%End // (HAS_QT3)
%If (HAS_QT4)
    SurfacePlot(QWidget * /TransferThis/ = 0, const QGLWidget * = 0);
%End // (HAS_QT4)
%If (HAS_QT5)
    SurfacePlot(QWidget * /TransferThis/ = 0, const QGLWidget * = 0);
%End // (HAS_QT5)
    ~SurfacePlot();
    void updateNormals();
    int resolution() const;


    SIP_PYTUPLE /*std::pair<int,int>*/ facets() const;
%MethodCode
    std::pair<int, int> result = sipCpp -> SurfacePlot::facets();

    sipRes = sipBuildResult(&sipIsErr, "(ii)", result.first, result.second);
%End


    bool loadFromData(SIP_PYOBJECT /* Triple** */,
                      /* unsigned int, unsigned int, */
                      bool = false, bool = false);
%MethodCode
    double *array;
    unsigned int nx;
    unsigned int ny;
    unsigned int nz;
    PyObject *out;

    if (-1 == try_PyObject_to_PyArrayContiguousFloat3D(
            a0, &out, &array, &nx, &ny, &nz))
        return 0;

    if (nz != 3) {
        PyErr_SetString(
            PyExc_ValueError, "expected is the third dimension == 3");

        return 0;
    }

    // MSVC-6.0 does not like: new (foo)[bar];
    Triple **data = new Triple * [nx];
    for (unsigned int i=0; i<nx; i++)
        data[i] = reinterpret_cast<Triple *>(
            &array[i*ny*sizeof(Triple)/sizeof(double)]);
    
    sipRes = sipCpp -> SurfacePlot::loadFromData(data, nx, ny, a1, a2);
    
    delete [] data;
    Py_DECREF(out);
%End


    bool loadFromData(SIP_PYOBJECT /* double** */,
                      /* unsigned int, unsigned int, */
                      double, double, double, double);
%MethodCode
    double *array;
    unsigned int nx;
    unsigned int ny;
    PyObject *out;

#ifndef PYQWT3D_DEBUG
    if (-1 == try_PyObject_to_PyArrayContiguousFloat2D(
            a0, &out, &array, &nx, &ny))
        return 0;

    // MSVC-6.0 does not like: new (foo)[bar];
    double **data = new double * [nx];
    for (unsigned int i=0; i<nx; i++)
        data[i] = &array[i*ny];
#else
    nx = 3;
    ny = 5;
    // MSVC-6.0 does not like: new (foo)[bar];
    array = new double [nx*ny];
    // MSVC-6.0 does not like: new (foo)[bar];
    double **data = new double * [nx];
    for (unsigned int i=0; i<nx; i++)
        data[i] = &array[i*ny];

    for (unsigned i=0; i<nx; i++)
        for (unsigned int j=0; j<ny; j++)
            data[i][j] = (-1.0+i*2.0/(nx-1))*(-1.0+j*2.0/(ny-1));

    cout << "Fake data (Numeric or numarray have been by-passed):" << endl;
    for (unsigned i=0; i<nx; i++) {
        cout << array[i*ny];
        for (unsigned int j=1; j<ny; j++)
            cout << ", " << array[i*ny+j];
        cout << endl;
    }
#endif

    sipRes = sipCpp -> SurfacePlot::loadFromData(data, nx, ny, a1, a2, a3, a4);

#ifndef PYQWT3D_DEBUG
    delete [] data;
    Py_DECREF(out);
#else
    delete [] data;
    delete [] array;
    cout << "Returning from Python wrapper code." << endl;
    cout << "When will we see the floating point exception?" << endl;
#endif
%End


    bool loadFromData(const TripleField &, const CellField &);
/*  -- deprecated --
    bool createDataRepresentation(Triple**, unsigned int, unsigned int,
                                  bool = false, bool = false);
    bool createDataRepresentation(double** data, unsigned int, unsigned int,
                                  double, double, double, double);
    bool createDataRepresentation(const TripleField &, const CellField &);
*/

    FLOORSTYLE floorStyle() const;
    void  setFloorStyle(FLOORSTYLE);
    void showNormals(bool);
    bool normals() const;
    void setNormalLength(double);
    double normalLength() const;
    void setNormalQuality(int);
    int normalQuality() const;

signals:
    void resolutionChanged(int);

public slots:
    void setResolution(int);

protected:
    //bool datanormals_p;
    //double normalLength_p;
    //int normalQuality_p;
    //int resolution_p;

    virtual void calculateHull();
    virtual void createData();
    virtual void createEnrichment(Enrichment &);
    virtual void createFloorData();
    // FIXME: void createNormals(); missing C++ code?
    void createPoints();

    
    void readIn(GridData &, SIP_PYOBJECT)
        [void (GridData &, Triple **, unsigned int, unsigned int)];
%MethodCode
    double *array;
    unsigned int nx;
    unsigned int ny;
    unsigned int nz;
    PyObject *out;

    if (-1 == try_PyObject_to_PyArrayContiguousFloat3D(
            a1, &out, &array, &nx, &ny, &nz))
        return 0;

    if (nz != 3) {
        PyErr_SetString(
            PyExc_ValueError, "expected is the third dimension == 3");

        return 0;
    }

    // MSVC-6.0 does not like: new (foo)[bar];
    Triple **data = new Triple * [nx];
    for (unsigned int i=0; i<nx; i++)
        data[i] = reinterpret_cast<Triple *>(
            &array[i*ny*sizeof(Triple)/sizeof(double)]);

    sipCpp -> sipProtect_readIn(*a0, data, nx, ny);

    delete [] data;
    Py_DECREF(out);
%End


void readIn(GridData &, SIP_PYOBJECT, double, double, double, double)
    [void (GridData &, double **, unsigned int, unsigned int,
           double, double, double, double)];
%MethodCode
    double *array;
    unsigned int nx;
    unsigned int ny;
    PyObject *out;

    if (-1 == try_PyObject_to_PyArrayContiguousFloat2D(
            a1, &out, &array, &nx, &ny))
        return 0;

    // MSVC-6.0 does not like: new (foo)[bar];
    double **data = new double * [nx];
    for (unsigned int i=0; i<nx; i++)
        data[i] = &array[i*ny];

    sipCpp -> sipProtect_readIn(*a0, data, nx, ny, a2, a3, a4, a5);

    delete [] data;
    Py_DECREF(out);
%End


    void calcNormals(GridData &);
    void sewPeriodic(GridData &);

}; // class SurfacePlot


// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
