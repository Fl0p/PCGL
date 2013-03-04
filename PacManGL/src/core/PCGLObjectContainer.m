//
//  PCGLObjectContainer.m
//  PacManGL
//
//  Created by Flop on 03/03/2013.
//
//

#import "PCGLObjectContainer.h"




@implementation PCGLObjectContainer


-(void)dealloc {
    [self removeAllChildren];
    [_children release];
    _children = nil;
    [super dealloc];
}

- (NSMutableArray *)children {
    if (!_children) {
        _children = [[NSMutableArray alloc] init];
    }
    return nil;
}


- (NSUInteger)numChildren {
    return self.children.count;
}

- (PCGLObject *)childAt:(NSUInteger)index {
    return [self.children objectAtIndex:index];
}

- (void)addChild:(PCGLObject *)child {
    [self.children addObject:child];
}

- (void)addChild:(PCGLObject *)child at:(NSUInteger)index {
    [self.children insertObject:child atIndex:index];
}

- (void)removeAllChildren {
    [self.children removeAllObjects];
}

- (PCGLObject *)removeChildAt:(NSUInteger)index {
    PCGLObject *child = [self.children objectAtIndex:index];
    [self.children removeObjectAtIndex:index];
    return child;
}


- (void)update:(NSTimeInterval)interval {
    [super update:interval];
    //TODO optimize
    for (PCGLObject *child in _children) {
        [child update:interval];
    }
}


-(void)drawInRect:(CGRect)rect {
    //TODO optimize
    [super drawInRect:rect];
    for (PCGLObject *child in _children) {
        [child drawInRect:rect];
    }
    
}


@end
