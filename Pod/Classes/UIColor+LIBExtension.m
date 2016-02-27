//
//  UIColor+LightAndDark.m
//  dating
//
//  Created by Weihan Li on 4/9/14.
//  Copyright (c) 2014 WEIHAN LI. All rights reserved.
//

#import "UIColor+LIBExtension.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//#F0F3E9 green yellow
//#4A536B dark blue
@implementation UIColor(LIBExtension)
//0x554d55 pirple brown
// ee6655 nice orange
//88bbbb
+ (UIColor *)li_mainBackgroundDark{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0x554d55);
    return color;
}
//+ (UIColor *)li_mainBackgroundDarkBlue{
//    return UIColorFromRGB(0x68a8a8);
//}
//+ (UIColor *)li_mainBackgroundDarkNice{
//    return UIColorFromRGB(0xB9DAD7);
//}
//+ (UIColor *)li_mainBackgroundDark2{
//    return UIColorFromRGB(0x101d22);
//}
+ (UIColor *)li_mainBackground{
    return [self li_mainForeground];
}
//0xB9DAD7
+ (UIColor *)li_mainForeground{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0xFFF8E6);
    return color;
}

+ (UIColor *)li_mainForegroundDark{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0xD27258);
    return color;
}
//+ (UIColor *)li_mainForegroundYellow{
//    return UIColorFromRGB(0xF0F0E7);
//}
+ (UIColor *)li_unreadBackground{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0xe74c3c);
    return color;
}
+ (UIColor *)li_facebookBlue{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0x3b5998);
    return color;
}
+ (UIColor *)li_twitterBlue{
    static UIColor *color = nil;
    if (!color) color = UIColorFromRGB(0x55acee);
    return color;
}
//+ (UIColor *)li_mainBackgroundGradientWithFrame:(CGRect)frame{
//    return GradientColor(UIGradientStyleTopToBottom, frame, (@[[self li_mainBackground],[self li_mainBackgroundDark]]));
//}
//+ (UIColor *)li_mainBackgroundGradient3WithFrame:(CGRect)frame{
//    return GradientColor(UIGradientStyleTopToBottom, frame, (@[UIColorFromRGB(0x2BC0E4),UIColorFromRGB(0xEAECC6)]));
//}
//+ (UIColor *)li_mainBackgroundGradient4WithFrame:(CGRect)frame{
//    return GradientColor(UIGradientStyleTopToBottom, frame, (@[UIColorFromRGB(0xFF4E50),UIColorFromRGB(0xF9D423)]));
//}
//+ (UIColor *)li_mainBackgroundGradient5WithFrame:(CGRect)frame{
//    return GradientColor(UIGradientStyleTopToBottom, frame, (@[UIColorFromRGB(0x085078),UIColorFromRGB(0x85D8CE)]));
//}
//+ (UIColor *)lif_featureCoverGradientWithFrame:(CGRect)frame{
//    return GradientColor(UIGradientStyleTopToBottom, frame, (@[[self li_mainBackgroundDark], [self li_mainBackground]]));
//}
- (UIColor *)li_lighterColor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.2, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)li_darkerColor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.8
                               alpha:a];
    return nil;
}
- (UIColor *)li_colorWithAdjustedBrightness:(CGFloat) factor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * factor
                               alpha:a];
    return nil;
}

+ (UIColor *)li_gradient:(double)percent top:(double)topX bottom:(double)bottomX init:(UIColor*)init goal:(UIColor*)goal {
    double t = (percent - bottomX) / (topX - bottomX);
    
    t = MAX(0.0, MIN(t, 1.0));
    
    const CGFloat *cgInit = CGColorGetComponents(init.CGColor);
    const CGFloat *cgGoal = CGColorGetComponents(goal.CGColor);
    
    double r = cgInit[0] + t * (cgGoal[0] - cgInit[0]);
    double g = cgInit[1] + t * (cgGoal[1] - cgInit[1]);
    double b = cgInit[2] + t * (cgGoal[2] - cgInit[2]);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

@end
