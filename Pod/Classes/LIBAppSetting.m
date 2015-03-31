//
//  LIBAppearance.m
//  LIBApp
//
//  Created by WEIHAN LI on 10/27/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "LIBAppSetting.h"
#import "UIColor+LIBExtension.h"

@implementation LIBAppSetting
+ (void)appearance{
    [UINavigationBar appearance].barTintColor = [UIColor li_mainBackgroundDark];
    [UINavigationBar appearance].tintColor = [UIColor li_mainForeground];
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor li_mainForeground]};
    
    [[UITabBar appearance] setBarTintColor:[UIColor li_mainBackgroundDark]];
//    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor li_mainForeground]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
}

+ (void)registerNotification{

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:
         [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
    }
}
@end
