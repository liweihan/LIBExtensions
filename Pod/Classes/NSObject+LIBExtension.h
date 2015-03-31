//
//  NSObject+LIBExtension
//
//


#import <Foundation/Foundation.h>

@interface NSObject (LIBExtension)

- (void)li_addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block;
- (void)li_addObserverForName:(NSString *)name usingBlock:(void (^)(NSNotification *note))block;


@end
