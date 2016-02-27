//
//  LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 9/15/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UIView+LIBExtension.h"
#import <PureLayout.h>
#import "LIBDeviceVariables.h"
#import <POP+MCAnimate.h>

@implementation  UIView(LIBExtension)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)li_viewFromNibWithOwner:(id) owner bundleName:(NSString *)bundleName{
    NSBundle *bundle = nil;
    if (bundleName) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
        bundle               = [NSBundle bundleWithPath:bundlePath];
    }else{
        bundle = [NSBundle mainBundle];
    }
    NSString *fileName = NSStringFromClass ([self class]) ;
    return [[bundle loadNibNamed:fileName owner:owner options:nil] firstObject];
}

- (UIImage *)li_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)li_pinEdgesToSuperview{
    [self autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];

}
- (void)li_fadeInWithDuration:(CGFloat)duration{
    self.alpha = 0.0;
    [UIView animateWithDuration:duration > 0?duration:0.25
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.alpha = 0.5;
                     }
                     completion:NULL];
    
}
- (void)li_animateToAlpha:(CGFloat)alpha duration:(CGFloat)duration{
    if (self.alpha != alpha) {
        [UIView animateWithDuration:duration > 0?duration:0.25
                              delay:0
                            options:UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             self.alpha = alpha <= 1.0 ? alpha:1.0;
                         }
                         completion:NULL];
    }

}
- (void)li_animateToScaleWithRatio:(CGFloat) ratio{
    self.pop_springBounciness = 0;
    self.pop_springSpeed = 40;
    self.pop_spring.pop_scaleXY = CGPointMake(ratio, ratio);
}

- (NSArray *)li_addSubview:(UIView *)view removeConstraints:(NSArray *) constraints{
    [self addSubview:view];
    [constraints autoRemoveConstraints];
    return [view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}
- (void)li_removeAllSubviews{
    [self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
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
    

    [self li_addChildViewController:childViewController parentViewController:parentViewController edgeInsets:UIEdgeInsetsZero];
    
}

-(void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController edgeInsets:(UIEdgeInsets) edgeInsets{
    
    [parentViewController addChildViewController:childViewController];
    [self addSubview:childViewController.view];
    [childViewController.view autoPinEdgesToSuperviewEdgesWithInsets:edgeInsets];
    [childViewController didMoveToParentViewController:parentViewController];
}

- (void)li_cornerToWidth{
    self.layer.cornerRadius = self.bounds.size.width/2.0;
    
}

@end
