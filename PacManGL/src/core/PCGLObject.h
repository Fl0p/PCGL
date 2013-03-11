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
    GLKMatrix4 _matrix;
    
}


@property(nonatomic, assign) float x;
@property(nonatomic, assign) float y;
@property(nonatomic, assign) float z;
@property(nonatomic, assign) float rotation;
@property(nonatomic, assign) float scaleX;
@property(nonatomic, assign) float scaleY;

@property(nonatomic, readonly) GLKMatrix4 matrix;


@property(readonly) int numVertices;
@property(readonly) GLKVector2 *vertices;
@property(readonly) GLKVector4 *vertexColors;


-(void) update:(NSTimeInterval)interval;
-(void) drawInRect:(CGRect)rect;

@end
