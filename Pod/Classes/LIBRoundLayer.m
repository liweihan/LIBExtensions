//
//  LIBRoundLayer.m
//  LIBApp
//
//  Created by WEIHAN LI on 11/22/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "LIBRoundLayer.h"

@implementation LIBRoundLayer
-(BOOL)drawsAsynchronously{
    return YES;
}
+(instancetype) layerWithBounds:(CGRect) maskBounds
                    roundBounds:(CGRect) roundBounds
                          point:(CGPoint) point{
    
    LIBRoundLayer *maskLayer = [[LIBRoundLayer alloc] init];
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(roundBounds, NULL);
    maskLayer.bounds = maskBounds;
    maskLayer.path = maskPath;
    maskLayer.anchorPoint = CGPointMake(0, 0);
    
    maskLayer.position = point;
    maskLayer.shouldRasterize = NO;
    CGPathRelease(maskPath);
    
    return maskLayer;
}

-(void) updateDiameter:(CGFloat) diameter{
    
    CGRect maskRect =CGRectMake(-(diameter/2) ,-(diameter/2), diameter, diameter);
    
    CGMutablePathRef p1 = CGPathCreateMutable();
    CGPathAddPath(p1, nil, CGPathCreateWithEllipseInRect(maskRect, nil));
    
    self.path =p1;
}

-(void)drawInnerShadowInContext:(CGContextRef)context
                       withPath:(CGPathRef)path
                    shadowColor:(CGColorRef)shadowColor
                         offset:(CGSize)offset
                     blurRadius:(CGFloat)blurRadius {
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    
    CGColorRef opaqueShadowColor = CGColorCreateCopyWithAlpha(shadowColor, 1.0);
    
    CGContextSetAlpha(context, CGColorGetAlpha(shadowColor));
    CGContextBeginTransparencyLayer(context, NULL);
    CGContextSetShadowWithColor(context, offset, blurRadius, opaqueShadowColor);
    CGContextSetBlendMode(context, kCGBlendModeSourceOut);
    CGContextSetFillColorWithColor(context, opaqueShadowColor);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextEndTransparencyLayer(context);
    
    CGContextRestoreGState(context);
    
    CGColorRelease(opaqueShadowColor);
}
@end
