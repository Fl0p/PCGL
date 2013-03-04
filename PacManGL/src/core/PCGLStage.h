//
//  PCGLStage.h
//  PacManGL
//
//  Created by Flop on 04/03/2013.
//
//

#import <Foundation/Foundation.h>

@interface PCGLStage : NSObject {
    
    
    
}


@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;

@property (nonatomic, assign) float rotation;

@property (nonatomic, assign) float scaleX;
@property (nonatomic, assign) float scaleY;


-(void)activate;

+(PCGLStage*)defaultStage;
+(PCGLStage*)activeStage;

+createStage:(Class)stage_class forKey:(NSString*)key;
+(PCGLStage*)stageForKey:(NSString*)key;

@end
