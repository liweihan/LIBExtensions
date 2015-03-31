//
//  UIColor+LightAndDark.h
//  dating
//
//  Created by Weihan Li on 4/9/14.
//  Copyright (c) 2014 WEIHAN LI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface  UIColor(LIBExtension)
- (UIColor *)lighterColor;
- (UIColor *)darkerColor;

+ (UIColor *)li_mainBackgroundDark;
+ (UIColor *)li_mainBackground;
+ (UIColor *)li_mainForegroundDark;
+ (UIColor *)li_mainForeground;

+ (UIColor *)li_unreadBackground;
+ (UIColor *)li_facebookBlue;
+ (UIColor *)li_twitterBlue;
+ (UIColor *)li_mainBackgroundGradientWithFrame:(CGRect)frame;

+ (UIColor *)lif_featureCoverGradientWithFrame:(CGRect)frame;

+ (UIColor *)li_gradient:(double)percent top:(double)topX bottom:(double)bottomX init:(UIColor*)init goal:(UIColor*)goal;

@end
