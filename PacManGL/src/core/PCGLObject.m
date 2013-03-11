//
//  PCGLObject.m
//  PacManGL
//
//  Created by Flop on 17/02/2013.
//
//

#import "PCGLObject.h"
#import "PCGLStage.h"
#import "PCGLObjectContainer.h"

@implementation PCGLObject

@synthesize x = _x;
@synthesize y = _y;
@synthesize z = _z;
@synthesize rotation = _rotation;
@synthesize scaleX = _scaleX;
@synthesize scaleY = _scaleY;


-(id)init {
    if (self = [super init]) {
        
        _x = 0;
        _y = 0;
        _z = 0;
        _rotation = 0;
        _scaleX = 1;
        _scaleY = 1;
        _effect = [[GLKBaseEffect alloc] init];
        _matrix = GLKMatrix4Identity;
    
    }

    return self;

}


-(GLKMatrix4)matrix {
    return _matrix;
}

- (void)update:(NSTimeInterval)interval {
    
    GLKMatrix4 modelview = GLKMatrix4Identity;
    if (self.parent) {
        modelview = self.parent.matrix;
    }
    
    modelview = GLKMatrix4Translate(modelview, _x, _y, _z);
    modelview = GLKMatrix4RotateZ(modelview, _rotation);
    modelview = GLKMatrix4Scale(modelview, _scaleX, _scaleY, 1);
    _matrix = modelview;
    
    _effect.transform.modelviewMatrix = modelview;
    _effect.transform.projectionMatrix = [PCGLStage activeStage].projection;
}


-(void)drawInRect:(CGRect)rect {
    
    
    [_effect prepareToDraw];
    
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    

    static const GLbyte squareVertices[] = {
        -100, -100,
        100, -100,
        -100,  100,
        100,  100
    };
    
    static const GLubyte squareColors[] = {
        255, 255,   0, 255,
        0,   255, 255, 255,
        0,     0,   0,   0,
        255,   0, 255, 255,
    };
    
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_BYTE, GL_FALSE, 0, squareVertices);
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
