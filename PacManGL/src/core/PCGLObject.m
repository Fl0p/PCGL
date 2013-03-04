//
//  PCGLObject.m
//  PacManGL
//
//  Created by Flop on 17/02/2013.
//
//

#import "PCGLObject.h"
#import "PCGLStage.h"


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
    
    _effect.transform.projectionMatrix = [PCGLStage activeStage].projection;
}


-(void)drawInRect:(CGRect)rect {
    
    
    [_effect prepareToDraw];
    
    
    static const GLfloat squareVertices[] = {
        -100.0f, -100.0f,
        100.0f, -100.0f,
        -100.0f,  100.0f,
        100.0f,  100.0f
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
