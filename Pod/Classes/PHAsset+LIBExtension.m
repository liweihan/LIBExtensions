//
//  PHAsset+LIBExtension.m
//  Pods
//
//  Created by WEIHAN LI on 7/30/15.
//
//

#import "PHAsset+LIBExtension.h"

@implementation PHAsset(LIBExtension)
+ (PHFetchResult *)li_fetchAllPhotos{
    PHFetchOptions *options = [[PHFetchOptions alloc] init];
    options.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    options.predicate = [NSPredicate predicateWithFormat:@"mediaType == %d", PHAssetMediaTypeImage];
    return [PHAsset fetchAssetsWithOptions:options];
}
@end
