//
//  LIBCircularImageView.m
//  LIBApp
//
//  Created by WEIHAN LI on 9/1/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "LIBCircularImageView.h"
#import "UIImageView+LIBExtension.h"
@implementation LIBCircularImageView

- (void)commonInit
{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self addMaskToBounds:self.frame];
}

- (void)setupImageWithURL:(NSString *)url{
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    [self li_setImageWithURL: [NSURL URLWithString:url]];
}

#pragma mark - Private methods
- (void)addMaskToBounds:(CGRect)maskBounds
{
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
	
    CGPathRef maskPath = CGPathCreateWithEllipseInRect(maskBounds, NULL);
    maskLayer.bounds = maskBounds;
	maskLayer.path = maskPath;
    maskLayer.fillColor = [UIColor blackColor].CGColor;
    
    CGPoint point = CGPointMake(maskBounds.size.width/2, maskBounds.size.height/2);
    maskLayer.position = point;
    
	[self.layer setMask:maskLayer];
    //
    // And then create the outline layer
    //
    CAShapeLayer*   shape   = [CAShapeLayer layer];
    shape.bounds            = maskBounds;
    shape.path              = maskPath;
    shape.lineWidth         = 0.5f;
    shape.strokeColor       = [UIColor blackColor].CGColor;
    shape.fillColor         = [UIColor clearColor].CGColor;
    shape.position          = point;
    
    [self.layer addSublayer:shape];
    
    CGPathRelease(maskPath);
}

- (id)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self) {
        [self commonInit];
    }
    return self;
}

@end
