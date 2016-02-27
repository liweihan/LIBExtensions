//
//  UICollectionView+LIBExtension.m
//  Pods
//
//  Created by WEIHAN LI on 7/30/15.
//
//

#import "UICollectionView+LIBExtension.h"
#import "NSIndexSet+LIBExtension.h"

@implementation UICollectionView(LIBExtension)

- (NSArray *)li_indexPathsForElementsInRect:(CGRect)rect {
    NSArray *allLayoutAttributes = [self.collectionViewLayout layoutAttributesForElementsInRect:rect];
    if (allLayoutAttributes.count == 0) { return nil; }
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:allLayoutAttributes.count];
    for (UICollectionViewLayoutAttributes *layoutAttributes in allLayoutAttributes) {
        NSIndexPath *indexPath = layoutAttributes.indexPath;
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}
- (void)li_performBatchUpdatesWith:(PHFetchResultChangeDetails *)collectionChanges section:(NSUInteger)section{
    if (![collectionChanges hasIncrementalChanges] || [collectionChanges hasMoves]) {
        // we need to reload all if the incremental diffs are not available
        [self reloadData];
        
    } else {
        // if we have incremental diffs, tell the collection view to animate insertions and deletions
        [self performBatchUpdates:^{
            NSIndexSet *removedIndexes = [collectionChanges removedIndexes];
            if ([removedIndexes count]) {
                [self deleteItemsAtIndexPaths:[removedIndexes li_indexPathsFromIndexesWithSection:section]];
            }
            NSIndexSet *insertedIndexes = [collectionChanges insertedIndexes];
            if ([insertedIndexes count]) {
                [self insertItemsAtIndexPaths:[insertedIndexes li_indexPathsFromIndexesWithSection:section]];
            }
            NSIndexSet *changedIndexes = [collectionChanges changedIndexes];
            if ([changedIndexes count]) {
                [self reloadItemsAtIndexPaths:[changedIndexes li_indexPathsFromIndexesWithSection:section]];
            }
        } completion:NULL];
    }
    
}

@end
