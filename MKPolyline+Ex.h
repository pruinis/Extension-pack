//
//  MKPolyline+Ex.h
//
//  Created by Anton Morozov on 17.03.15.
//  Copyright (c) 2015 Anton Morozov. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPolyline (Ex)

+ (MKPolyline *)googlePolylineWithEncodedString:(NSString *)encodedString;

@end
