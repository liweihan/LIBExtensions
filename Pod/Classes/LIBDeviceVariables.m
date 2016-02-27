//
//  LIBDeviceVariables.m
//  RPSlidingMenuDemo
//
//  Created by Weihan Li on 4/26/14.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "LIBDeviceVariables.h"
//const CGFloat RPSlidingCellFeatureHeight = 400.0f;
//const CGFloat RPSlidingCellCollapsedHeight = 88.0f;
//const CGFloat RPSlidingCellDetailTextPadding = 20.0f;
//const CGFloat RPSlidingMenuNormalImageCoverAlpha = 0.5f;
//const CGFloat RPSlidingMenuFeaturedImageCoverAlpha = 0.2f;

static CGRect screenRect;



@implementation LIBDeviceVariables
+ (void)initialize
{
    screenRect   = [[UIScreen mainScreen] bounds];
//    NSLog(@"nativeScale %f",[[UIScreen mainScreen] nativeScale]);
//    NSLog(@"scale %f",[[UIScreen mainScreen] scale]);

}




+ (CGFloat)screenScale{
    return [[UIScreen mainScreen] scale];
}

+ (CGFloat)statusBarHeight{
    return 20;
}
+ (CGFloat)navBarHeight{
    return 44;
}
+ (CGFloat)tabBarHeight{
    return 54;
}

+ (CGFloat) screenWidth{
    return screenRect.size.width;
}

+ (CGFloat) screenHeight{
    //NSLog(@"height %f",screenRect.size.height);

    return screenRect.size.height;
}

+ (CGRect) screenBoundsAboveTabBar{
    return CGRectMake(0, 0, screenRect.size.width, screenRect.size.height - [self tabBarHeight]);
}

+ (CGFloat)maxScreenWidth{
    // 6plus
    return 414.0;
}

+ (CGFloat) toolBarHeight{
    return 44;
}


+(CGPoint) screenCenter{
    return CGPointMake([self screenWidth]/2, [self screenHeight]/2);
}

+(NSArray *) facebookPermissions{
    
    return @[@"public_profile",
             @"email",
             @"user_photos",
             @"user_friends",
             ];

}
//return @[@"public_profile",
//@"email",
//@"user_friends",
//@"user_about_me",
//@"user_birthday",
//@"user_education_history",
//@"user_relationship_details",
//@"user_hometown",
//@"user_interests",
//@"user_religion_politics",
//@"read_friendlists",
//@"user_likes"];
@end
