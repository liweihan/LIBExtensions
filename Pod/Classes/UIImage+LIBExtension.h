//
//  UIImage+LIBExtension.h
//  LIBApp
//
//  Created by WEIHAN LI on 12/18/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PromiseKit.h>
#import <ReflectableEnum.h>

REFLECTABLE_ENUM(NSInteger, LIImageEffect,
                 CILinearToSRGBToneCurve,
                 CIPhotoEffectChrome,
                 CIPhotoEffectFade,
                 CIPhotoEffectInstant,
                 CIPhotoEffectMono,
                 CIPhotoEffectNoir,
                 CIPhotoEffectProcess,
                 CIPhotoEffectTonal,
                 CIPhotoEffectTransfer,
                 CISRGBToneCurveToLinear,
                 CIVignetteEffect,
                 CISepiaTone,
                 );
@interface UIImage (LIBExtension)

- (UIImage *)li_imageWithColor:(UIColor *)color;

- (PMKPromise *)li_promiseImageWithEffect:(LIImageEffect)effect originalURI:(NSString *)originalURI;

+ (PMKPromise *)li_promiseImageWithURI:(NSString *)imageURI;

@end
