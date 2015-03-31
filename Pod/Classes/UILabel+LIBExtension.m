//
//  UILabel+LIBExtension.m
//  LIBApp
//
//  Created by WEIHAN LI on 11/3/14.
//  Copyright (c) 2014 liweihan. All rights reserved.
//

#import "UILabel+LIBExtension.h"
#import "UIColor+LIBExtension.h"
@implementation UILabel(LIBExtension)

-(void) li_setupDefaultLabelWithFontSize:(NSInteger) size{
    
    [self li_setupDefaultLabelWithFont:[UIFont boldSystemFontOfSize:size]];
    

}
-(void) li_setupDefaultLabelWithFont:(UIFont *) font{
    
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.font = font;
    self.textColor = [UIColor li_mainForeground];
    self.textAlignment = NSTextAlignmentCenter;
//    self.numberOfLines = 1;

}
@end
