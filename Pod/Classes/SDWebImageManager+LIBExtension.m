//
//  SDWebImageManager+LIBExtension.m
//  Pods
//
//  Created by WEIHAN LI on 6/26/15.
//
//

#import "SDWebImageManager+LIBExtension.h"


@implementation SDWebImageManager(LIBExtension)
+ (PMKPromise *)li_promiseToDownloadImageWithURL:(NSURL *)URL{
    return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
        SDWebImageManager *manager = [SDWebImageManager sharedManager];
        [manager downloadImageWithURL:URL
                              options:0
                             progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                 
                             }
                            completed:^(UIImage *image,
                                        NSError *error,
                                        SDImageCacheType cacheType,
                                        BOOL finished,
                                        NSURL *imageURL) {
                                
                                LIWebImageResult *result = [[LIWebImageResult alloc]init];
                                result.image = image;
                                result.cacheType = cacheType;
                                result.finished = finished;
                                
                                resolve(error?:result);
                                
                            }];
 
        
    }];
    

}

@end
@implementation LIWebImageResult

@end