//
//  UIView+Ex.m
//
//  Created by Anton Morozov on 05.11.14.
//  Copyright (c) 2014 Anton Morozov. All rights reserved.
//

#import "UIView+Ex.h"

@implementation UIView (Ex)

-(void)setGlowShadow:(BOOL)glowShadow
{
    if (glowShadow) {
        self.layer.shadowColor = [UIColor whiteColor].CGColor;
        self.layer.shadowRadius = 10.0f;
        self.layer.shadowOpacity = 1.0f;
        self.layer.shadowOffset = CGSizeZero;
    } else {
        self.layer.shadowColor = [UIColor clearColor].CGColor;
        self.layer.shadowRadius = 0;
        self.layer.shadowOpacity = 0;
        self.layer.shadowOffset = CGSizeZero;
    }
}

-(BOOL)glowShadow
{
    if (self.layer.shadowColor == [UIColor whiteColor].CGColor && self.layer.shadowRadius == 10) {
        return YES;
    }
    return NO;
}

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        if ([subView isFirstResponder]) {
            return subView;
        }
    }
    return nil;
}

- (UIViewController *)parentViewController {
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    
    return nil;
}

@end
