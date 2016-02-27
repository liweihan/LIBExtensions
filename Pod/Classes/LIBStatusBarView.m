//
//  LIBStatusBarView.m
//  LIBApp
//
//  Created by WEIHAN LI on 9/2/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "LIBStatusBarView.h"
#import "LIBDeviceVariables.h"

@implementation LIBStatusBarView
- (void)commonInit{

}

- (void)awakeFromNib{
    [super awakeFromNib];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSArray *colors                = @[(id)[[UIColor colorWithWhite:0 alpha:0] CGColor],
                                       (id)[[UIColor colorWithWhite:0 alpha:.4] CGColor]];
    [gradientLayer setColors:colors];
    [gradientLayer setStartPoint:CGPointMake(0.0, 1.0)];
    [gradientLayer setEndPoint:CGPointZero];
    [gradientLayer setFrame:CGRectMake(0.0, 0.0, [LIBDeviceVariables screenWidth], 20)];

    self.backgroundColor = [UIColor blackColor];
    self.layer.mask      = gradientLayer;
}

- (id)initWithFrame:(CGRect)aRect{
    if ((self = [super initWithFrame:aRect ])) {
        [self commonInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder*)coder{
    if ((self = [super initWithCoder:coder])) {
        [self commonInit];
    }
    return self;
}
- (id)init{
    if ((self = [super init])) {
        [self commonInit];
    }
    return self;
}


@end
