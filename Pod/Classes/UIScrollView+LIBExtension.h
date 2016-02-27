//
//  UIScrollView+LIBExtension.h
//  LIBApp
//
//  Created by WEIHAN LI on 2/7/15.
//  Copyright (c) 2015 liweihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CAMediaTimingFunction+LIBExtension.h"

@interface UIScrollView(LIBExtension)

- (void)li_updateVerticalOffsetIfNeeded:(CGFloat)offsetFloat;
- (void)li_updateHorizontalOffsetIfNeeded:(CGFloat)offsetFloat;

- (void)li_scrollToOffset:(CGFloat)offset
                animation:(LIBTimingFuctionType)animation
                 duration:(CGFloat)duration
                    block:(void(^)(BOOL finished))block;
- (void)li_stopSrollAnimation;
@end
