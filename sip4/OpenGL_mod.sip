// The SIP interface definition for the OpenGL module of PyQwt3D.
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


typedef unsigned int    GLenum;
typedef unsigned char   GLboolean;
typedef unsigned int    GLbitfield;
typedef void            GLvoid;
typedef /*signed*/ char GLbyte;         /* 1-byte signed */
typedef short           GLshort;        /* 2-byte signed */
typedef int             GLint;          /* 4-byte signed */
typedef unsigned char   GLubyte;        /* 1-byte unsigned */
typedef unsigned short  GLushort;       /* 2-byte unsigned */
typedef unsigned int    GLuint;         /* 4-byte unsigned */
typedef int             GLsizei;        /* 4-byte signed */
typedef float           GLfloat;        /* single precision float */
typedef float           GLclampf;       /* single precision float in [0,1] */
typedef double          GLdouble;       /* double precision float */
typedef double          GLclampd;       /* double precision float in [0,1] */


%ModuleHeaderCode
#if defined(_WIN32)
#include <windows.h>
#endif
#if defined(__APPLE__)
#include <OpenGL/gl.h>
#else
#include <GL/gl.h>
#endif
%End // %ModuleHeaderCode

/* Boolean values */
const int GL_FALSE; // 0x0
const int GL_TRUE; // 0x1

/* Data types */
const int GL_BYTE;
const int GL_UNSIGNED_BYTE;
const int GL_SHORT;
const int GL_UNSIGNED_SHORT;
const int GL_INT;
const int GL_UNSIGNED_INT;
const int GL_FLOAT;
const int GL_2_BYTES;
const int GL_3_BYTES;
const int GL_4_BYTES;
const int GL_DOUBLE;

/* Primitives */
const int GL_POINTS;
const int GL_LINES;
const int GL_LINE_LOOP;
const int GL_LINE_STRIP;
const int GL_TRIANGLES;
const int GL_TRIANGLE_STRIP;
const int GL_TRIANGLE_FAN;
const int GL_QUADS;
const int GL_QUAD_STRIP;
const int GL_POLYGON;

/* Vertex Arrays */
const int GL_VERTEX_ARRAY;
const int GL_NORMAL_ARRAY;
const int GL_COLOR_ARRAY;
const int GL_INDEX_ARRAY;
const int GL_TEXTURE_COORD_ARRAY;
const int GL_EDGE_FLAG_ARRAY;
const int GL_VERTEX_ARRAY_SIZE;
const int GL_VERTEX_ARRAY_TYPE;
const int GL_VERTEX_ARRAY_STRIDE;
const int GL_NORMAL_ARRAY_TYPE;
const int GL_NORMAL_ARRAY_STRIDE;
const int GL_COLOR_ARRAY_SIZE;
const int GL_COLOR_ARRAY_TYPE;
const int GL_COLOR_ARRAY_STRIDE;
const int GL_INDEX_ARRAY_TYPE;
const int GL_INDEX_ARRAY_STRIDE;
const int GL_TEXTURE_COORD_ARRAY_SIZE;
const int GL_TEXTURE_COORD_ARRAY_TYPE;
const int GL_TEXTURE_COORD_ARRAY_STRIDE;
const int GL_EDGE_FLAG_ARRAY_STRIDE;
const int GL_VERTEX_ARRAY_POINTER;
const int GL_NORMAL_ARRAY_POINTER;
const int GL_COLOR_ARRAY_POINTER;
const int GL_INDEX_ARRAY_POINTER;
const int GL_TEXTURE_COORD_ARRAY_POINTER;
const int GL_EDGE_FLAG_ARRAY_POINTER;
const int GL_V2F;
const int GL_V3F;
const int GL_C4UB_V2F;
const int GL_C4UB_V3F;
const int GL_C3F_V3F;
const int GL_N3F_V3F;
const int GL_C4F_N3F_V3F;
const int GL_T2F_V3F;
const int GL_T4F_V4F;
const int GL_T2F_C4UB_V3F;
const int GL_T2F_C3F_V3F;
const int GL_T2F_N3F_V3F;
const int GL_T2F_C4F_N3F_V3F;
const int GL_T4F_C4F_N3F_V4F;

/* Matrix Mode */
const int GL_MATRIX_MODE;
const int GL_MODELVIEW;
const int GL_PROJECTION;
const int GL_TEXTURE;

/* Points */
const int GL_POINT_SMOOTH;
const int GL_POINT_SIZE;
const int GL_POINT_SIZE_GRANULARITY;
const int GL_POINT_SIZE_RANGE;

