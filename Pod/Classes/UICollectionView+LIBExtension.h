//
//  UICollectionView+LIBExtension.h
//  Pods
//
//  Created by WEIHAN LI on 7/30/15.
//
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface UICollectionView(LIBExtension)
- (NSArray *)li_indexPathsForElementsInRect:(CGRect)rect;
- (void)li_performBatchUpdatesWith:(PHFetchResultChangeDetails *)collectionChanges section:(NSUInteger)section;

@end
