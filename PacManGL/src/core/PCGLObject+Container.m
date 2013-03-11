//
//  PCGLObject+Container.m
//  PacManGL
//
//  Created by Flop on 12/03/2013.
//
//


#import "PCGLObject+Container.h"
#import <objc/runtime.h>

NSString * const PCGLObjectParentKey = @"PCGLObjectParentKey";

@implementation PCGLObject (Container)

- (void)setParent:(NSString *)parent {
    objc_setAssociatedObject(self, PCGLObjectParentKey, parent, OBJC_ASSOCIATION_ASSIGN);
}

- (PCGLObjectContainer*)parent {
    return objc_getAssociatedObject(self, PCGLObjectParentKey);
}


@end
