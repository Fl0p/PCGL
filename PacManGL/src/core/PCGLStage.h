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

-(void)activate;

+(PCGLStage*)defaultStage;
+(PCGLStage*)activeStage;

+createStage:(Class)stage_class forKey:(NSString*)key;
+(PCGLStage*)stageForKey:(NSString*)key;

@end
