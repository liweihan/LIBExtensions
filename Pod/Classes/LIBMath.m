//
//  LIBMath.m
//  Pods
//
//  Created by WEIHAN LI on 8/21/15.
//
//

#import "LIBMath.h"

@implementation LIBMath
+ (NSUInteger)roundUp:(NSUInteger) numToRound multiple:(NSUInteger) multiple{
    if(multiple == 0){
        return numToRound;
    }
    NSUInteger remainder = numToRound % multiple;
    if (remainder == 0){
        return numToRound;
    }
    return numToRound + multiple - remainder;
}
@end
