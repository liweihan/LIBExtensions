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


- (void)li_setImageWithURL:(NSURL *)url{
    [self li_setImageWithURL:url block:nil];

}

- (void)li_setImageWithURL:(NSURL *)url block:(void (^)(NSError *error))block {
    [self sd_setImageWithURL:url
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (image && cacheType == SDImageCacheTypeNone){
                           self.alpha = 0.0;
                           [UIView animateWithDuration:0.4
                                            animations:^{
                                                self.alpha = 1.0;
                                            } completion:^(BOOL finished) {
                                                block(error);
                                            }];
                           
                       }else{
                           if (!image) {
                               NSLog(@"NO IMAGE error: %@", [error description]);
                           }
                           block(error);
                       }
                   }];
}

- (PMKPromise *)li_promiseImageWithURL:(NSURL *)url{
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        [self li_setImageWithURL:url block:^(NSError *error){
            resolve(error?:self.image);
        }];

    }];
    
}

- (void)li_setTintColor:(UIColor *) color{
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setTintColor:color];
}

@end
