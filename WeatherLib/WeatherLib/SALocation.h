//
//  SALocation.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SALocation : NSObject
@property (readonly) double latitude;
@property (readonly) double longitude;

- (instancetype)initWithLatitude:(double)latitude
                       longitude:(double)longitude;
@end
