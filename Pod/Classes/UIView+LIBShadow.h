//
//  UIView+Shadow.h
//  Shadow Maker Example
//
//  Created by Philip Yu on 5/14/13.
//  Copyright (c) 2013 Philip Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (LIBShadow)

- (void) li_makeInsetShadow;
- (void) li_makeInsetShadowWithRadius:(float)radius alpha:(float)alpha;
- (void) li_makeInsetShadowWithRadius:(float)radius color:(UIColor *)color directions:(NSArray *)directions;

@end
