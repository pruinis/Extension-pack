//
//  NSTimeZone+Ex.m
//
//  Created by Anton Morozov on 23.01.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import "NSTimeZone+Ex.h"

@implementation NSTimeZone (Ex)

+(NSArray *)GMTabbreviations
{
    return @[
            @"GMT-11",
            @"GMT-10",
            @"GMT-9:30",
            @"GMT-9",
            @"GMT-8",
            @"GMT-7",
            @"GMT-6",
            @"GMT-5",
            @"GMT-4:30",
            @"GMT-4",
            @"GMT-3:30",
            @"GMT-3",
            @"GMT-2",
            @"GMT-1",
            @"GMT",
            @"GMT+1",
            @"GMT+2",
            @"GMT+3",
            @"GMT+3:30",
            @"GMT+4",
            @"GMT+4:30",
            @"GMT+5",
            @"GMT+5:30",
            @"GMT+5:45",
            @"GMT+6",
            @"GMT+6:30",
            @"GMT+7",
            @"GMT+8",
            @"GMT+8:45",
            @"GMT+9",
            @"GMT+9:30",
            @"GMT+10",
            @"GMT+10:30",
            @"GMT+11",
            @"GMT+11:30",
            @"GMT+12",
            @"GMT+13",
            @"GMT+13:45",
            @"GMT+14"
            ];
}

@end
