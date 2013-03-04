//
//  PCGLObject.h
//  PacManGL
//
//  Created by Flop on 17/02/2013.
//
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>


@interface PCGLObject : NSObject {
    GLKBaseEffect* _effect;
}


@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;


-(void) update:(NSTimeInterval)interval;
-(void) drawInRect:(CGRect)rect;

@end
