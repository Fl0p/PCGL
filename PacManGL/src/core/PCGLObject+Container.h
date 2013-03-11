//
//  PCGLObject+Container.h
//  PacManGL
//
//  Created by Flop on 12/03/2013.
//
//

#import "PCGLObject.h"

@class PCGLObjectContainer;

@interface PCGLObject (Container)

@property (nonatomic, assign) PCGLObjectContainer* parent;

@end