/* Lines */
const int GL_LINE_SMOOTH;
const int GL_LINE_STIPPLE;
const int GL_LINE_STIPPLE_PATTERN;
const int GL_LINE_STIPPLE_REPEAT;
const int GL_LINE_WIDTH;
const int GL_LINE_WIDTH_GRANULARITY;
const int GL_LINE_WIDTH_RANGE;

/* Polygons */
const int GL_POINT;
const int GL_LINE;
const int GL_FILL;
const int GL_CW;
const int GL_CCW;
const int GL_FRONT;
const int GL_BACK;
const int GL_POLYGON_MODE;
const int GL_POLYGON_SMOOTH;
const int GL_POLYGON_STIPPLE;
const int GL_EDGE_FLAG;
const int GL_CULL_FACE;
const int GL_CULL_FACE_MODE;
const int GL_FRONT_FACE;
const int GL_POLYGON_OFFSET_FACTOR;
const int GL_POLYGON_OFFSET_UNITS;
const int GL_POLYGON_OFFSET_POINT;
const int GL_POLYGON_OFFSET_LINE;
const int GL_POLYGON_OFFSET_FILL;

/* Display Lists */
const int GL_COMPILE;
const int GL_COMPILE_AND_EXECUTE;
const int GL_LIST_BASE;
const int GL_LIST_INDEX;
const int GL_LIST_MODE;

/* Depth buffer */
const int GL_NEVER;
const int GL_LESS;
const int GL_EQUAL;
const int GL_LEQUAL;
const int GL_GREATER;
const int GL_NOTEQUAL;
const int GL_GEQUAL;
const int GL_ALWAYS;
const int GL_DEPTH_TEST;
const int GL_DEPTH_BITS;
const int GL_DEPTH_CLEAR_VALUE;
const int GL_DEPTH_FUNC;
const int GL_DEPTH_RANGE;
const int GL_DEPTH_WRITEMASK;
const int GL_DEPTH_COMPONENT;

/* Lighting */
const int GL_LIGHTING;
const int GL_LIGHT0;
const int GL_LIGHT1;
const int GL_LIGHT2;
const int GL_LIGHT3;
const int GL_LIGHT4;
const int GL_LIGHT5;
const int GL_LIGHT6;
const int GL_LIGHT7;
const int GL_SPOT_EXPONENT;
const int GL_SPOT_CUTOFF;
const int GL_CONSTANT_ATTENUATION;
const int GL_LINEAR_ATTENUATION;
const int GL_QUADRATIC_ATTENUATION;
const int GL_AMBIENT;
const int GL_DIFFUSE;
const int GL_SPECULAR;
const int GL_SHININESS;
const int GL_EMISSION;
const int GL_POSITION;
const int GL_SPOT_DIRECTION;
const int GL_AMBIENT_AND_DIFFUSE;
const int GL_COLOR_INDEXES;
const int GL_LIGHT_MODEL_TWO_SIDE;
const int GL_LIGHT_MODEL_LOCAL_VIEWER;
const int GL_LIGHT_MODEL_AMBIENT;
const int GL_FRONT_AND_BACK;
const int GL_SHADE_MODEL;
const int GL_FLAT;
const int GL_SMOOTH;
const int GL_COLOR_MATERIAL;
const int GL_COLOR_MATERIAL_FACE;
const int GL_COLOR_MATERIAL_PARAMETER;
const int GL_NORMALIZE;

/* User clipping planes */
const int GL_CLIP_PLANE0;
const int GL_CLIP_PLANE1;
const int GL_CLIP_PLANE2;
const int GL_CLIP_PLANE3;
const int GL_CLIP_PLANE4;
const int GL_CLIP_PLANE5;

/* Accumulation buffer */
const int GL_ACCUM_RED_BITS;
const int GL_ACCUM_GREEN_BITS;
const int GL_ACCUM_BLUE_BITS;
const int GL_ACCUM_ALPHA_BITS;
const int GL_ACCUM_CLEAR_VALUE;
const int GL_ACCUM;
const int GL_ADD;
const int GL_LOAD;
const int GL_MULT;
const int GL_RETURN;

/* Alpha testing */
const int GL_ALPHA_TEST;
const int GL_ALPHA_TEST_REF;
const int GL_ALPHA_TEST_FUNC;

/* Blending */
const int GL_BLEND;
const int GL_BLEND_SRC;
const int GL_BLEND_DST;
const int GL_ZERO;
const int GL_ONE;
const int GL_SRC_COLOR;
const int GL_ONE_MINUS_SRC_COLOR;
const int GL_SRC_ALPHA;
const int GL_ONE_MINUS_SRC_ALPHA;
const int GL_DST_ALPHA;
const int GL_ONE_MINUS_DST_ALPHA;
const int GL_DST_COLOR;
const int GL_ONE_MINUS_DST_COLOR;
const int GL_SRC_ALPHA_SATURATE;

