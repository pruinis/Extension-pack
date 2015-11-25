//
//  MKMapView+Ex.m
//
//  Created by Anton Morozov on 09.09.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import "MKMapView+Ex.h"

@implementation MKMapView (Ex)

- (CLLocationCoordinate2D)getCenterCoordinate
{
    CLLocationCoordinate2D centerCoor = [self centerCoordinate];
    return centerCoor;
}

- (CLLocationCoordinate2D)getTopCenterCoordinate
{
    // to get coordinate from CGPoint of your map
    CLLocationCoordinate2D topCenterCoor = [self convertPoint:CGPointMake(self.frame.size.width / 2.0f, 0) toCoordinateFromView:self];
    return topCenterCoor;
}

- (CLLocationDistance)getRadius
{
    CLLocationCoordinate2D centerCoor = [self getCenterCoordinate];
    // init center location from center coordinate
    CLLocation *centerLocation = [[CLLocation alloc] initWithLatitude:centerCoor.latitude longitude:centerCoor.longitude];
    
    CLLocationCoordinate2D topCenterCoor = [self getTopCenterCoordinate];
    CLLocation *topCenterLocation = [[CLLocation alloc] initWithLatitude:topCenterCoor.latitude longitude:topCenterCoor.longitude];
    CLLocationDistance radius = [centerLocation distanceFromLocation:topCenterLocation];
    
    return radius;
}


@end
