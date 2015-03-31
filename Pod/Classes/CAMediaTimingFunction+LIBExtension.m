//
//  CAMediaTimingFunction.m
//  LIBApp
//
//  Created by WEIHAN LI on 11/24/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "CAMediaTimingFunction+LIBExtension.h"

@implementation CAMediaTimingFunction(LIBExtension)
+ (CAMediaTimingFunction *)li_bounceOutEaseOut{
    return [CAMediaTimingFunction functionWithControlPoints:0.68 : -0.55 : 0.2 : 1];
}

+ (CAMediaTimingFunction *)li_easeIn{
    return [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
}


+ (CAMediaTimingFunction *)li_easeInEaseOut{
    CGPoint controlPoint1 = CGPointMake(0.4, 0.0);
    CGPoint controlPoint2 = CGPointMake(0.2, 1.0);
    return [self functionWithControlPoints:controlPoint1.x :controlPoint1.y :controlPoint2.x :controlPoint2.y];
}
+ (CAMediaTimingFunction *)li_easeOut{
    return [CAMediaTimingFunction functionWithControlPoints:0.252 :0.0 :0.0 : 1];
}
+ (CAMediaTimingFunction *)li_timingFunctionWithType: (LIBTimingFuctionType) type{
    
    
    switch (type) {
        case LIBTimingFuctionTypeEaseIn:
            return [self li_easeIn];
            break;
        
        case LIBTimingFuctionTypeEaseInEaseOut:
            return [self li_easeInEaseOut];
            break;
            
        case LIBTimingFuctionTypeEaseOut:
            return [self li_easeOut];
            break;
            
        case LIBTimingFuctionTypeBounceOutEaseOut:
            return [self li_bounceOutEaseOut];
            break;
        case LIBTimingFuctionTypeNone:
            return nil;
            break;
        default:
            return nil;

            break;
    }
    
}
//- (CGFloat)li_getControlPointAtIndex:(CGFloat) index{
//    float value;
//    [self getControlPointAtIndex:index values:&value];
//    
//    return value;
//}
@end
