//
//  CAMediaTimingFunction.h
//  LIBApp
//
//  Created by WEIHAN LI on 11/24/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, LIBTimingFuctionType) {
    LIBTimingFuctionTypeEaseOut,
    LIBTimingFuctionTypeEaseIn,
    LIBTimingFuctionTypeEaseInEaseOut,
    LIBTimingFuctionTypeBounceOutEaseOut,
    LIBTimingFuctionTypeNone,
};


@interface CAMediaTimingFunction(LIBExtension)
+ (CAMediaTimingFunction *)li_bounceOutEaseOut;

+ (CAMediaTimingFunction *)li_easeIn;

+ (CAMediaTimingFunction *)li_easeOut;

+ (CAMediaTimingFunction *)li_timingFunctionWithType: (LIBTimingFuctionType) type;
- (CGFloat)li_getControlPointAtIndex:(CGFloat) index;
@end

