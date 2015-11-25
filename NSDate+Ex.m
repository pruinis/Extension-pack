//
//  NSDate+Ex.m
//
//  Created by Anton Morozov on 02.06.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import "NSDate+Ex.h"

@implementation NSDate (Ex)

-(NSString*)timeLeftFromThisDate
{
    NSString *timeStr = @"";

    if (!self) {
        return timeStr;
    }
    
    NSTimeInterval distanceFromInv = [[NSDate date] timeIntervalSinceDate:self];
    NSInteger minute = distanceFromInv / 60;
    NSInteger hour = minute / 60;
    NSInteger days = minute / 1440;
    
    if (days) {
        timeStr = [NSString stringWithFormat:@"%ld days ago", (long)days];
        return timeStr;
    } else if (hour) {
        timeStr = [NSString stringWithFormat:@"%ld hour ago", (long)hour];
        return timeStr;
    } else if (minute) {
        timeStr = [NSString stringWithFormat:@"%ld minute ago", (long)minute];
        return timeStr;
    } else {
        timeStr = [NSString stringWithFormat:@"less minute ago"];
        return timeStr;
    }
}

-(NSInteger)daysToDate:(NSDate*)toDateTime
{
    if (!self) {
        return 0;
    }
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:toDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:self];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

-(BOOL)isSameDayAsDate:(NSDate*)otherDate {
    
    // From progrmr's answer...
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:otherDate];
    
    return [comp1 day]   == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year]  == [comp2 year];
}

-(BOOL) isLaterThanOrEqualTo:(NSDate*)date {
	return !([self compare:date] == NSOrderedAscending);
}

-(BOOL) isEarlierThanOrEqualTo:(NSDate*)date {
	return !([self compare:date] == NSOrderedDescending);
}
-(BOOL) isLaterThan:(NSDate*)date {
	return ([self compare:date] == NSOrderedDescending);
    
}
-(BOOL) isEarlierThan:(NSDate*)date {
	return ([self compare:date] == NSOrderedAscending);
}

-(NSDate *)toLocalTime
{
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

-(NSDate *)toGlobalTime
{
    NSTimeZone *tz = [NSTimeZone defaultTimeZone];
    NSInteger seconds = -[tz secondsFromGMTForDate: self];
    return [NSDate dateWithTimeInterval: seconds sinceDate: self];
}

@end