/* Render Mode */
const int GL_FEEDBACK;
const int GL_RENDER;
const int GL_SELECT;

/* Feedback */
const int GL_2D;
const int GL_3D;
const int GL_3D_COLOR;
const int GL_3D_COLOR_TEXTURE;
const int GL_4D_COLOR_TEXTURE;
const int GL_POINT_TOKEN;
const int GL_LINE_TOKEN;
const int GL_LINE_RESET_TOKEN;
const int GL_POLYGON_TOKEN;
const int GL_BITMAP_TOKEN;
const int GL_DRAW_PIXEL_TOKEN;
const int GL_COPY_PIXEL_TOKEN;
const int GL_PASS_THROUGH_TOKEN;
const int GL_FEEDBACK_BUFFER_POINTER;
const int GL_FEEDBACK_BUFFER_SIZE;
const int GL_FEEDBACK_BUFFER_TYPE;

/* Selection */
const int GL_SELECTION_BUFFER_POINTER;
const int GL_SELECTION_BUFFER_SIZE;

/* Fog */
const int GL_FOG;
const int GL_FOG_MODE;
const int GL_FOG_DENSITY;
const int GL_FOG_COLOR;
const int GL_FOG_INDEX;
const int GL_FOG_START;
const int GL_FOG_END;
const int GL_LINEAR;
const int GL_EXP;
const int GL_EXP2;

/* Logic Ops */
const int GL_LOGIC_OP;
const int GL_INDEX_LOGIC_OP;
const int GL_COLOR_LOGIC_OP;
const int GL_LOGIC_OP_MODE;
const int GL_CLEAR;
const int GL_SET;
const int GL_COPY;
const int GL_COPY_INVERTED;
const int GL_NOOP;
const int GL_INVERT;
const int GL_AND;
const int GL_NAND;
const int GL_OR;
const int GL_NOR;
const int GL_XOR;
const int GL_EQUIV;
const int GL_AND_REVERSE;
const int GL_AND_INVERTED;
const int GL_OR_REVERSE;
const int GL_OR_INVERTED;

/* Stencil */
const int GL_STENCIL_TEST;
const int GL_STENCIL_WRITEMASK;
const int GL_STENCIL_BITS;
const int GL_STENCIL_FUNC;
const int GL_STENCIL_VALUE_MASK;
const int GL_STENCIL_REF;
const int GL_STENCIL_FAIL;
const int GL_STENCIL_PASS_DEPTH_PASS;
const int GL_STENCIL_PASS_DEPTH_FAIL;
const int GL_STENCIL_CLEAR_VALUE;
const int GL_STENCIL_INDEX;
const int GL_KEEP;
const int GL_REPLACE;
const int GL_INCR;
const int GL_DECR;

/* Buffers, Pixel Drawing/Reading */
const int GL_NONE;
const int GL_LEFT;
const int GL_RIGHT;
/*GL_FRONT                                      0x0404 */
/*GL_BACK                                       0x0405 */
/*GL_FRONT_AND_BACK                             0x0408 */
const int GL_FRONT_LEFT;
const int GL_FRONT_RIGHT;
const int GL_BACK_LEFT;
const int GL_BACK_RIGHT;
const int GL_AUX0;
const int GL_AUX1;
const int GL_AUX2;
const int GL_AUX3;
const int GL_COLOR_INDEX;
const int GL_RED;
const int GL_GREEN;
const int GL_BLUE;
const int GL_ALPHA;
const int GL_LUMINANCE;
const int GL_LUMINANCE_ALPHA;
const int GL_ALPHA_BITS;
const int GL_RED_BITS;
const int GL_GREEN_BITS;
const int GL_BLUE_BITS;
const int GL_INDEX_BITS;
const int GL_SUBPIXEL_BITS;
const int GL_AUX_BUFFERS;
const int GL_READ_BUFFER;
const int GL_DRAW_BUFFER;
const int GL_DOUBLEBUFFER;
const int GL_STEREO;
const int GL_BITMAP;
const int GL_COLOR;
const int GL_DEPTH;
const int GL_STENCIL;
const int GL_DITHER;
const int GL_RGB;
const int GL_RGBA;

/* Implementation limits */
const int GL_MAX_LIST_NESTING;
const int GL_MAX_ATTRIB_STACK_DEPTH;
const int GL_MAX_MODELVIEW_STACK_DEPTH;
const int GL_MAX_NAME_STACK_DEPTH;
const int GL_MAX_PROJECTION_STACK_DEPTH;
const int GL_MAX_TEXTURE_STACK_DEPTH;
const int GL_MAX_EVAL_ORDER;
const int GL_MAX_LIGHTS;
const int GL_MAX_CLIP_PLANES;
const int GL_MAX_TEXTURE_SIZE;
const int GL_MAX_PIXEL_MAP_TABLE;
const int GL_MAX_VIEWPORT_DIMS;
const int GL_MAX_CLIENT_ATTRIB_STACK_DEPTH;

