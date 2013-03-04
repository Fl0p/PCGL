//
//  PCGLStage.m
//  PacManGL
//
//  Created by Flop on 04/03/2013.
//
//

#import "PCGLStage.h"


@interface PCGLStage ()

-(id)init_;
@property (nonatomic, retain) NSMutableDictionary* stages;

@end


static PCGLStage* _activeStage = nil;

@implementation PCGLStage {
    


}

@synthesize stages = _stages;

@synthesize width = _width;
@synthesize height = _height;
@synthesize rotation = _rotation;
@synthesize scaleX = _scaleX;
@synthesize scaleY = _scaleY;

@synthesize projection = _projection;

-(id)init {
    [NSException raise:@"PCGLStage" format:@"unapropriet init"];
    return nil;
}

-(id)init_ {
    if (self = [super init]) {
        self.stages = [[NSMutableDictionary alloc] init];
        _activeStage = self;
        self.width = 1.0f; //?
        self.height = 1.0f; //?
        self.rotation = 0.0f;
        self.scaleX = 1.0f;
        self.scaleY = 1.0f;
        
    }
    return self;
}


-(oneway void)release {
    
    if (_activeStage == self) {
        _activeStage = [PCGLStage defaultStage];
    }

    [super release];
}

-(void) dealloc {
    
    if (self == [PCGLStage defaultStage]) {
        [NSException raise:@"PCGLStage" format:@"can't dealloc default stage"];        
    }
    
    [super dealloc];
}

+ (PCGLStage *)defaultStage {
    static PCGLStage *defaultStage;
    @synchronized(self) {
        if (defaultStage == nil) {
            defaultStage = [[PCGLStage alloc] init_];
        }
    }
    return defaultStage;
}


-(void)activate {
    _activeStage = self;
}


- (void)update:(NSTimeInterval)interval {
    // nothing here in default stage
    // only prepare marix
    
    _projection = GLKMatrix4MakeOrtho(-_width/2, _width/2, -_height/2, _height/2, -1.0f, 5.0f);
    _projection = GLKMatrix4RotateZ(_projection, _rotation);
    _projection = GLKMatrix4Scale(_projection, _scaleX, _scaleY, 1);

}

+(PCGLStage*)createStage:(Class)stage_class forKey:(NSString*)key {
    PCGLStage* newStage = [[[stage_class alloc] init_] autorelease];
    [[PCGLStage defaultStage].stages setValue:newStage forKey:key];
    return newStage;
}

+(PCGLStage*)stageForKey:(NSString *)key {
    return [[PCGLStage defaultStage].stages objectForKey:key];

}

+(PCGLStage*) activeStage {
    return _activeStage;
}

@end
