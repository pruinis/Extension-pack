//
//  UIView+Ex.h
//
//  Created by Anton Morozov on 05.11.14.
//  Copyright (c) 2014 Anton Morozov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ex)

@property (nonatomic, assign) BOOL glowShadow;

- (id)findFirstResponder;
- (UIViewController *)parentViewController;

@end
