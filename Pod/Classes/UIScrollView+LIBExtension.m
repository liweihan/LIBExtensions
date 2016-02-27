//
//  UIScrollView+LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 2/7/15.
//  Copyright (c) 2015 liweihan. All rights reserved.
//

#import "UIScrollView+LIBExtension.h"
#import <POP.h>

@implementation UIScrollView(LIBExtension)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)li_updateVerticalOffsetIfNeeded:(CGFloat)offsetFloat{
    if (self.contentOffset.y != offsetFloat) {
        [self setContentOffset:CGPointMake(0, offsetFloat) animated:NO];
    }
}
- (void)li_updateHorizontalOffsetIfNeeded:(CGFloat)offsetFloat{
    if (self.contentOffset.x != offsetFloat) {
        [self setContentOffset:CGPointMake(offsetFloat, 0) animated:NO];
    }
}
- (void)li_scrollToOffset:(CGFloat)offset
                animation:(LIBTimingFuctionType)animation
                 duration:(CGFloat)duration
                    block:(void(^)(BOOL finished))block{
    

    
    if (animation == LIBTimingFuctionTypeNone) {
        [self li_stopSrollAnimation];

        [self li_updateVerticalOffsetIfNeeded:offset];
        if (block) {
            block(YES);
        }
        
    }else{
        
        POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPCollectionViewContentOffset];
        anim.duration = duration;
        //        anim.fromValue = [NSValue valueWithCGPoint: self.collectionView.contentOffset];
        
        anim.toValue = [NSValue valueWithCGPoint: CGPointMake(0.0f, offset)];
        
        anim.timingFunction = [CAMediaTimingFunction li_timingFunctionWithType:animation];
        anim.removedOnCompletion = YES;
        [anim setCompletionBlock:^(POPAnimation * animation, BOOL finished) {
            // [self scrollViewDidEndScrollingAnimation:self.collectionView];
            if (block) {
                block(finished);
            }
        }];
        [self pop_addAnimation:anim forKey:@"scrollAnimation"];
    }
}
- (void)li_stopSrollAnimation{
    if([self pop_animationForKey:@"scrollAnimation"]){
        [self pop_removeAnimationForKey:@"scrollAnimation"];

    }

}
@end
