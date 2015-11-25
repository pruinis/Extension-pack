//
//  MKMapView+Ex.h
//
//  Created by Anton Morozov on 09.09.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Ex)

- (CLLocationCoordinate2D)getTopCenterCoordinate;
- (CLLocationDistance)getRadius;

@end
