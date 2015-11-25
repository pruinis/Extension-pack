//
//  NSDate+Ex.h
//
//  Created by Anton Morozov on 02.06.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Ex)

-(NSString*)timeLeftFromThisDate;
-(NSInteger)daysToDate:(NSDate*)toDateTime;
-(BOOL)isSameDayAsDate:(NSDate*)otherDate;
-(BOOL) isLaterThanOrEqualTo:(NSDate*)date;
-(BOOL) isEarlierThanOrEqualTo:(NSDate*)date;
-(BOOL) isLaterThan:(NSDate*)date;
-(BOOL) isEarlierThan:(NSDate*)date;

-(NSDate *)toLocalTime;
-(NSDate *)toGlobalTime;

@end