/* Gets */
const int GL_ATTRIB_STACK_DEPTH;
const int GL_CLIENT_ATTRIB_STACK_DEPTH;
const int GL_COLOR_CLEAR_VALUE;
const int GL_COLOR_WRITEMASK;
const int GL_CURRENT_INDEX;
const int GL_CURRENT_COLOR;
const int GL_CURRENT_NORMAL;
const int GL_CURRENT_RASTER_COLOR;
const int GL_CURRENT_RASTER_DISTANCE;
const int GL_CURRENT_RASTER_INDEX;
const int GL_CURRENT_RASTER_POSITION;
const int GL_CURRENT_RASTER_TEXTURE_COORDS;
const int GL_CURRENT_RASTER_POSITION_VALID;
const int GL_CURRENT_TEXTURE_COORDS;
const int GL_INDEX_CLEAR_VALUE;
const int GL_INDEX_MODE;
const int GL_INDEX_WRITEMASK;
const int GL_MODELVIEW_MATRIX;
const int GL_MODELVIEW_STACK_DEPTH;
const int GL_NAME_STACK_DEPTH;
const int GL_PROJECTION_MATRIX;
const int GL_PROJECTION_STACK_DEPTH;
const int GL_RENDER_MODE;
const int GL_RGBA_MODE;
const int GL_TEXTURE_MATRIX;
const int GL_TEXTURE_STACK_DEPTH;
const int GL_VIEWPORT;

/* Evaluators */
const int GL_AUTO_NORMAL;
const int GL_MAP1_COLOR_4;
const int GL_MAP1_INDEX;
const int GL_MAP1_NORMAL;
const int GL_MAP1_TEXTURE_COORD_1;
const int GL_MAP1_TEXTURE_COORD_2;
const int GL_MAP1_TEXTURE_COORD_3;
const int GL_MAP1_TEXTURE_COORD_4;
const int GL_MAP1_VERTEX_3;
const int GL_MAP1_VERTEX_4;
const int GL_MAP2_COLOR_4;
const int GL_MAP2_INDEX;
const int GL_MAP2_NORMAL;
const int GL_MAP2_TEXTURE_COORD_1;
const int GL_MAP2_TEXTURE_COORD_2;
const int GL_MAP2_TEXTURE_COORD_3;
const int GL_MAP2_TEXTURE_COORD_4;
const int GL_MAP2_VERTEX_3;
const int GL_MAP2_VERTEX_4;
const int GL_MAP1_GRID_DOMAIN;
const int GL_MAP1_GRID_SEGMENTS;
const int GL_MAP2_GRID_DOMAIN;
const int GL_MAP2_GRID_SEGMENTS;
const int GL_COEFF;
const int GL_DOMAIN;
const int GL_ORDER;

/* Hints */
const int GL_FOG_HINT;
const int GL_LINE_SMOOTH_HINT;
const int GL_PERSPECTIVE_CORRECTION_HINT;
const int GL_POINT_SMOOTH_HINT;
const int GL_POLYGON_SMOOTH_HINT;
const int GL_DONT_CARE;
const int GL_FASTEST;
const int GL_NICEST;

/* Scissor box */
const int GL_SCISSOR_TEST;
const int GL_SCISSOR_BOX;

/* Pixel Mode / Transfer */
const int GL_MAP_COLOR;
const int GL_MAP_STENCIL;
const int GL_INDEX_SHIFT;
const int GL_INDEX_OFFSET;
const int GL_RED_SCALE;
const int GL_RED_BIAS;
const int GL_GREEN_SCALE;
const int GL_GREEN_BIAS;
const int GL_BLUE_SCALE;
const int GL_BLUE_BIAS;
const int GL_ALPHA_SCALE;
const int GL_ALPHA_BIAS;
const int GL_DEPTH_SCALE;
const int GL_DEPTH_BIAS;
const int GL_PIXEL_MAP_S_TO_S_SIZE;
const int GL_PIXEL_MAP_I_TO_I_SIZE;
const int GL_PIXEL_MAP_I_TO_R_SIZE;
const int GL_PIXEL_MAP_I_TO_G_SIZE;
const int GL_PIXEL_MAP_I_TO_B_SIZE;
const int GL_PIXEL_MAP_I_TO_A_SIZE;
const int GL_PIXEL_MAP_R_TO_R_SIZE;
const int GL_PIXEL_MAP_G_TO_G_SIZE;
const int GL_PIXEL_MAP_B_TO_B_SIZE;
const int GL_PIXEL_MAP_A_TO_A_SIZE;
const int GL_PIXEL_MAP_S_TO_S;
const int GL_PIXEL_MAP_I_TO_I;
const int GL_PIXEL_MAP_I_TO_R;
const int GL_PIXEL_MAP_I_TO_G;
const int GL_PIXEL_MAP_I_TO_B;
const int GL_PIXEL_MAP_I_TO_A;
const int GL_PIXEL_MAP_R_TO_R;
const int GL_PIXEL_MAP_G_TO_G;
const int GL_PIXEL_MAP_B_TO_B;
const int GL_PIXEL_MAP_A_TO_A;
const int GL_PACK_ALIGNMENT;
const int GL_PACK_LSB_FIRST;
const int GL_PACK_ROW_LENGTH;
const int GL_PACK_SKIP_PIXELS;
const int GL_PACK_SKIP_ROWS;
const int GL_PACK_SWAP_BYTES;
const int GL_UNPACK_ALIGNMENT;
const int GL_UNPACK_LSB_FIRST;
const int GL_UNPACK_ROW_LENGTH;
const int GL_UNPACK_SKIP_PIXELS;
const int GL_UNPACK_SKIP_ROWS;
const int GL_UNPACK_SWAP_BYTES;
const int GL_ZOOM_X;
const int GL_ZOOM_Y;

