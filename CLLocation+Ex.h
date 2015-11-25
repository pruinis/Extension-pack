//
//  CLLocation+Ex.h
//
//  Created by Anton Morozov on 26.11.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

static CLLocation *referenceLocation;

@interface CLLocation (Extensions)

-(BOOL) isEqual:(CLLocation*)other; 
-(double) bearingToLocation:(CLLocation *) destinationLocation;
-(NSComparisonResult) compareToLocation:(CLLocation *)other;

// validation
-(BOOL)isValid;
-(BOOL)isValidOld;
-(BOOL)isValidRoutePoint;

+(BOOL)isValidCoordinate:(CLLocationCoordinate2D)coordinate;

@end