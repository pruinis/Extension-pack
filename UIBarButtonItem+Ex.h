//
//  UIBarButtonItem+Ex.h
//
//  Created by Anton Morozov on 17.11.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Ex)

+ (UIBarButtonItem*)makeCustomBarButtonItemWithImageName:(NSString*)imgStr target:(id)target action:(SEL)action;

@end
