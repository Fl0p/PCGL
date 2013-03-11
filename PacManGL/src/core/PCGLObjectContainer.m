//
//  PCGLObjectContainer.m
//  PacManGL
//
//  Created by Flop on 03/03/2013.
//
//

#import "PCGLObjectContainer.h"


@interface PCGLObjectContainer ()


@end


@implementation PCGLObjectContainer



-(id)init{
    if (self = [super init]) {
        _children = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc {
    [self removeAllChildren];
    [_children release];
    _children = nil;
    [super dealloc];
}


- (NSUInteger)numChildren {
    return _children.count;
}

- (PCGLObject *)childAt:(NSUInteger)index {
    return [_children objectAtIndex:index];
}

- (void)addChild:(PCGLObject *)child {
    child.parent = self;
    [_children addObject:child];
}

- (void)addChild:(PCGLObject *)child at:(NSUInteger)index {
    child.parent = self;    
    [_children insertObject:child atIndex:index];
}

- (void)removeAllChildren {
    [_children removeAllObjects];
    
    //TODO remove parent
}

- (PCGLObject *)removeChildAt:(NSUInteger)index {
    PCGLObject *child = [_children objectAtIndex:index];
    [_children removeObjectAtIndex:index];
    child.parent = nil; // will it work?
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
