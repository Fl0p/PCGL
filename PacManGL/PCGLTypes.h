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





// PCGLVertexColored
typedef struct {
    GLKVector3 position;
    GLKVector4 color;
} PCGLVertexColored;

typedef struct {
    GLKVector3 position;
    GLKVector2 texCoord;
} PCGLVertexTextured;

typedef struct {
    GLKVector3 position;
    GLKVector4 color;    
    GLKVector2 texCoord;
} PCGLVertexColoredTextured;









#endif
