//
//  PCGLViewController.m
//  PacManGL
//
//  Created by Flop on 26/01/2013.
//
//

#import "PCGLRootViewController.h"
#import "PCGLStage.h"
#import "PCGLObject.h"

@interface PCGLRootViewController ()

@property (nonatomic, retain) GLKView* view;

@end

@implementation PCGLRootViewController {
    PCGLObject* _object;

}

- (id)init {
    self = [super init];
    if (self) {
        
        EAGLContext *context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        [EAGLContext setCurrentContext:context];
        NSLog(@"context %@ ",context);
        // Custom initialization
        self.preferredFramesPerSecond = 30;
        self.delegate = self;
        
        
        //GLKView *glkView = (GLKView *)self.view;
        //glkView.delegate = self;
        //glkView.context = aContext;
        _object = [[PCGLObject alloc] init];
    }
    return self;
}

-(id) initWithFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        self.view.frame = frame;
    }
    return self;
}


-(void) loadView {
    
    //[[GLKView alloc] initWithFrame:[[UIScreen mainScreen] bounds] context:[EAGLContext currentContext]];
    //self.view.delegate = self;
    
    [super loadView];
    
    GLKView* view = (GLKView*) self.view;
    view.context = [EAGLContext currentContext];
    view.delegate = self;
    
    NSLog(@"context %@ ",view.context);
    
    [PCGLStage defaultStage].width = view.frame.size.width;
    [PCGLStage defaultStage].height = view.frame.size.height;
    
    //self.view.enableSetNeedsDisplay = NO;
    //CADisplayLink* displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(render:)];
    //[displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

-(void) render:(id)param {
    //NSLog(@"render %@",param);
}

# pragma mark - GLKViewControllerDelegate

- (void)glkViewControllerUpdate:(GLKViewController *)controller {
    //NSLog(@"update");
    
    [[PCGLStage activeStage] update:self.timeSinceLastUpdate];
    
    [_object update:self.timeSinceLastUpdate];
}
- (void)glkViewController:(GLKViewController *)controller willPause:(BOOL)pause {
    NSLog(@"pause");
}


# pragma mark - GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    //clear
    //NSLog(@"Draw");
    glClearColor(0.0, 0.0, 0.5, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_object drawInRect:rect];
}


@end
