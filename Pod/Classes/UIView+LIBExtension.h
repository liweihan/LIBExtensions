//
//  LIBExtension.h
//  LIBApp
//
//  Created by WEIHAN LI on 9/15/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(LIBExtension)
+(instancetype)li_viewFromNibWithOwner:(id) owner bundleName:(NSString *)bundleName;
- (UIImage *)li_snapshotImage;
- (void)li_disableSubviewsTouchDelay;

- (void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController;

- (void)li_addChildViewController:(UIViewController *)childViewController
            parentViewController:(UIViewController *)parentViewController edgeInsets:(UIEdgeInsets) edgeInsets;

- (void)li_fadeInWithDuration:(CGFloat)duration;
- (void)li_animateToAlpha:(CGFloat)alpha duration:(CGFloat)duration;
- (void)li_animateToScaleWithRatio:(CGFloat) ratio;
- (void)li_cornerToWidth;

- (NSArray *)li_addSubview:(UIView *)view removeConstraints:(NSArray *) constraints;
- (void)li_removeAllSubviews;
- (void)li_pinEdgesToSuperview;

@end
