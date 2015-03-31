//
//  LIBRoundLayer.h
//  LIBApp
//
//  Created by WEIHAN LI on 11/22/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface LIBRoundLayer : CAShapeLayer
+(instancetype) layerWithBounds:(CGRect) maskBounds
                    roundBounds:(CGRect) roundBounds
                          point:(CGPoint) point;

-(void) updateDiameter:(CGFloat) diameter;
@end
