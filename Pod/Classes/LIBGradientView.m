//
//  LIBGradientView.m
//  Pods
//
//  Created by WEIHAN LI on 8/14/15.
//
//

#import "LIBGradientView.h"
#import "UIColor+LIBExtension.h"

#define HORIZONTAL_START_POINT  CGPointMake(0, 0.5)
#define HORIZONTAL_END_POINT    CGPointMake(1, 0.5)
#define VERTICAL_START_POINT    CGPointMake(0.5, 0)
#define VERTICAL_END_POINT      CGPointMake(0.5, 1)

@interface LIBGradientView ()

@end
@implementation LIBGradientView

#pragma mark - UIView

+ (Class)layerClass
{
    return [CAGradientLayer class];
}

#pragma mark - Accessors

- (CAGradientLayer *)gradientLayer
{
    return (CAGradientLayer *)self.layer;
}

- (void)setColors:(NSArray *)colors
{
    NSMutableArray *cgColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (UIColor *color in colors)
    {
        [cgColors addObject:(id)[color CGColor]];
    }
    
    self.gradientLayer.colors = cgColors;
}

- (NSArray *)colors
{
    NSMutableArray *uiColors = [NSMutableArray arrayWithCapacity:self.gradientLayer.colors.count];
    for (id color in self.gradientLayer.colors)
    {
        [uiColors addObject:[UIColor colorWithCGColor:(CGColorRef)color]];
    }
    
    return uiColors;
}

- (void)setHorizontal:(BOOL)horizontal
{
    self.gradientLayer.startPoint = horizontal ? HORIZONTAL_START_POINT : VERTICAL_START_POINT;
    self.gradientLayer.endPoint   = horizontal ? HORIZONTAL_END_POINT : VERTICAL_END_POINT;
}

- (BOOL)isHorizontal
{
    return (CGPointEqualToPoint(self.gradientLayer.startPoint, HORIZONTAL_START_POINT)) && (CGPointEqualToPoint(self.gradientLayer.endPoint, HORIZONTAL_END_POINT));
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initGradientLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self initGradientLayer];
    }
    return self;
}

// Make custom configuration of your gradient here
- (void)initGradientLayer {
    self.colors = @[[UIColor clearColor], [[UIColor blackColor] colorWithAlphaComponent:0.6]];
}

@end
