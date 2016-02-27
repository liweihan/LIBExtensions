//
//  UIViewController+Extension.m
//  LIBApp
//
//  Created by WEIHAN LI on 7/14/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UIViewController+LIBExtension.h"


@implementation UIViewController(LIBExtension)


+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name{
    return [self li_viewControllerWithStoryboard:name identifier:nil bundleName:nil];
}
+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name bundleName:(NSString *) bundleName{
    return [self li_viewControllerWithStoryboard:name identifier:nil bundleName:bundleName];
}

+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name identifier:(NSString *) identifier{
    return [self li_viewControllerWithStoryboard:name identifier:identifier bundleName:nil];
}
+ (instancetype) li_viewControllerWithStoryboard:(NSString *) name identifier:(NSString *) identifier bundleName:(NSString *) bundleName{
    NSBundle *bundle = nil;
    if (bundleName) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
        bundle               = [NSBundle bundleWithPath:bundlePath];
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:bundle];
    
    if (identifier) {
        return [storyboard instantiateViewControllerWithIdentifier: identifier];
    }else{
        return [storyboard instantiateInitialViewController];
    }
    
}


- (void)li_addChildController:(UIViewController *) childController{

    [self addChildViewController:childController];
    [self didMoveToParentViewController:self];
}
- (void)li_removeFromParentViewController{
    
    [self willMoveToParentViewController:nil];
    [self removeFromParentViewController];
}
- (BOOL)li_isVisible{
    return [self isViewLoaded] && self.view.window;
}
@end
