//
//  UIViewController+Ex.m
//
//  Created by Anton Morozov on 14.11.14.
//  Copyright (c) 2014 Anton Morozov. All rights reserved.
//

#import "UIViewController+Ex.h"

// back button
#define BACK_BUTTON_ARROW_IMAGE_NAME   @"backButton2"
#define BACK_BUTTON_ARROW_IMAGE   [UIImage imageNamed:BACK_BUTTON_ARROW_IMAGE_NAME]
#define BAR_BLUE_COLOR [UIColor colorWithRed:39/255.0 green:72/255.0 blue:113/255.0 alpha:1]
#define NAV_BATTON_BLUE_COLOR [UIColor colorWithRed:84/255.0 green:137/255.0 blue:195/255.0 alpha:1]

#define TravFontMedium  @"HelveticaNeue-Medium"

@implementation UIViewController (Ex)

#pragma mark - Controller Title

-(void)setControllerTitle:(NSString*)title
{
    //Title
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    //    label.font = [UIFont boldSystemFontOfSize:15.0];
    label.font = [UIFont fontWithName:TravFontMedium size: 18.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    //    label.text = NSLocalizedString(title, @"");
    label.text = title;
    [label sizeToFit];
    
    self.navigationItem.titleView = label;
}

#pragma mark - Navigetion Bar Color

-(void)makeBlueNavigetionBarColor
{
    self.navigationController.navigationBar.barTintColor = BAR_BLUE_COLOR;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationController.navigationBar.translucent = NO;
}

-(void)makeBackButtonArrow
{
    // button title
    self.navigationController.navigationBar.topItem.title = @"";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // color
    self.navigationController.navigationBar.tintColor = NAV_BATTON_BLUE_COLOR;
    [[UINavigationBar appearance] setTintColor:NAV_BATTON_BLUE_COLOR];
    
    // custom img
    self.navigationController.navigationBar.backIndicatorImage = BACK_BUTTON_ARROW_IMAGE;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = BACK_BUTTON_ARROW_IMAGE;
    
    [[UINavigationBar appearance] setBackIndicatorImage:BACK_BUTTON_ARROW_IMAGE];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:BACK_BUTTON_ARROW_IMAGE];
}

#pragma mark - Visible Rect

-(CGSize)get_visible_view_size
{
//    http://www.creativepulse.gr/en/blog/2013/how-to-find-the-visible-width-and-height-in-an-ios-app
    
    CGSize result;
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        result.width = size.height;
        result.height = size.width;
    }
    else {
        result.width = size.width;
        result.height = size.height;
    }
    
    size = [[UIApplication sharedApplication] statusBarFrame].size;
    result.height -= MIN(size.width, size.height);
    
    if (self.navigationController != nil) {
        size = self.navigationController.navigationBar.frame.size;
        result.height -= MIN(size.width, size.height);
    }
    
    if (self.tabBarController != nil) {
        size = self.tabBarController.tabBar.frame.size;
        result.height -= MIN(size.width, size.height);
    }
    
    return result;
}

@end
