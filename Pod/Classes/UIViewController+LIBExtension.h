//
//  UIViewController+Extension.h
//  LIBApp
//
//  Created by WEIHAN LI on 7/14/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController(LIBExtension)

+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name;
+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name bundleName:(NSString *) bundleName;

+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name identifier:(NSString *) identifier;
+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name identifier:(NSString *) identifier bundleName:(NSString *) bundleName;

- (void)li_addChildController:(UIViewController *) childController;
- (void)li_removeFromParentViewController;

- (BOOL)li_isVisible;
@end
