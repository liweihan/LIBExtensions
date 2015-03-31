//
//  LIBExtension.h
//  LIBApp
//
//  Created by WEIHAN LI on 9/15/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(LIBExtension)
+(instancetype)li_viewFromNib;
- (UIImage *)li_takeSnapshot;
- (void)li_disableSubviewsTouchDelay;

-(void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController;

-(void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController edgeInsets:(UIEdgeInsets) edgeInsets;
@end
