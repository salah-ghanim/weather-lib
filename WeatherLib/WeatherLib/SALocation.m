//
//  SALocation.m
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import "SALocation.h"

@implementation SALocation

- (instancetype) initWithLatitude:(double)latitude longitude:(double)longitude
{
    self = [super init];
    if (self){
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

@end
