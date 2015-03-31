//
//  LIBStatusBarView.m
//  LIBApp
//
//  Created by WEIHAN LI on 9/2/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "LIBStatusBarView.h"
#import "LIBVariables.h"

@implementation LIBStatusBarView
+ (UIView *)view{
    return [self viewWithFrame:CGRectMake(0.0f, 0.0f,[LIBVariables screenWidth], 20)];
}

+ (UIView *) viewWithFrame:(CGRect)frame{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSArray *colors = @[(id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                        (id)[[UIColor colorWithWhite:0 alpha:.4] CGColor]];
    [gradientLayer setColors:colors];
    [gradientLayer setStartPoint:CGPointMake(0.0f, 1.0f)];
    [gradientLayer setEndPoint:CGPointMake(0.0f, 0.0f)];
    [gradientLayer setFrame:CGRectMake(0.0f, 0.0f, [LIBVariables screenWidth], 20)];
    
    UIView * statusBarBackground = [[UIView alloc] initWithFrame:frame];
    statusBarBackground.backgroundColor =[UIColor blackColor];
    [[statusBarBackground layer] setMask:gradientLayer];
    
    return statusBarBackground;
}


@end