/* Texture mapping */
const int GL_TEXTURE_ENV;
const int GL_TEXTURE_ENV_MODE;
const int GL_TEXTURE_1D;
const int GL_TEXTURE_2D;
const int GL_TEXTURE_WRAP_S;
const int GL_TEXTURE_WRAP_T;
const int GL_TEXTURE_MAG_FILTER;
const int GL_TEXTURE_MIN_FILTER;
const int GL_TEXTURE_ENV_COLOR;
const int GL_TEXTURE_GEN_S;
const int GL_TEXTURE_GEN_T;
const int GL_TEXTURE_GEN_MODE;
const int GL_TEXTURE_BORDER_COLOR;
const int GL_TEXTURE_WIDTH;
const int GL_TEXTURE_HEIGHT;
const int GL_TEXTURE_BORDER;
const int GL_TEXTURE_COMPONENTS;
const int GL_TEXTURE_RED_SIZE;
const int GL_TEXTURE_GREEN_SIZE;
const int GL_TEXTURE_BLUE_SIZE;
const int GL_TEXTURE_ALPHA_SIZE;
const int GL_TEXTURE_LUMINANCE_SIZE;
const int GL_TEXTURE_INTENSITY_SIZE;
const int GL_NEAREST_MIPMAP_NEAREST;
const int GL_NEAREST_MIPMAP_LINEAR;
const int GL_LINEAR_MIPMAP_NEAREST;
const int GL_LINEAR_MIPMAP_LINEAR;
const int GL_OBJECT_LINEAR;
const int GL_OBJECT_PLANE;
const int GL_EYE_LINEAR;
const int GL_EYE_PLANE;
const int GL_SPHERE_MAP;
const int GL_DECAL;
const int GL_MODULATE;
const int GL_NEAREST;
const int GL_REPEAT;
const int GL_CLAMP;
const int GL_S;
const int GL_T;
const int GL_R;
const int GL_Q;
const int GL_TEXTURE_GEN_R;
const int GL_TEXTURE_GEN_Q;

/* Utility */
const int GL_VENDOR;
const int GL_RENDERER;
const int GL_VERSION;
const int GL_EXTENSIONS;

/* Errors */
const int GL_NO_ERROR;
const int GL_INVALID_VALUE;
const int GL_INVALID_ENUM;
const int GL_INVALID_OPERATION;
const int GL_STACK_OVERFLOW;
const int GL_STACK_UNDERFLOW;
const int GL_OUT_OF_MEMORY;

/* glPush/PopAttrib bits */
const int GL_CURRENT_BIT;
const int GL_POINT_BIT;
const int GL_LINE_BIT;
const int GL_POLYGON_BIT;
const int GL_POLYGON_STIPPLE_BIT;
const int GL_PIXEL_MODE_BIT;
const int GL_LIGHTING_BIT;
const int GL_FOG_BIT;
const int GL_DEPTH_BUFFER_BIT;
const int GL_ACCUM_BUFFER_BIT;
const int GL_STENCIL_BUFFER_BIT;
const int GL_VIEWPORT_BIT;
const int GL_TRANSFORM_BIT;
const int GL_ENABLE_BIT;
const int GL_COLOR_BUFFER_BIT;
const int GL_HINT_BIT;
const int GL_EVAL_BIT;
const int GL_LIST_BIT;
const int GL_TEXTURE_BIT;
const int GL_SCISSOR_BIT;
const long GL_ALL_ATTRIB_BITS;


