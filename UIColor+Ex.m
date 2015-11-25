//
//  UIColor+Ex.m
//
//  Created by Anton Morozov on 27.12.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import "UIColor+Ex.h"

@implementation UIColor (Ex)

+ (UIColor *)colorWithRGBA:(NSUInteger)color
{
    return [UIColor colorWithRed:((color >> 24) & 0xFF) / 255.0f
                           green:((color >> 16) & 0xFF) / 255.0f
                            blue:((color >> 8) & 0xFF) / 255.0f
                           alpha:((color) & 0xFF) / 255.0f];
}

+ (UIColor *)RGBAcolorWithRed:(float)r green:(float)g blue:(float)b alpha:(float)a
{
    return [UIColor colorWithRed:r/255.f
                           green:g/255.f
                            blue:b/255.f
                           alpha:a/255.f];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
