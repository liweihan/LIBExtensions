//
//  SDWebImageManager+LIBExtension.h
//  Pods
//
//  Created by WEIHAN LI on 6/26/15.
//
//

#import "SDWebImageManager.h"
#import <PromiseKit.h>

@interface SDWebImageManager(LIBExtension)
+ (PMKPromise *)li_promiseToDownloadImageWithURL:(NSURL *)URL;

@end

@interface LIWebImageResult:NSObject
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) SDImageCacheType cacheType;
@property (nonatomic, assign) BOOL finished;

@end
