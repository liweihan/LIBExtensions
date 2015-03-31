//
//  NSObject+LIBExtension
//
//

#import "NSObject+LIBExtension.h"
#import <objc/runtime.h>

typedef void (^liDeallocBlock)();

@interface NSObject (liAutoRemovalNotificationHelper)

@property (nonatomic, strong, setter=li_setDeallocContext:) id li_deallocContext;

- (void)li_setDeallocBlock:(liDeallocBlock)block;

@end


@implementation NSObject (liAutoRemovalNotification)

- (void)li_addObserverForName:(NSString *)name
                        object:(id)obj
                         queue:(NSOperationQueue *)queue
                    usingBlock:(void (^)(NSNotification *))block
{
  id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:obj queue:queue usingBlock:block];
  NSMutableArray *observers = [self li_deallocContext];
  if (!observers) {
    observers = [[NSMutableArray alloc] init];
    [self li_setDeallocContext:observers];
    __weak typeof(self) weakSelf = self;
    [self li_setDeallocBlock:^{
      for (id o in weakSelf.li_deallocContext)
        [[NSNotificationCenter defaultCenter] removeObserver:o];
    }];
  }
  
  [observers addObject:observer];
}

- (void)li_addObserverForName:(NSString *)name
                    usingBlock:(void (^)(NSNotification *))block
{
  [self li_addObserverForName:name object:nil queue:nil usingBlock:block];
}

@end

@interface liDeallocBlockBox : NSObject

@property (nonatomic, retain) id context;
@property (nonatomic, copy) liDeallocBlock block;

@end

static char kBlockBoxKey;

@implementation NSObject (liAutoRemovalNotificationHelper)

- (id)li_deallocContext
{
  return [self li_box].context;
}

- (void)li_setDeallocContext:(id)context
{
  [self li_box].context = context;
}

- (void)li_setDeallocBlock:(liDeallocBlock)block
{
  [self li_box].block = block;
}

- (liDeallocBlockBox *)li_box
{
  liDeallocBlockBox *box = objc_getAssociatedObject(self, &kBlockBoxKey);
  if (!box) {
    box = [[liDeallocBlockBox alloc] init];
    objc_setAssociatedObject(self, &kBlockBoxKey, box, OBJC_ASSOCIATION_RETAIN);
  }
  
  return box;
}

@end

@implementation liDeallocBlockBox

- (void)dealloc
{
  if (self.block)
    self.block();
}

@end
