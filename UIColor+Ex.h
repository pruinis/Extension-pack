//
//  UIColor+Ex.h
//
//  Created by Anton Morozov on 27.12.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface UIColor (Ex)

+ (UIColor *)colorWithRGBA:(NSUInteger)color;
+ (UIColor *)RGBAcolorWithRed:(float)r green:(float)g blue:(float)b alpha:(float)a;
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end
