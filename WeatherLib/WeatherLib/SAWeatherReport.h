//
//  SAWeatherReport.h
//  WeatherLib
//
//  Created by SalahAldin Ghanim on 3/17/16.
//  Copyright © 2016 Salah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SACity.h"
#import "SAWeatherForecast.h"

@interface SAWeatherReport : NSObject
@property (retain, atomic, readonly) SACity* city;
@property (retain, atomic, readonly) NSArray* forecastArray;
- (instancetype) initWithJSON:(NSDictionary *) json;
- (instancetype) initWithCity:(SACity *) city andForecastArray:(NSArray *) forecast;
@end