/* OpenGL 1.1 */
const int GL_PROXY_TEXTURE_1D;
const int GL_PROXY_TEXTURE_2D;
const int GL_TEXTURE_PRIORITY;
const int GL_TEXTURE_RESIDENT;
const int GL_TEXTURE_BINDING_1D;
const int GL_TEXTURE_BINDING_2D;
const int GL_TEXTURE_INTERNAL_FORMAT;
const int GL_ALPHA4;
const int GL_ALPHA8;
const int GL_ALPHA12;
const int GL_ALPHA16;
const int GL_LUMINANCE4;
const int GL_LUMINANCE8;
const int GL_LUMINANCE12;
const int GL_LUMINANCE16;
const int GL_LUMINANCE4_ALPHA4;
const int GL_LUMINANCE6_ALPHA2;
const int GL_LUMINANCE8_ALPHA8;
const int GL_LUMINANCE12_ALPHA4;
const int GL_LUMINANCE12_ALPHA12;
const int GL_LUMINANCE16_ALPHA16;
const int GL_INTENSITY;
const int GL_INTENSITY4;
const int GL_INTENSITY8;
const int GL_INTENSITY12;
const int GL_INTENSITY16;
const int GL_R3_G3_B2;
const int GL_RGB4;
const int GL_RGB5;
const int GL_RGB8;
const int GL_RGB10;
const int GL_RGB12;
const int GL_RGB16;
const int GL_RGBA2;
const int GL_RGBA4;
const int GL_RGB5_A1;
const int GL_RGBA8;
const int GL_RGB10_A2;
const int GL_RGBA12;
const int GL_RGBA16;
const int GL_CLIENT_PIXEL_STORE_BIT;
const int GL_CLIENT_VERTEX_ARRAY_BIT;
// Not on WIN32 and my x86_64 Gentoo: const int GL_ALL_CLIENT_ATTRIB_BITS;
const long GL_CLIENT_ALL_ATTRIB_BITS;



/*
 * Miscellaneous
 */

void glClearIndex(GLfloat);

void glClearColor(GLclampf, GLclampf, GLclampf, GLclampf);

void glClear(GLbitfield);

void glIndexMask(GLuint);

void glColorMask(GLboolean, GLboolean, GLboolean, GLboolean);

void glAlphaFunc(GLenum, GLclampf);

void glBlendFunc(GLenum, GLenum);

void glLogicOp(GLenum);

void glCullFace(GLenum);

void glFrontFace(GLenum);

void glPointSize(GLfloat);

void glLineWidth(GLfloat);

void glLineStipple(GLint, GLushort);

void glPolygonMode(GLenum, GLenum);

void glPolygonOffset(GLfloat, GLfloat);

// void glPolygonStipple(const GLubyte*);

// void glGetPolygonStipple(GLubyte*);

void glEdgeFlag(GLboolean);

// void glEdgeFlagv(const GLboolean*);

void glScissor(GLint, GLint, GLsizei, GLsizei);

// void glClipPlane(GLenum, const GLdouble*);

// void glGetClipPlane(GLenum, GLdouble*);

void glDrawBuffer(GLenum);

void glReadBuffer(GLenum);

void glEnable(GLenum);

void glDisable(GLenum);

GLboolean glIsEnabled(GLenum);


void glEnableClientState(GLenum);  /* 1.1 */

void glDisableClientState(GLenum);  /* 1.1 */


// void glGetBooleanv(GLenum, GLboolean*);

// void glGetDoublev(GLenum, GLdouble*);

// void glGetFloatv(GLenum, GLfloat*);

// void glGetIntegerv(GLenum, GLint*);


void glPushAttrib(GLbitfield);

void glPopAttrib(/* void */);


void glPushClientAttrib(GLbitfield);  /* 1.1 */

void glPopClientAttrib(/* void */);  /* 1.1 */


GLint glRenderMode(GLenum);

GLenum glGetError(/* void */);

const GLubyte* glGetString(GLenum);

void glFinish(/* void */);

void glFlush(/* void */);

void glHint(GLenum, GLenum);


/*
 * Depth Buffer
 */


void glClearDepth(GLclampd);

void glDepthFunc(GLenum);

void glDepthMask(GLboolean);

void glDepthRange(GLclampd, GLclampd);


/*
 * Accumulation Buffer
 */

void glClearAccum(GLfloat, GLfloat, GLfloat, GLfloat);

void glAccum(GLenum, GLfloat);


/*
 * Transformation
 */

void glMatrixMode(GLenum);

void glOrtho(GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble);

void glFrustum(GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble);

void glViewport(GLint, GLint, GLsizei, GLsizei);

void glPushMatrix(/* void */);

void glPopMatrix(/* void */);

void glLoadIdentity(/* void */);

