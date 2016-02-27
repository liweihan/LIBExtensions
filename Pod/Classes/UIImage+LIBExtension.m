//
//  UIImage+LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 12/18/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UIImage+LIBExtension.h"
#import "PromiseKit.h"
#import "SDWebImageManager+LIBExtension.h"

@implementation UIImage (LIBExtension)
//- (UIImage *)li_imageWithColor:(UIColor *)color {
//    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    return image;
//}
- (UIImage *)li_imageWithColor:(UIColor *)color
{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


//- (UIImage *)imageBlackAndWhite
//{
//    CIImage *beginImage = [CIImage imageWithCGImage:self.CGImage];
//    
//    CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, beginImage, @"inputBrightness", [NSNumber numberWithFloat:0.0], @"inputContrast", [NSNumber numberWithFloat:1.1], @"inputSaturation", [NSNumber numberWithFloat:0.0], nil].outputImage;
//    CIImage *output = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:kCIInputImageKey, blackAndWhite, @"inputEV", [NSNumber numberWithFloat:0.7], nil].outputImage;
//    
//    CIContext *context = [CIContext contextWithOptions:nil];
//    CGImageRef cgiimage = [context createCGImage:output fromRect:output.extent];
//    //UIImage *newImage = [UIImage imageWithCGImage:cgiimage];
//    UIImage *newImage = [UIImage imageWithCGImage:cgiimage scale:image.scale orientation:image.imageOrientation];
//    CGImageRelease(cgiimage);
//    
//    return newImage;
//}
- (UIImage *)li_imageWithEffect:(LIImageEffect)effect
{
    NSString *effectName = REFStringForMember(effect);
    
    CIImage *ciimage = [[CIImage alloc] initWithImage:self];
    CIFilter *filter = [CIFilter filterWithName:effectName keysAndValues:kCIInputImageKey, ciimage, nil];
    //@"inputIntensity", @0.8,
    //Creates a CIFilter object for a specific kind of filter and initializes the input values.
    [filter setDefaults]; //reset filter to default values
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *output = [filter outputImage]; //apply filter and return a CIImage
    CGImageRef cgimage = [context createCGImage:output fromRect:[output extent]];
    
    UIImage *newImage = [UIImage imageWithCGImage:cgimage scale:0 orientation:[self imageOrientation]];
    CGImageRelease(cgimage);
    
    
    return newImage;
}
- (PMKPromise *)li_promiseImageWithEffect:(LIImageEffect)effect originalURI:(NSString *)originalURI{

    return dispatch_promise(^(){
        NSString *key  = [NSString stringWithFormat:@"%@+%@", REFStringForMember(effect), originalURI];
        UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:key];
        if (!image){
            image = [self li_imageWithEffect:effect];
            [[SDImageCache sharedImageCache] storeImage:image forKey:key];
        }
        return image;
    });
}
+ (PMKPromise *)li_promiseImageWithURI:(NSString *)imageURI{
    if (imageURI) {
        if ([imageURI hasPrefix:@"https://"] || [imageURI hasPrefix:@"http://"])
        {
            return [SDWebImageManager li_promiseToDownloadImageWithURL:[NSURL URLWithString:imageURI]].then(^(LIWebImageResult *result){
                return result.image;
            });
        }else{
            return [PMKPromise promiseWithResolver:^(PMKResolver resolve) {
                UIImage *image = [UIImage imageNamed:imageURI];
                resolve(image?:[NSError errorWithDomain:@"LIBImageError" code:100 userInfo:nil]);
                
            }];
        }
    }
    return nil;
}
//    ([[NSFileManager defaultManager] fileExistsAtPath:imageURI]) {
//
//    }
//CIImage *beginImage = [CIImage imageWithCGImage:self.CGImage];
//
//CIImage *output = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:kCIInputImageKey, beginImage, @"inputIntensity", [NSNumber numberWithFloat:1.0], @"inputColor", [[CIColor alloc] initWithColor:[UIColor whiteColor]], nil].outputImage;
//
//CIContext *context = [CIContext contextWithOptions:nil];
//CGImageRef cgiimage = [context createCGImage:output fromRect:output.extent];
//UIImage *newImage = [UIImage imageWithCGImage:cgiimage];
//
//CGImageRelease(cgiimage);

@end
