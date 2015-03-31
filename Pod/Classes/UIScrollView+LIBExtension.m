//
//  UIScrollView+LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 2/7/15.
//  Copyright (c) 2015 liweihan. All rights reserved.
//

#import "UIScrollView+LIBExtension.h"

@implementation UIScrollView(LIBExtension)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)li_updateOffsetIfNeeded:(CGFloat)offsetFloat{
    if (self.contentOffset.y != offsetFloat) {
        [self setContentOffset:CGPointMake(0, offsetFloat) animated:NO];
    }
    
}

@end
