//
//  UIViewController+Ex.h
//
//  Created by Anton Morozov on 14.11.14.
//  Copyright (c) 2014 Anton Morozov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Ex)

//  Controller Title
-(void)setControllerTitle:(NSString*)title;

//  Navigetion Bar Color
-(void)makeBlueNavigetionBarColor;

// back button 
-(void)makeBackButtonArrow;

// visibleRect
-(CGSize)get_visible_view_size;

@end
