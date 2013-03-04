//
//  PCGLObject.m
//  PacManGL
//
//  Created by Flop on 17/02/2013.
//
//

#import "PCGLObject.h"



@implementation PCGLObject



-(id)init {
    if (self = [super init]) {
    
        _effect = [[GLKBaseEffect alloc] init];
    
    }

    return self;

}


- (void)update:(NSTimeInterval)interval {
    static float transY = 0.0f;
    float y = sinf(transY)/2.0f;
    transY += 0.175f;
    
    GLKMatrix4 modelview = GLKMatrix4MakeTranslation(0, y, 0.f);
    _effect.transform.modelviewMatrix = modelview;
    
    //GLfloat ratio = 1024.0f/768.0f;
    //GLKMatrix4 projection = GLKMatrix4MakePerspective(45.0f, ratio, 0.1f, 20.0f);
    
    GLKMatrix4 projection = GLKMatrix4MakeOrtho(-102.4f, 102.4f, -76.8f, 76.8f, -1.0f, 5.0f);
    
    _effect.transform.projectionMatrix = projection;
}


-(void)drawInRect:(CGRect)rect {
    
    
    [_effect prepareToDraw];
    
    
    static const GLfloat squareVertices[] = {
        -10.5f, -10.5f,
        10.5f, -10.5f,
        -10.5f,  10.5f,
        10.5f,  10.5f
    };
    
    static const GLubyte squareColors[] = {
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0,
        255,   0, 255, 255,
    };

    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, squareVertices);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_UNSIGNED_BYTE, GL_TRUE, 0, squareColors);
    
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisableVertexAttribArray(GLKVertexAttribColor);
}


-(void)dealloc {
    
    [_effect release];
    [super dealloc];

}

@end
