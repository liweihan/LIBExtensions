//
//  LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 9/15/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UIView+LIBExtension.h"
#import <PureLayout.h>
#import "LIBVariables.h"

@implementation  UIView(LIBExtension)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)li_viewFromNib{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass ([self class]) owner:self options:nil] firstObject];
}

- (UIImage *)li_takeSnapshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)li_disableSubviewsTouchDelay{
    for (id obj in self.subviews) {
        if ([obj respondsToSelector:@selector(setDelaysContentTouches:)]) {
            [obj setDelaysContentTouches:NO];
        }
    }
}


-(void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController{
    

    [self li_addChildViewController:childViewController parentViewController:parentViewController edgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    
}

-(void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController edgeInsets:(UIEdgeInsets) edgeInsets{
    
    [parentViewController addChildViewController:childViewController];
    [self addSubview:childViewController.view];
    [childViewController.view autoPinEdgesToSuperviewEdgesWithInsets:edgeInsets];
    
    [childViewController didMoveToParentViewController:parentViewController];
}

@end
