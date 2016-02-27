//
//  NSIndexPath+LIBExtension.m
//  Pods
//
//  Created by WEIHAN LI on 6/24/15.
//
//

#import "NSIndexSet+LIBExtension.h"
#import <UIKit/UIKit.h>

@implementation NSIndexSet(LIBExtension)

- (NSArray *)li_indexPathsFromIndexesWithSection:(NSUInteger)section {
    NSMutableArray *indexPaths = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [indexPaths addObject:[NSIndexPath indexPathForItem:idx inSection:section]];
    }];
    return indexPaths;
}
@end
