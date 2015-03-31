//
//  UIImageView+Extension.m
//  LIBApp
//
//  Created by WEIHAN LI on 8/11/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UIImageView+LIBExtension.h"
#import <UIImageView+WebCache.h>
@interface UIImageView ()

@end
@implementation UIImageView(LIBExtension)


- (void)li_setImageWithURL:(NSString *)url{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url]
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (image && cacheType == SDImageCacheTypeNone)
                       {
                           self.alpha = 0.0;
                           [UIView animateWithDuration:0.5
                                            animations:^{
                                                self.alpha = 1.0;
                                            }];
                       }
                   }];
}
- (void)li_setTintColor:(UIColor *) color{
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setTintColor:color];
}

@end
