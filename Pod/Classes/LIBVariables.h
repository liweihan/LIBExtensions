//
//  LIBVariables.h
//  RPSlidingMenuDemo
//
//  Created by Weihan Li on 4/26/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LIBVariables : NSObject


+ (CGFloat) screenWidth;
+ (CGFloat) screenHeight;
+ (CGPoint) screenCenter;
+ (CGRect)  screenBoundsAboveTabBar;

+ (CGFloat) screenScale;

+ (CGFloat)maxScreenWidth;

+ (CGFloat)featureRatio;

+ (CGFloat) statusBarHeight;
+ (CGFloat) navBarHeight;
+ (CGFloat) tabBarHeight;
+ (NSArray *) facebookPermissions;


@end