// void glLoadMatrixd(const GLdouble*);
// void glLoadMatrixf(const GLfloat*);

// void glMultMatrixd(const GLdouble*);
// void glMultMatrixf(const GLfloat*);

void glRotated(GLdouble, GLdouble, GLdouble, GLdouble);
void glRotatef(GLfloat, GLfloat, GLfloat, GLfloat);

void glScaled(GLdouble, GLdouble, GLdouble);
void glScalef(GLfloat, GLfloat, GLfloat);

void glTranslated(GLdouble, GLdouble, GLdouble);
void glTranslatef(GLfloat, GLfloat, GLfloat);


/*
 * Display Lists
 */

GLboolean glIsList(GLuint);

void glDeleteLists(GLuint, GLsizei);

GLuint glGenLists(GLsizei);

void  glNewList(GLuint, GLenum);

void glEndList(/* void */);

void glCallList(GLuint);

// void glCallLists(GLsizei, GLenum, const GLvoid*);

void glListBase(GLuint);


/*
 * Drawing Functions
 */

void glBegin(GLenum);

void glEnd(/* void */);


void glVertex2d(GLdouble, GLdouble);
void glVertex2f(GLfloat, GLfloat);
void glVertex2i(GLint, GLint);
void glVertex2s(GLshort, GLshort);

void glVertex3d(GLdouble, GLdouble, GLdouble);
void glVertex3f(GLfloat, GLfloat, GLfloat);
void glVertex3i(GLint, GLint, GLint);
void glVertex3s(GLshort, GLshort, GLshort);

void glVertex4d(GLdouble, GLdouble, GLdouble, GLdouble);
void glVertex4f(GLfloat, GLfloat, GLfloat, GLfloat);
void glVertex4i(GLint, GLint, GLint, GLint);
void glVertex4s(GLshort, GLshort, GLshort, GLshort);

// void glVertex2dv(const GLdouble*);
// void glVertex2fv(const GLfloat*);
// void glVertex2iv(const GLint*);
// void glVertex2sv(const GLshort*);

// void glVertex3dv(const GLdouble *v);
// void glVertex3fv(const GLfloat *v);
// void glVertex3iv(const GLint *v);
// void glVertex3sv(const GLshort *v);

// void glVertex4dv(const GLdouble *v);
// void glVertex4fv(const GLfloat *v);
// void glVertex4iv(const GLint *v);
// void glVertex4sv(const GLshort *v);


void glNormal3b(GLbyte, GLbyte, GLbyte);
void glNormal3d(GLdouble, GLdouble, GLdouble);
void glNormal3f(GLfloat, GLfloat, GLfloat);
void glNormal3i(GLint, GLint, GLint);
void glNormal3s(GLshort, GLshort, GLshort);

// void glNormal3bv(const GLbyte*);
// void glNormal3dv(const GLdouble*);
// void glNormal3fv(const GLfloat*);
// void glNormal3iv(const GLint*);
// void glNormal3sv(const GLshort*);


// void glIndexd(GLdouble);
// void glIndexf(GLfloat);
// void glIndexi(GLint);
// void glIndexs(GLshort);
// void glIndexub(GLubyte);  /* 1.1 */

// void glIndexdv(const GLdouble*);
// void glIndexfv(const GLfloat*);
// void glIndexiv(const GLint*);
// void glIndexsv(const GLshort*);
// void glIndexubv(const GLubyte*);  /* 1.1 */

void glColor3b(GLbyte, GLbyte, GLbyte);
void glColor3d(GLdouble, GLdouble, GLdouble);
void glColor3f(GLfloat, GLfloat, GLfloat);
void glColor3i(GLint, GLint, GLint);
void glColor3s(GLshort, GLshort, GLshort);
void glColor3ub(GLubyte, GLubyte, GLubyte);
void glColor3ui(GLuint, GLuint, GLuint);
void glColor3us(GLushort, GLushort, GLushort);

void glColor4b(GLbyte, GLbyte, GLbyte, GLbyte);
void glColor4d(GLdouble, GLdouble, GLdouble, GLdouble);
void glColor4f(GLfloat, GLfloat, GLfloat, GLfloat);
void glColor4i(GLint, GLint, GLint, GLint);
void glColor4s(GLshort, GLshort, GLshort, GLshort);
void glColor4ub(GLubyte, GLubyte, GLubyte, GLubyte);
void glColor4ui(GLuint, GLuint, GLuint, GLuint);
void glColor4us(GLushort, GLushort, GLushort, GLushort);


// void glColor3bv(const GLbyte*);
// void glColor3dv(const GLdouble*);
// void glColor3fv(const GLfloat*);
// void glColor3iv(const GLint*);
// void glColor3sv(const GLshort*);
// void glColor3ubv(const GLubyte*);
// void glColor3uiv(const GLuint*);
// void glColor3usv(const GLushort*);

