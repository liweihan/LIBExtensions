//
//  LIFirebase.m
//  Dating
//
//  Created by Weihan Li on 3/30/14.
//  Copyright (c) 2014 WEIHAN LI. All rights reserved.
//

#import "LIBFirebase.h"
//#import "EKQueue.h"
////#import <EXTScope.h>
//#import <Firebase/Firebase.h>

//typedef enum {
//    FEventTypeChildAdded,    // 0, fired when a new child node is added to a location
//    FEventTypeChildRemoved,  // 1, fired when a child node is removed from a location
//    FEventTypeChildChanged,  // 2, fired when a child node at a location changes
//    FEventTypeChildMoved,    // 3, fired when a child node moves relative to the other child nodes at a location
//    FEventTypeValue          // 4, fired when any data changes at a location and, recursively, any children
//} FEventType;
//static  Firebase* firebase;


@interface LIBFirebase ()

//@property (nonatomic, strong) Firebase* firebase;



@end

@implementation LIBFirebase
//- (id) init{
//    self = [super init];
//    if (!self) return self;
//    
//    
//    return self;
//}
//
//+(void)initialize
//{
//    firebase =  [[Firebase alloc] initWithUrl:LIFirebaseHost];
//}
//
//
//+ (void)observe:(FEventType) eventType
//      withQuery:(FQuery *) query
//          model:(Class) Model
//      permanent:(BOOL) permanent
//           list:(BOOL) list
//          block:(void (^) (id response))block
//{
//    if (permanent) {
//        [query observeEventType:eventType withBlock:^(FDataSnapshot *snapshot) {
//            block([self convertWith:snapshot model:Model list:list]);
//        }];
//    }else{
//        [query observeSingleEventOfType:eventType withBlock:^(FDataSnapshot *snapshot) {
//            block([self convertWith:snapshot model:Model list:list]);
//            
//        }];
//    }
//}
//
//+ (id) convertWith:(FDataSnapshot *) snapshot
//             model:(Class) Model
//              list:(BOOL) list
//{
//    LIModel * model;
//    if (list) {
//        NSMutableArray* list = [NSMutableArray arrayWithCapacity: [snapshot.value count]];
//        //NSArray* models = [[Model alloc] arrayOfModelsFromDictionaries: snapshot.value];
//        
//        for (NSDictionary * item in snapshot.value) {
//            model = [[Model alloc] initWithDictionary:item error: nil];
//            model.name = snapshot.name;
//            [list addObject:model];
//        }
//        return list;
//        
//    }else{
//        model = [[Model alloc] initWithDictionary:snapshot.value error: nil];
//        model.name = snapshot.name;
//        
//        return model;
//    }
//    
//}
//
//+ (void) checkAuthStatus: (void(^)(NSError * error, FAUser * user)) completion {
//    
//    [[self simpleLogin] checkAuthStatusWithBlock:^(NSError * error, FAUser * user) {
//        completion(error, user);
//    }];
//    
//}
//
//+ (Firebase *) firebaseWithPath: (NSString *) path{
//    return [firebase childByAppendingPath: path];
//}
//
//+(void) setDataWithPath:(NSString *) path data: (NSDictionary *) data{
//    
//    Firebase* child = [self firebaseWithPath:path];
//    [child setValue:data];
//}
//
//+(void) setListDataWithPath:(NSString *) path data:(NSDictionary *) data{
//    
//    
//    Firebase* child = [[self firebaseWithPath:path] childByAutoId];
//    
//    [child setValue:data];
//}
//
////////////////
//+ (void) setUserWithData:(NSDictionary *) user name:(NSString *) name{
//    NSString * path = [NSString stringWithFormat:@"%@/%@", LIFirebasePathUsers, name];
//    [LIFirebase setDataWithPath:path data: user];
//    
//}
//
//+(void) currentUser:(NSString *) uid{
//    [LIFirebase observe: FEventTypeValue
//              withQuery:[LIFirebase firebaseWithPath:LIFirebasePathUsers]
//                  model:[LIUser class]
//              permanent:NO
//                   list:NO
//                  block:^(id response) {
//                      //currentUser = (LIUser *)response;
//                  }];
//}




//    NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
@end




