//
//  UIBarButtonItem+Ex.m
//
//  Created by Anton Morozov on 17.11.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import "UIBarButtonItem+Ex.h"

@implementation UIBarButtonItem (Ex)

+ (UIBarButtonItem*)makeCustomBarButtonItemWithImageName:(NSString*)imgStr target:(id)target action:(SEL)action
{
    UIImage *img = [UIImage imageNamed:imgStr];
    UIButton *btnName = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnName setFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
    [btnName setBackgroundImage:img forState:UIControlStateNormal];
    [btnName addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btnName];
}

@end
