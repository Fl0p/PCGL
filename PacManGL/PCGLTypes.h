//
//  PCGLTypes.h
//  PacManGL
//
//  Created by Flop on 12/03/2013.
//
//

#import <GLKit/GLKit.h>

#ifndef PacManGL_PCGLTypes_h
#define PacManGL_PCGLTypes_h

// PCGLVertex
typedef struct {
    GLKVector3 position;
} PCGLVertex;

#define PCGLVertexStride sizeof(PCGLVertex)
#define PCGLVertexPtrPosition (GLvoid*) 0

// PCGLVertexColored
typedef struct {
    GLKVector3 position;
    GLKVector4 color;
} PCGLVertexColored;


#define PCGLVertexColoredStride sizeof(PCGLVertexColored)
#define PCGLVertexColoredPtrPosition (GLvoid*) 0
#define PCGLVertexColoredPtrColor (GLvoid*) sizeof(GLKVector3)

typedef struct {
    GLKVector3 position;
    GLKVector2 texCoord;
} PCGLVertexTextured;


#define PCGLVertexTexturedStride sizeof(PCGLVertexTextured)
#define PCGLVertexTexturedPtrPosition (GLvoid*) 0
#define PCGLVertexTexturedPtrTexCoord (GLvoid*) sizeof(GLKVector3)


typedef struct {
    GLKVector3 position;
    GLKVector4 color;    
    GLKVector2 texCoord;
} PCGLVertexColoredTextured;

#define PCGLVertexColoredTexturedStride sizeof(PCGLVertexColoredTextured)
#define PCGLVertexColoredTexturedPtrPosition (GLvoid*) 0
#define PCGLVertexColoredTexturedPtrColor (GLvoid*) sizeof(GLKVector3)
#define PCGLVertexColoredTexturedPtrTexCoord (GLvoid*) sizeof(GLKVector3) + sizeof(GLKVector4)






#endif