// void glColor4bv(const GLbyte*);
// void glColor4dv(const GLdouble*);
// void glColor4fv(const GLfloat*);
// void glColor4iv(const GLint*);
// void glColor4sv(const GLshort*);
// void glColor4ubv(const GLubyte*);
// void glColor4uiv(const GLuint*);
// void glColor4usv(const GLushort*);

// void glColor4bv(const GLbyte*);
// void glColor4dv(const GLdouble*);
// void glColor4fv(const GLfloat*);
// void glColor4iv(const GLint*);
// void glColor4sv(const GLshort*);
// void glColor4ubv(const GLubyte*);
// void glColor4uiv(const GLuint*);
// void glColor4usv(const GLushort*);


void glTexCoord1d(GLdouble);
void glTexCoord1f(GLfloat);
void glTexCoord1i(GLint);
void glTexCoord1s(GLshort);

void glTexCoord2d(GLdouble, GLdouble);
void glTexCoord2f(GLfloat, GLfloat);
void glTexCoord2i(GLint, GLint);
void glTexCoord2s(GLshort, GLshort);

void glTexCoord3d(GLdouble, GLdouble, GLdouble);
void glTexCoord3f(GLfloat, GLfloat, GLfloat);
void glTexCoord3i(GLint, GLint, GLint);
void glTexCoord3s(GLshort, GLshort, GLshort);

void glTexCoord4d(GLdouble, GLdouble, GLdouble, GLdouble);
void glTexCoord4f(GLfloat, GLfloat, GLfloat, GLfloat);
void glTexCoord4i(GLint, GLint, GLint, GLint);
void glTexCoord4s(GLshort, GLshort, GLshort, GLshort);

// void glTexCoord1dv( const GLdouble*);
// void glTexCoord1fv( const GLfloat*);
// void glTexCoord1iv( const GLint*);
// void glTexCoord1sv( const GLshort*);

// void glTexCoord2dv( const GLdouble*);
// void glTexCoord2fv( const GLfloat*);
// void glTexCoord2iv( const GLint*);
// void glTexCoord2sv( const GLshort*);

// void glTexCoord3dv( const GLdouble*);
// void glTexCoord3fv( const GLfloat*);
// void glTexCoord3iv( const GLint*);
// void glTexCoord3sv( const GLshort*);

// void glTexCoord4dv( const GLdouble*);
// void glTexCoord4fv( const GLfloat*);
// void glTexCoord4iv( const GLint*);
// void glTexCoord4sv( const GLshort*);


void glRasterPos2d(GLdouble, GLdouble);
void glRasterPos2f(GLfloat, GLfloat);
void glRasterPos2i(GLint, GLint);
void glRasterPos2s(GLshort, GLshort);

void glRasterPos3d(GLdouble, GLdouble, GLdouble);
void glRasterPos3f(GLfloat, GLfloat, GLfloat);
void glRasterPos3i(GLint, GLint, GLint);
void glRasterPos3s(GLshort, GLshort, GLshort);

void glRasterPos4d(GLdouble, GLdouble, GLdouble, GLdouble);
void glRasterPos4f(GLfloat, GLfloat, GLfloat, GLfloat );
void glRasterPos4i(GLint, GLint, GLint, GLint);
void glRasterPos4s(GLshort, GLshort, GLshort, GLshort);

// void glRasterPos2dv(const GLdouble*);
// void glRasterPos2fv(const GLfloat*);
// void glRasterPos2iv(const GLint*);
// void glRasterPos2sv(const GLshort*);

// void glRasterPos3dv(const GLdouble*);
// void glRasterPos3fv(const GLfloat*);
// void glRasterPos3iv(const GLint*);
// void glRasterPos3sv(const GLshort*);

// void glRasterPos4dv(const GLdouble*);
// void glRasterPos4fv(const GLfloat*);
// void glRasterPos4iv(const GLint*);
// void glRasterPos4sv(const GLshort*);


void glRectd(GLdouble, GLdouble, GLdouble, GLdouble);
void glRectf(GLfloat, GLfloat, GLfloat, GLfloat);
void glRecti(GLint, GLint, GLint, GLint);
void glRects(GLshort, GLshort, GLshort, GLshort);


// void glRectdv(const GLdouble*, const GLdouble*);
// void glRectfv(const GLfloat*, const GLfloat*);
// void glRectiv(const GLint*, const GLint*);
// void glRectsv(const GLshort*, const GLshort*);


/*
 * Vertex Arrays  (1.1)
 */

// Local Variables:
// mode: C++
// c-file-style: "stroustrup"
// indent-tabs-mode: nil
// End:
