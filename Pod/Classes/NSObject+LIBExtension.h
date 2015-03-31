//
//  NSObject+Extension.h
//  LIBApp
//
//  Created by WEIHAN LI on 7/27/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(LIBExtension)
- (void) performSelector: (SEL) selector
    withBlockingCallback: (dispatch_block_t) block;
@end
