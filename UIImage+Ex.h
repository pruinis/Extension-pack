//
//  UIImage+Ex.h
//
//  Created by Anton Morozov on 20.01.14.
//  Copyright (c) 2014 Anton Morozov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)rotate:(UIImage *)src andOrientation:(UIImageOrientation)orientation;
- (UIImage *)fixOrientation;
- (UIImage *)maskWithColor:(UIColor*)color;

@end
