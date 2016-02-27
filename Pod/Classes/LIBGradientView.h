//
//  LIBGradientView.h
//  Pods
//
//  Created by WEIHAN LI on 8/14/15.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LIBGradientView : UIView

// An Array of UIColors for the gradient
@property (nonatomic, readwrite) NSArray *colors;

// Specifies that the gradient should be drawn horizontally
@property (nonatomic, getter = isHorizontal) BOOL horizontal;

- (CAGradientLayer *)gradientLayer;
@end
