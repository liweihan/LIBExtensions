//
//  UIImageView+Extension.h
//  LIBApp
//
//  Created by WEIHAN LI on 8/11/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <PromiseKit.h>

@interface UIImageView (LIBExtension)

- (void)li_setImageWithURL:(NSURL *)url;
- (PMKPromise *)li_promiseImageWithURL:(NSURL *)url;
- (void)li_setTintColor:(UIColor *) color;
@end