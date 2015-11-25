//
//  CLLocation+Ex.m
//
//  Created by Anton Morozov on 26.11.13.
//  Copyright (c) 2013 Anton Morozov. All rights reserved.
//

#import "CLLocation+Ex.h"

#define satisfactorilyAccuracy  250.0

double DegreesToRadians(double degrees) {return degrees * M_PI / 180.0;};
double RadiansToDegrees(double radians) {return radians * 180.0/M_PI;};

@implementation CLLocation (Extensions)

-(BOOL) isEqual:(CLLocation*)other {
    
    if ([self distanceFromLocation:other] == 0)
    {
        return true;
    }
    return false;     
}

-(double) bearingToLocation:(CLLocation *) destinationLocation {
    
    double lat1 = DegreesToRadians(self.coordinate.latitude);
    double lon1 = DegreesToRadians(self.coordinate.longitude);
    
    double lat2 = DegreesToRadians(destinationLocation.coordinate.latitude);
    double lon2 = DegreesToRadians(destinationLocation.coordinate.longitude);
    
    double dLon = lon2 - lon1;
    
    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);
    double radiansBearing = atan2(y, x);
    
    if(radiansBearing < 0.0)
        radiansBearing += 2*M_PI;
    
    return RadiansToDegrees(radiansBearing);
}

-(NSComparisonResult) compareToLocation:(CLLocation *)other {
    CLLocationDistance thisDistance = [self distanceFromLocation:referenceLocation];
    CLLocationDistance thatDistance = [other distanceFromLocation:referenceLocation];
    if (thisDistance < thatDistance) { return NSOrderedAscending; }
    if (thisDistance > thatDistance) { return NSOrderedDescending; }
    return NSOrderedSame;
}


#pragma mark - Validation

-(BOOL)isValid
{
    // filter out nil locations
    if (!self){
        return NO;
    }
    
    if (!CLLocationCoordinate2DIsValid(self.coordinate)){
        return NO;
    }
    
    if(self.coordinate.latitude > 90 ||
       self.coordinate.latitude < -90 ||
       self.coordinate.longitude > 180 ||
       self.coordinate.longitude < -180)
    {
        return NO;
    }
    
    // newLocation is good to use
    return YES;
}

-(BOOL)isValidOld
{
    if (![self isValid]) {
        return NO;
    }
    
    // filter out points by invalid accuracy
    if (self.horizontalAccuracy <= 0 || self.horizontalAccuracy > satisfactorilyAccuracy){
        return NO;
    }
    
    // newLocation is good to use
    return YES;
}

-(BOOL)isValidRoutePoint
{
    if (![self isValid]) {
        return NO;
    }
    
    // filter out points by invalid accuracy
    if (self.horizontalAccuracy <= 0 || self.horizontalAccuracy > satisfactorilyAccuracy){
        return NO;
    }

    NSTimeInterval locationAge = -[self.timestamp timeIntervalSinceNow];
    if (locationAge > 5.0){
        return NO;
    }
    
    // newLocation is good to use
    return YES;
}


+(BOOL)isValidCoordinate:(CLLocationCoordinate2D)coordinate
{
    if (!CLLocationCoordinate2DIsValid(coordinate)){
        return NO;
    }
    
    if(coordinate.latitude > 90 ||
       coordinate.latitude < -90 ||
       coordinate.longitude > 180 ||
       coordinate.longitude < -180)
    {
        return NO;
    }
    
    // coordinate is good to use
    return YES;
}

@end

