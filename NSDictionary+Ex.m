//
//  NSDictionary+Ex.m
//
//  Created by Anton Morozov on 20.03.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import "NSDictionary+Ex.h"

@implementation NSDictionary (Ex)

-(BOOL)containsKey:(NSString*)key {
    BOOL retVal = 0;
    NSArray *allKeys = [self allKeys];
    retVal = [allKeys containsObject:key];
    return retVal;
}

@end
