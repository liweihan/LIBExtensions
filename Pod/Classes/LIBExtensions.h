//
//  LIBDefines.h
//  LIBApp
//
//  Created by WEIHAN LI on 5/17/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//


#import "UIColor+LIBExtension.h"

#import "UIImageView+LIBExtension.h"
#import "UIImage+LIBExtension.h"

#import "UIViewController+LIBExtension.h"
#import "UIView+LIBExtension.h"

#import "UILabel+LIBExtension.h"
#import "CAMediaTimingFunction+LIBExtension.h"

#import "UIScrollView+LIBExtension.h"
#import "LIBVariables.h"


#define SHOULD_ON_BACKGROUND_THREAD NSAssert(![NSThread isMainThread], @"Do not run on MAIN thread");

#define LILocationChina 8
#define LILocationInternational -5

#define LIB_CALLED NSLog(@"CALLED: %s", __FUNCTION__)


#ifdef DEBUG
#define LILog( s, ... ) NSLog( @"<%@:%d> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define LILog( s, ... )
#endif



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
#define UA_runOnMainThread if (![NSThread isMainThread]) { dispatch_sync(dispatch_get_main_queue(), ^{ [self performSelector:_cmd]; }); return; };
#pragma clang diagnostic pop

