//
//  PCGLObjectContainer.h
//  PacManGL
//
//  Created by Flop on 03/03/2013.
//
//

#import "PCGLObject.h"
#import "PCGLObject+Container.h"


@interface PCGLObjectContainer : PCGLObject {
        //TODO need fast array?
        NSMutableArray *_children;
    
}



-(NSUInteger)numChildren;

-(PCGLObject*)childAt:(NSUInteger)index;

-(void)addChild:(PCGLObject*)child;
-(void)addChild:(PCGLObject*)child at:(NSUInteger)index;

-(void)removeAllChildren;
-(PCGLObject *)removeChildAt:(NSUInteger)index;

@end
